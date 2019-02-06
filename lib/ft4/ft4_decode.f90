subroutine ft4_decode(cdatetime0,tbuf,nfa,nfb,nQSOProgress,nfqso,iwave,ndecodes,mycall,    &
     hiscall,nrx,line,data_dir)

   use packjt77
   include 'ft4_params.f90'
   parameter (NSS=NSPS/NDOWN)
   
   character message*37,msgsent*37
   character c77*77
   character*61 line,linex(100)
   character*37 decodes(100)
   character*512 data_dir,fname
   character*17 cdatetime0
   character*6 mycall,hiscall
   character*6 mycall0,hiscall0
   character*6 hhmmss

   complex cd2(0:NMAX/NDOWN-1)                  !Complex waveform
   complex cb(0:NMAX/NDOWN-1)
   complex cd(0:NN*NSS-1)                       !Complex waveform
   complex ctwk(4*NSS),ctwk2(4*NSS)
   complex csymb(NSS)
   complex cs(0:3,NN)
   real s4(0:3,NN)

   real bmeta(2*NN),bmetb(2*NN),bmetc(2*NN)
   real a(5)
   real llr(2*ND),llr2(2*ND),llra(2*ND),llrb(2*ND),llrc(2*ND)
   real s2(0:255)
   real candidate(3,100)
   real savg(NH1),sbase(NH1)

   integer nrxx(100)
   integer icos4a(0:3),icos4b(0:3),icos4c(0:3),icos4d(0:3)
   integer*2 iwave(NMAX)                 !Generated full-length waveform
   integer*1 message77(77),rvec(77),apbits(2*ND),apmask(2*ND),cw(2*ND)
   integer*1 hbits(2*NN)
   integer graymap(0:3)
   integer ip(1)
   integer nappasses(0:5)    ! # of decoding passes for QSO States 0-5
   integer naptypes(0:5,4)   ! nQSOProgress, decoding pass
   integer mcq(29),mcqru(29),mcqfd(29),mcqtest(29)
   integer mrrr(19),m73(19),mrr73(19)
   integer mcall(29),hcall(29)

   logical unpk77_success
   logical one(0:255,0:7)    ! 256 4-symbol sequences, 8 bits
   logical first
   
   data icos4a/0,1,3,2/
   data icos4b/1,0,2,3/
   data icos4c/2,3,1,0/
   data icos4d/3,2,0,1/
   data graymap/0,1,3,2/
   data first/.true./
   data     mcq/0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0/
   data   mcqru/0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,0,0,1,1,0,0/
   data   mcqfd/0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,0,0,1,0/
   data mcqtest/0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,1,0,1,1,1,1,1,1,0,0,1,0/
   data    mrrr/0,1,1,1,1,1,1,0,1,0,0,1,0,0,1,0,0,0,1/
   data     m73/0,1,1,1,1,1,1,0,1,0,0,1,0,1,0,0,0,0,1/
   data   mrr73/0,1,1,1,1,1,1,0,0,1,1,1,0,1,0,1,0,0,1/
   data rvec/0,1,0,0,1,0,1,0,0,1,0,1,1,1,1,0,1,0,0,0,1,0,0,1,1,0,1,1,0, &
             1,0,0,1,0,1,1,0,0,0,0,1,0,0,0,1,0,1,0,0,1,1,1,1,0,0,1,0,1, &
             0,1,0,1,0,1,1,0,1,1,1,1,1,0,0,0,1,0,1/
   save fs,dt,tt,txt,twopi,h,one,first,nrxx,linex,apbits,nappasses,naptypes,mycall0,hiscall0

   call clockit('ft4_deco',0)
   hhmmss=cdatetime0(8:13)

   if(first) then
      fs=12000.0/NDOWN                !Sample rate after downsampling
      dt=1/fs                         !Sample interval after downsample (s)
      tt=NSPS*dt                      !Duration of "itone" symbols (s)
      txt=NZ*dt                       !Transmission length (s) without ramp up/down
      twopi=8.0*atan(1.0)
      h=1.0 
      one=.false.
      do i=0,255
         do j=0,7
            if(iand(i,2**j).ne.0) one(i,j)=.true.
         enddo
      enddo
      first=.false.
   endif

   if(mycall.ne.mycall0 .or. hiscall.ne.hiscall0) then
      message=trim(mycall)//' '//trim(hiscall)//' '//'RR73'
      i3=-1
      n3=-1
      call pack77(message,i3,n3,c77)
      call unpack77(c77,0,msgsent,unpk77_success)
      if(message.ne.msgsent) write(*,*) 'ERROR setting AP message'
      read(c77,"(77i1)") message77 
      message77=mod(message77+rvec,2)
      call encode174_91(message77,cw)
      mcall=cw(1:29)
      hcall=cw(30:58)
      mycall0=mycall
      hiscall0=hiscall
   endif

   candidate=0.0
   ncand=0
   syncmin=1.2
   maxcand=100

   fa=nfa
   fb=nfb
   call clockit('getcand4',0)
   call getcandidates4(iwave,fa,fb,syncmin,nfqso,maxcand,savg,candidate,   &
        ncand,sbase)
   call clockit('getcand4',1)

   ndecodes=0
   do icand=1,ncand
      f0=candidate(1,icand)
      snr=candidate(3,icand)-1.0
      if( f0.le.375.0 .or. f0.ge.(5000.0-375.0) ) cycle
      call clockit('ft4_down',0)
      call ft4_downsample(iwave,f0,cd2)  !Downsample from 512 to 32 Sa/Symbol
      call clockit('ft4_down',1)

      sum2=sum(cd2*conjg(cd2))/(real(NMAX)/real(NDOWN))
      if(sum2.gt.0.0) cd2=cd2/sqrt(sum2)
