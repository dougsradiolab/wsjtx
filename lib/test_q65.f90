program test_q65

  character*75 cmd1,cmd2,line
  character*22 msg
  character*8 arg
  character*1 csubmode
  integer naptype(1:6)
  logical decok

  nargs=iargc()
  if(nargs.ne.10) then
     print*,'Usage:   test_q65        "msg"       A-D depth freq  DT fDop TRp Q nfiles SNR'
     print*,'Example: test_q65 "K1ABC W9XYZ EN37"  A    3   1500 0.0  5.0  60 3  100   -20'
     print*,'Use SNR = 0 to loop over all relevant SNRs'
     print*,'Use MyCall=K1ABC, HisCall=W9XYZ, HisGrid="EN37" for AP decodes'
     print*,'Option Q sets QSOprogress (0-5) for AP decoding.'
     print*,'Add 16 to requested depth to enable message averaging.'
     go to 999
  endif
  call getarg(1,msg)
  call getarg(2,csubmode)
  call getarg(3,arg)
  read(arg,*) ndepth
  call getarg(4,arg)
  read(arg,*) nf0
  call getarg(5,arg)
  read(arg,*) dt
  call getarg(6,arg)
  read(arg,*) fDop
  call getarg(7,arg)
  read(arg,*) ntrperiod
  call getarg(8,arg)
  read(arg,*) nQSOprogress
  call getarg(9,arg)
  read(arg,*) nfiles
  call getarg(10,arg)
  read(arg,*) snr

  if(ntrperiod.eq.15) then
     nsps=1800
     i50=-23
  else if(ntrperiod.eq.30) then
     nsps=3600
     i50=-26
  else if(ntrperiod.eq.60) then
     nsps=7200
     i50=-29
  else if(ntrperiod.eq.120) then
     nsps=16000
     i50=-31
  else if(ntrperiod.eq.300) then
     nsps=41472
     i50=-35
  else
     stop 'Invalid TR period'
  endif

  i50=i50 + 8.0*log(1.0+fDop)/log(240.0)
  ia=i50 + 7
  ib=i50 - 10
  if(snr.ne.0.0) then
     ia=99
     ib=99
  endif

  baud=12000.0/nsps
  tsym=1.0/baud

!                1         2         3         4         5         6         7
!       123456789012345678901234567890123456789012345678901234567890123456789012345'
  cmd1='q65sim   "K1ABC W9XYZ EN37      " A 1500  5.0  0.0  60  100   -10.0 > junk0'
  cmd2='jt9 -3 -p  15 -L 300 -H 3000 -d  3 -b A -Q 3 -f 1500 *.wav > junk'

  write(cmd1(10:33),'(a)') '"'//msg//'"'
  cmd1(35:35)=csubmode
  write(cmd1(37:40),'(i4)') nf0
  write(cmd1(41:45),'(f5.0)') fDop
  write(cmd1(46:50),'(f5.2)') dt
  write(cmd1(51:54),'(i4)') ntrperiod
  write(cmd1(55:59),'(i5)') nfiles

  write(cmd2(11:13),'(i3)') ntrperiod
  write(cmd2(33:34),'(i2)') ndepth
  write(cmd2(44:44),'(i1)') nQSOprogress
  write(cmd2(49:52),'(i4)') nf0
  cmd2(39:39)=csubmode

  call system('rm -f *.wav')

!  call qra_params(ndepth,maxaptype,idf0max,idt0max,ibwmin,ibwmax,maxdist)
!  write(*,1000) ndepth,maxaptype,idf0max,idt0max,ibwmin,ibwmax,maxdist
!  write(12,1000) ndepth,maxaptype,idf0max,idt0max,ibwmin,ibwmax,maxdist
!1000 format(/'Depth:',i2,'  AP:',i2,'  df:',i3,'  dt:',i3,'  bw1:',i3,'  bw2:',i3,  &
!          '  dist:',i3)
  
  write(*,1010) (j,j=1,6)
  write(12,1010) (j,j=1,6)
1010 format(' SNR  Mode  d Dop Sync Avg Dec Bad',6i4,'  tdec   avg  rms'/  &
          75('-'))

  dterr=tsym/4.0
  nferr=max(1,nint(0.5*baud),nint(fdop/3.0))
  ndec1z=nfiles
  
  do nsnr=ia,ib,-1
     snr1=nsnr
     if(ia.eq.99) snr1=snr
     nsync=0
     ndec1=0
     nfalse=0
     naptype=0
     ndecn=0
     write(cmd1(63:67),'(f5.1)') snr1
     call system(cmd1)
     call sec0(0,tdec)
     call system(cmd2)
     call sec0(1,tdec)
     open(10,file='junk',status='unknown')
     n=0
     snrsum=0.
     snrsq=0.
     nsum=0
     do iline=1,9999
        read(10,'(a71)',end=10) line
        if(index(line,'<Decode').eq.1) cycle
        read(line,*) itime,xsnr,xdt,nf
        decok=index(line,trim(msg)).gt.0
        if(decok) then
           snrsum=snrsum + xsnr
           snrsq=snrsq + xsnr*xsnr
           nsum=nsum+1
        endif
        if((abs(xdt-dt).le.dterr .and. abs(nf-nf0).le.nferr) .or. decok) then
           nsync=nsync+1
        endif
        idec=-1
        iavg=0
        i0=23
        if(ntrperiod.le.30) i0=25
        if(line(i0:i0).ne.' ') then
           i1=index(line,'q')
           idec=-1
           read(line(i1+1:),*) idec
        endif
        if(idec.lt.0) cycle
        if(idec.ge.12) then
           iavg=idec-10
           idec=1
        endif
        if(decok) then
           ndecn=ndecn + 1
           if(iavg.le.1) ndec1=ndec1 + 1
           naptype(idec)=naptype(idec) + 1
        else
           nfalse=nfalse + 1
           print*,'False: ',line
        endif
     enddo
10   close(10)
     snr_avg=0.
     snr_rms=0.
     if(nsum.ge.1) then
        snr_avg=snrsum/nsum
        snr_rms=sqrt(snrsq/nsum - snr_avg**2)
     endif
     write(*,1100) snr1,ntrperiod,csubmode,ndepth,nint(fDop),nsync,ndecn,     &
          ndec1,nfalse,naptype,tdec/nfiles,snr_avg,snr_rms
     write(12,1100) snr1,ntrperiod,csubmode,ndepth,nint(fDop),nsync,ndecn,    &
          ndec1,nfalse,naptype,tdec/nfiles,snr_avg,snr_rms
1100 format(f5.1,i4,a1,i3,5i4,i5,5i4,f6.2,f6.1,f5.1)
     if(ndec1.lt.nfiles/2 .and. ndec1z.ge.nfiles/2) then
        snr_thresh=snr1 + float(nfiles/2 - ndec1)/(ndec1z-ndec1)
        open(13,file='snr_thresh.out',status='unknown',position='append')
        write(13,1200) ntrperiod,csubmode,ndepth,nQSOprogress,nfiles,   &
             fdop,snr_thresh,trim(msg)
1200    format(i3,a1,2i3,i5,2f7.1,2x,a)
        close(13)
     endif
     flush(6)
     flush(12)
     if(ndec1.eq.0 .and. ndecn.eq.0) exit           !Bail out if no decodes at this SNR
     ndec1z=ndec1
  enddo  ! nsnr

999 end program test_q65

include 'sec0.f90'