! Sample rate is now 12000/16 = 750 samples/second
      do isync=1,2
         if(isync.eq.1) then
            idfmin=-12
            idfmax=12
            idfstp=3
            ibmin=0
            ibmax=374
            ibstp=4
         else
            idfmin=idfbest-4
            idfmax=idfbest+4
            idfstp=1
            ibmin=max(0,ibest-5)
            ibmax=min(ibest+5,NMAX/NDOWN-1)
            ibstp=1
         endif   
         ibest=-1
         smax=-99.
         idfbest=0
         do idf=idfmin,idfmax,idfstp
            a=0.
            a(1)=real(idf)
            ctwk=1.
            call clockit('twkfreq1',0)
            call twkfreq1(ctwk,4*NSS,fs,a,ctwk2)
            call clockit('twkfreq1',1)
            
            call clockit('sync4d  ',0)
            do istart=ibmin,ibmax,ibstp
               call sync4d(cd2,istart,ctwk2,1,sync,sync2)  !Find sync power
               if(sync.gt.smax) then
                  smax=sync
                  ibest=istart
                  idfbest=idf
               endif
            enddo
            call clockit('sync4d  ',1)
            
         enddo
      enddo
      f0=f0+real(idfbest)

!f0=1500
!ibest=219
      call clockit('ft4down ',0)
      call ft4_downsample(iwave,f0,cb) !Final downsample with corrected f0
      call clockit('ft4down ',1)
      sum2=sum(abs(cb)**2)/(real(NSS)*NN)
      if(sum2.gt.0.0) cb=cb/sqrt(sum2)
      cd=cb(ibest:ibest+NN*NSS-1)
      call clockit('four2a  ',0)
      do k=1,NN
         i1=(k-1)*NSS
         csymb=cd(i1:i1+NSS-1)
         call four2a(csymb,NSS,1,-1,1)
         cs(0:3,k)=csymb(1:4)
         s4(0:3,k)=abs(csymb(1:4))
      enddo
      call clockit('four2a  ',1)

! Sync quality check
      is1=0
      is2=0
      is3=0
      is4=0
      do k=1,4
         ip=maxloc(s4(:,k))
         if(icos4a(k-1).eq.(ip(1)-1)) is1=is1+1
         ip=maxloc(s4(:,k+33))
         if(icos4b(k-1).eq.(ip(1)-1)) is2=is2+1
         ip=maxloc(s4(:,k+66))
         if(icos4c(k-1).eq.(ip(1)-1)) is3=is3+1
         ip=maxloc(s4(:,k+99))
         if(icos4d(k-1).eq.(ip(1)-1)) is4=is4+1
      enddo
      nsync=is1+is2+is3+is4   !Number of hard sync errors, 0-16
      if(smax .lt. 0.7 .or. nsync .lt. 8) cycle

      do nseq=1,3             !Try coherent sequences of 1, 2, and 4 symbols
         if(nseq.eq.1) nsym=1
         if(nseq.eq.2) nsym=2
         if(nseq.eq.3) nsym=4
         nt=2**(2*nsym)
         do ks=1,NN-nsym+1,nsym  !87+16=103 symbols.    
            amax=-1.0
            do i=0,nt-1
               i1=i/64
               i2=iand(i,63)/16
               i3=iand(i,15)/4
               i4=iand(i,3)
               if(nsym.eq.1) then
                  s2(i)=abs(cs(graymap(i4),ks))
               elseif(nsym.eq.2) then
                  s2(i)=abs(cs(graymap(i3),ks)+cs(graymap(i4),ks+1))
               elseif(nsym.eq.4) then
                  s2(i)=abs(cs(graymap(i1),ks  ) + &
                     cs(graymap(i2),ks+1) + &
                     cs(graymap(i3),ks+2) + &
                     cs(graymap(i4),ks+3)   &
                     )
               else
                  print*,"Error - nsym must be 1, 2, or 4."
               endif
            enddo
            ipt=1+(ks-1)*2
            if(nsym.eq.1) ibmax=1
            if(nsym.eq.2) ibmax=3
            if(nsym.eq.4) ibmax=7
            do ib=0,ibmax
               bm=maxval(s2(0:nt-1),one(0:nt-1,ibmax-ib)) - &
                  maxval(s2(0:nt-1),.not.one(0:nt-1,ibmax-ib))
               if(ipt+ib.gt.2*NN) cycle
               if(nsym.eq.1) then
                  bmeta(ipt+ib)=bm
               elseif(nsym.eq.2) then
                  bmetb(ipt+ib)=bm
               elseif(nsym.eq.4) then
                  bmetc(ipt+ib)=bm
               endif
            enddo
         enddo
      enddo

      call clockit('normaliz',0)
      call normalizebmet(bmeta,2*NN)
      call normalizebmet(bmetb,2*NN)
      call normalizebmet(bmetc,2*NN)
      call clockit('normaliz',1)

      hbits=0
      where(bmeta.ge.0) hbits=1
      ns1=count(hbits(  1:  8).eq.(/0,0,0,1,1,0,1,1/))
      ns2=count(hbits( 67: 74).eq.(/0,1,0,0,1,1,1,0/))
      ns3=count(hbits(133:140).eq.(/1,1,1,0,0,1,0,0/))
      ns4=count(hbits(199:206).eq.(/1,0,1,1,0,0,0,1/))
      nsync_qual=ns1+ns2+ns3+ns4
      if(nsync_qual.lt. 20) cycle 

      scalefac=2.83
      llra(  1: 58)=bmeta(  9: 66)
      llra( 59:116)=bmeta( 75:132)
      llra(117:174)=bmeta(141:198)
      llra=scalefac*llra
      llrb(  1: 58)=bmetb(  9: 66)
      llrb( 59:116)=bmetb( 75:132)
      llrb(117:174)=bmetb(141:198)
      llrb=scalefac*llrb
      llrc(  1: 58)=bmetc(  9: 66)
      llrc( 59:116)=bmetc( 75:132)
      llrc(117:174)=bmetc(141:198)
      llrc=scalefac*llrc

      do isd=1,3
         if(isd.eq.1) llr=llra
         if(isd.eq.2) llr=llrb
         if(isd.eq.3) llr=llrc
!llr(1:59)=1.5*scalefac*(2*apbits(1:59)-1)
         apmask=0
!apmask(1:91)=1
         max_iterations=40
         do ibias=0,0
            llr2=llr
            if(ibias.eq.1) llr2=llr+0.4
            if(ibias.eq.2) llr2=llr-0.4
            call clockit('bpdecode',0)
            call bpdecode174_91(llr2,apmask,max_iterations,message77,     &
                 cw,nharderror,niterations)
            call clockit('bpdecode',1)
            if(nharderror.ge.0) exit
         enddo
         if(sum(message77).eq.0) cycle
         if( nharderror.ge.0 ) then
            message77=mod(message77+rvec,2)
            write(c77,'(77i1)') message77(1:77)
            call unpack77(c77,1,message,unpk77_success)
            idupe=0
            do i=1,ndecodes
               if(decodes(i).eq.message) idupe=1
            enddo
            if(idupe.eq.1) exit
            ndecodes=ndecodes+1
            decodes(ndecodes)=message
            if(snr.gt.0.0) then
               xsnr=10*log10(snr)-14.0
            else
               xsnr=-18.0
            endif
            nsnr=nint(xsnr)
            freq=f0
            tsig=mod(tbuf + ibest/750.0,100.0)

            write(line,1000) hhmmss,nsnr,tsig,nint(freq),message
1000        format(a6,i4,f5.1,i5,' + ',1x,a37)
            fname=trim(data_dir)//'/all_ft4.txt'
            open(24,file=trim(fname),status='unknown',position='append')
            write(24,1002) cdatetime0,nsnr,tsig,nint(freq),message,    &
               nharderror,nsync_qual,isd,niterations
            if(hhmmss.eq.'      ') write(*,1002) cdatetime0,nsnr,             &
                 tsig,nint(freq),message,nharderror,nsync_qual,isd,    &
                 niterations
1002        format(a17,i4,f5.1,i5,' Rx  ',a37,4i5)
            close(24)
            linex(ndecodes)=line

!### Temporary: assume most recent decoded message conveys "hiscall". ###
            i0=index(message,' ')
            if(i0.ge.3 .and. i0.le.7) then
               hiscall=message(i0+1:i0+6)
               i1=index(hiscall,' ')
               if(i1.gt.0) hiscall=hiscall(1:i1)
            endif
            nrx=-1
            if(index(message,'CQ ').eq.1) nrx=1
            if((index(message,trim(mycall)//' ').eq.1) .and.                 &
               (index(message,' '//trim(hiscall)//' ').ge.4)) then
               if(index(message,' 559 ').gt.8) nrx=2        !### Not right !
               if(index(message,' R 559 ').gt.8) nrx=3      !### Not right ! 
               if(index(message,' RR73 ').gt.8) nrx=4
            endif
            nrxx(ndecodes)=nrx
!###
            exit

         endif
      enddo !Sequence estimation
   enddo    !Candidate list
   call clockit('ft4_deco',1)
! clockit data directory does not get set properly on the Mac.
!   call clockit2(data_dir)
!   call clockit('ft4_deco',101)   
   return

   entry get_ft4msg(idecode,nrx,line)
   line=linex(idecode)
   nrx=nrxx(idecode)
   return

end subroutine ft4_decode

subroutine ft4_downsample(iwave,f0,c)

! Input: i*2 data in iwave() at sample rate 12000 Hz
! Output: Complex data in c(), sampled at 1200 Hz

   include 'ft4_params.f90'
   parameter (NFFT2=NMAX/16)
   integer*2 iwave(NMAX)
   complex c(0:NMAX/NDOWN-1)
   complex c1(0:NFFT2-1)
   complex cx(0:NMAX/2)
   real x(NMAX), window(0:NFFT2-1)
   equivalence (x,cx)
   logical first
   data first/.true./
   save first,window 

   df=12000.0/NMAX
   baud=12000.0/NSPS
   if(first) then
      bw_transition = 0.5*baud
      bw_flat = 4*baud
      iwt = bw_transition / df
      iwf = bw_flat / df
      pi=4.0*atan(1.0)
      window(0:iwt-1) = 0.5*(1+cos(pi*(/(i,i=iwt-1,0,-1)/)/iwt))
      window(iwt:iwt+iwf-1)=1.0
      window(iwt+iwf:2*iwt+iwf-1) = 0.5*(1+cos(pi*(/(i,i=0,iwt)/)/iwt))
      window(2*iwt+iwf:)=0.0
      iws = baud / df
      window=cshift(window,iws)
      first=.false.
   endif

   x=iwave
   call four2a(x,NMAX,1,-1,0)             !r2c FFT to freq domain
   i0=nint(f0/df)
   c1=0.
   c1(0)=cx(i0)
   do i=1,NFFT2/2
      if(i0+i.le.NMAX/2) c1(i)=cx(i0+i)
      if(i0-i.ge.0) c1(NFFT2-i)=cx(i0-i)
   enddo
   c1=c1*window/NFFT2
   call four2a(c1,NFFT2,1,1,1)            !c2c FFT back to time domain
   c=c1(0:NMAX/NDOWN-1)

   return
end subroutine ft4_downsample

