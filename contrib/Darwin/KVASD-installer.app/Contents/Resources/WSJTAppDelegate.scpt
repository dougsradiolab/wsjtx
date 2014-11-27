FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     �� 	 
��   	 #   WSJTAppDelegate.applescript    
 �   :     W S J T A p p D e l e g a t e . a p p l e s c r i p t      l     ��  ��       KVASD-installer     �   "     K V A S D - i n s t a l l e r      l     ��������  ��  ��        l     ��  ��    V P    This script is a drag and drop target that expects a WSJT-X app bundle path.     �   �         T h i s   s c r i p t   i s   a   d r a g   a n d   d r o p   t a r g e t   t h a t   e x p e c t s   a   W S J T - X   a p p   b u n d l e   p a t h .      l     ��  ��    U O    It can also be opened with a file list or by dropping a suitable WSJT-X app     �   �         I t   c a n   a l s o   b e   o p e n e d   w i t h   a   f i l e   l i s t   o r   b y   d r o p p i n g   a   s u i t a b l e   W S J T - X   a p p      l     ��   ��    Q K    bundle onto it. Alternatively a target WSJT-X application bundle may be      � ! ! �         b u n d l e   o n t o   i t .   A l t e r n a t i v e l y   a   t a r g e t   W S J T - X   a p p l i c a t i o n   b u n d l e   m a y   b e   " # " l     �� $ %��   $ > 8    selected by clicking the "Choose target ..." button.    % � & & p         s e l e c t e d   b y   c l i c k i n g   t h e   " C h o o s e   t a r g e t   . . . "   b u t t o n . #  ' ( ' l     ��������  ��  ��   (  ) * ) l     �� + ,��   + U O    It fetches the KVASD EULA text and displays it in a dialog which the reader    , � - - �         I t   f e t c h e s   t h e   K V A S D   E U L A   t e x t   a n d   d i s p l a y s   i t   i n   a   d i a l o g   w h i c h   t h e   r e a d e r *  . / . l     �� 0 1��   0 U O    must at least scroll to the end before clicking the Agree button which then    1 � 2 2 �         m u s t   a t   l e a s t   s c r o l l   t o   t h e   e n d   b e f o r e   c l i c k i n g   t h e   A g r e e   b u t t o n   w h i c h   t h e n /  3 4 3 l     �� 5 6��   5 V P    downloads the appropriate KVASD executable. The MD5 hash checksum is checked    6 � 7 7 �         d o w n l o a d s   t h e   a p p r o p r i a t e   K V A S D   e x e c u t a b l e .   T h e   M D 5   h a s h   c h e c k s u m   i s   c h e c k e d 4  8 9 8 l     �� : ;��   : "     on the KVASD executable.    ; � < < 8         o n   t h e   K V A S D   e x e c u t a b l e . 9  = > = l     ��������  ��  ��   >  ? @ ? l     �� A B��   A T N    Once the EULA has been accepted the "Install" button is enabled to install    B � C C �         O n c e   t h e   E U L A   h a s   b e e n   a c c e p t e d   t h e   " I n s t a l l "   b u t t o n   i s   e n a b l e d   t o   i n s t a l l @  D E D l     �� F G��   F S M    the KVASD executable into the target WSJT-X application bundle(s) and the    G � H H �         t h e   K V A S D   e x e c u t a b l e   i n t o   t h e   t a r g e t   W S J T - X   a p p l i c a t i o n   b u n d l e ( s )   a n d   t h e E  I J I l     �� K L��   K R L    RPATHs are modified to reference the libgcc support libraries inside the    L � M M �         R P A T H s   a r e   m o d i f i e d   t o   r e f e r e n c e   t h e   l i b g c c   s u p p o r t   l i b r a r i e s   i n s i d e   t h e J  N O N l     �� P Q��   P $     WSJT-X application bundle.    Q � R R <         W S J T - X   a p p l i c a t i o n   b u n d l e . O  S T S l     ��������  ��  ��   T  U V U l     �� W X��   W 9 3  Created by Bill Somerville (G4WJS) on 12/11/2014.    X � Y Y f     C r e a t e d   b y   B i l l   S o m e r v i l l e   ( G 4 W J S )   o n   1 2 / 1 1 / 2 0 1 4 . V  Z [ Z l     ��������  ��  ��   [  \ ] \ l     �� ^ _��   ^ Y S  The author of this work hereby waives all claim of copyright (economic and moral)    _ � ` ` �     T h e   a u t h o r   o f   t h i s   w o r k   h e r e b y   w a i v e s   a l l   c l a i m   o f   c o p y r i g h t   ( e c o n o m i c   a n d   m o r a l ) ]  a b a l     �� c d��   c ^ X  in this work and immediately places it in the public domain; it may be used, distorted    d � e e �     i n   t h i s   w o r k   a n d   i m m e d i a t e l y   p l a c e s   i t   i n   t h e   p u b l i c   d o m a i n ;   i t   m a y   b e   u s e d ,   d i s t o r t e d b  f g f l     �� h i��   h c ]  or destroyed in any manner whatsoever without further attribution or notice to the creator.    i � j j �     o r   d e s t r o y e d   i n   a n y   m a n n e r   w h a t s o e v e r   w i t h o u t   f u r t h e r   a t t r i b u t i o n   o r   n o t i c e   t o   t h e   c r e a t o r . g  k l k l     ��������  ��  ��   l  m n m l     ��������  ��  ��   n  o p o l     �� q r��   q ( " curl wraps cURL to download files    r � s s D   c u r l   w r a p s   c U R L   t o   d o w n l o a d   f i l e s p  t u t h     �� v�� 0 curl   v k       w w  x y x i      z { z I      �� |���� 0 download   |  } ~ } o      ���� 0 url   ~   �  o      ���� 0 filename fileName �  ��� � o      ���� 0 destination  ��  ��   { k     / � �  � � � r      � � � b      � � � o     ���� 0 destination   � o    ���� 0 filename fileName � o      ���� 0 file   �  � � � Q    * � � � � I  	 �� ���
�� .sysoexecTEXT���     TEXT � b   	  � � � b   	  � � � b   	  � � � b   	  � � � m   	 
 � � � � � P c u r l   - - f a i l   - - r e t r y   5   - - s i l e n t   - - o u t p u t   � o   
 ���� 0 file   � m     � � � � �    � o    ���� 0 url   � o    ���� 0 filename fileName��   � R      ������
�� .ascrerr ****      � ****��  ��   � R    *�� ���
�� .ascrerr ****      � **** � b     ) � � � b     ' � � � b     % � � � b     # � � � m     ! � � � � � < A n   e r r o r   o c c u r r e d   d o w n l o a d i n g : � o   ! "��
�� 
ret  � o   # $��
�� 
ret  � o   % &���� 0 url   � o   ' (���� 0 filename fileName��   �  ��� � L   + / � � c   + . � � � o   + ,���� 0 file   � m   , -��
�� 
psxf��   y  � � � l     ��������  ��  ��   �  ��� � i     � � � I      �� ����� 0 downloadmd5 downloadMD5 �  � � � o      ���� 0 url   �  ��� � o      ���� 0 filename fileName��  ��   � k     ) � �  � � � r      � � � m      � � � � �  . m d 5 � o      ���� 0 md5ext md5Ext �  ��� � Q    ) � � � � L     � � I   �� ���
�� .sysoexecTEXT���     TEXT � b     � � � b     � � � b     � � � b    
 � � � m     � � � � � > c u r l   - - f a i l   - - r e t r y   5   - - s i l e n t   � o    	���� 0 url   � o   
 ���� 0 filename fileName � l 
   ����� � o    ���� 0 md5ext md5Ext��  ��   � m     � � � � � �   |   a w k   ' { m a t c h ( $ 0 , " [ [ : x d i g i t : ] ] { 3 2 } " ) ;   p r i n t   s u b s t r ( $ 0 , R S T A R T , R L E N G T H ) } '��   � R      ������
�� .ascrerr ****      � ****��  ��   � R    )�� ���
�� .ascrerr ****      � **** � b    ( � � � b    & � � � b    $ � � � b    " � � � m      � � � � � : A n   e r r o r   o c c u r r e d   d o w n l o a d i n g � o     !��
�� 
ret  � o   " #��
�� 
ret  � o   $ %���� 0 filename fileName � o   & '���� 0 md5ext md5Ext��  ��  ��   u  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � A ; kvasd looks after fetching kvasd files from the web source    � � � � v   k v a s d   l o o k s   a f t e r   f e t c h i n g   k v a s d   f i l e s   f r o m   t h e   w e b   s o u r c e �  � � � h    �� ��� 	0 kvasd   � k       � �  � � � j     �� ��� 0 
serverpath 
serverPath � m      � � � � � n h t t p s : / / s v n . c o d e . s f . n e t / p / w s j t / w s j t / t r u n k / k v a s d - b i n a r y / �  � � � j    �� ��� 0 destination   � m     � � � � � 
 / t m p / �  � � � j    �� ��� 0 
targetname 
targetName � m     � � � � � 
 k v a s d �  � � � l     ��������  ��  ��   �  � � � i   	  � � � I      �������� 0 	fetcheula 	fetchEULA��  ��   � L      � � n     � � � I    �� ����� 0 download   �  � � � o    
���� 0 
serverpath 
serverPath �  � � � b   
    o   
 ���� 0 
targetname 
targetName m     �  _ e u l a . t x t � �� o    ���� 0 destination  ��  ��   � o     ���� 0 curl   �  l     ��������  ��  ��    i    	
	 I      �������� 0 fetchbinary fetchBinary��  ��  
 k     i  r      b      o     ���� 0 
serverpath 
serverPath I   ����
�� .sysoexecTEXT���     TEXT b     m     � 4 e c h o   ` u n a m e   - s ` - ` u n a m e   - m ` m     �  /��   o      �� 0 url    r    ! n    I    �~�}�~ 0 downloadmd5 downloadMD5  !  o    �|�| 0 url  ! "�{" o    �z�z 0 
targetname 
targetName�{  �}   o    �y�y 0 curl   o      �x�x 0 md5sum md5Sum #$# r   " 8%&% n  " 6'(' I   ' 6�w)�v�w 0 download  ) *+* o   ' (�u�u 0 url  + ,-, o   ( -�t�t 0 
targetname 
targetName- .�s. o   - 2�r�r 0 destination  �s  �v  ( o   " '�q�q 0 curl  & o      �p�p 0 file  $ /0/ r   9 F121 I  9 D�o3�n
�o .sysoexecTEXT���     TEXT3 b   9 @454 b   9 >676 m   9 :88 �99  m d 5  7 l  : =:�m�l: n   : =;<; 1   ; =�k
�k 
psxp< o   : ;�j�j 0 file  �m  �l  5 m   > ?== �>>     |   c u t   - d '   '   - f 4�n  2 o      �i�i 0 md5calc md5Calc0 ?�h? Z   G i@A�g�f@ >   G JBCB o   G H�e�e 0 md5calc md5CalcC o   H I�d�d 0 md5sum md5SumA R   M e�cDE
�c .ascrerr ****      � ****D b   Q dFGF b   Q bHIH b   Q `JKJ b   Q ^LML b   Q \NON b   Q ZPQP b   Q XRSR b   Q VTUT b   Q TVWV m   Q RXX �YY J K V A S D   d o w n l o a d   c o r r u p t   M D 5   h a s h   c h e c kW o   R S�b
�b 
ret U l 
 T UZ�a�`Z o   T U�_
�_ 
ret �a  �`  S m   V W[[ �\\    e x p e c t e d   [Q o   X Y�^�^ 0 md5sum md5SumO m   Z []] �^^  ]M l 
 \ ]_�]�\_ o   \ ]�[
�[ 
ret �]  �\  K m   ^ _`` �aa        a c t u a l   [I o   ` a�Z�Z 0 md5calc md5CalcG l 	 b cb�Y�Xb m   b ccc �dd  ]�Y  �X  E �We�V
�W 
errne m   O P�U�U��V  �g  �f  �h   fgf l     �T�S�R�T  �S  �R  g hih i    jkj I      �Q�P�O�Q 0 savelicense saveLicense�P  �O  k k     *ll mnm r     opo l 	   q�N�Mq I    �L�Kr
�L .sysostflalis    ��� null�K  r �Jst
�J 
prmps l 	  u�I�Hu m    vv �ww B S p e c i f y   f o l d e r   t o   s a v e   l i c e n s e   t o�I  �H  t �Gx�F
�G 
dflcx l   	y�E�Dy I   	�Cz�B
�C .earsffdralis        afdrz m    �A
�A afdrdocs�B  �E  �D  �F  �N  �M  p o      �@�@ 0 dest  n {�?{ O   *|}| l 	  )~�>�=~ I   )�<�
�< .coreclon****      � **** c    #��� l   !��;�:� b    !��� b    ��� o    �9�9 0 destination  � o    �8�8 0 
targetname 
targetName� m     �� ���  _ e u l a . t x t�;  �:  � m   ! "�7
�7 
psxf� �6��5
�6 
insh� o   $ %�4�4 0 dest  �5  �>  �=  } m    ���                                                                                  MACS  alis    l  	vbox-os-x                  Π�H+   ��
Finder.app                                                      ���\��        ����  	                CoreServices    Π�      �\�r     �� Hp Hn  3vbox-os-x:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p   	 v b o x - o s - x  &System/Library/CoreServices/Finder.app  / ��  �?  i ��� l     �3�2�1�3  �2  �1  � ��0� i    ��� I      �/�.�-�/ 0 printlicense printLicense�.  �-  � O    ��� l 	  ��,�+� I   �*��)
�* .aevtpdocnull���     obj � c    ��� l   ��(�'� b    ��� b    ��� o    	�&�& 0 destination  � o   	 �%�% 0 
targetname 
targetName� m    �� ���  _ e u l a . t x t�(  �'  � m    �$
�$ 
psxf�)  �,  �+  � m     ���                                                                                  MACS  alis    l  	vbox-os-x                  Π�H+   ��
Finder.app                                                      ���\��        ����  	                CoreServices    Π�      �\�r     �� Hp Hn  3vbox-os-x:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p   	 v b o x - o s - x  &System/Library/CoreServices/Finder.app  / ��  �0   � ��� l     �#�"�!�#  �"  �!  � ��� h    � ��  "0 wsjtappdelegate WSJTAppDelegate� k      �� ��� j     ��
� 
pare� 4     ��
� 
pcls� m    �� ���  N S O b j e c t� ��� l     ����  �  �  � ��� j   	 ��� 0 licenceagreed licenceAgreed� m   	 
�
� boovfals� ��� l     ����  �  �  � ��� j    ��� 0 
mainwindow 
mainWindow� m    �
� 
msng� ��� j    ��� 0 eulatextview eulaTextView� m    �
� 
msng� ��� j    ��� 0 progressbar progressBar� m    �
� 
msng� ��� j    ��� 0 
savebutton 
saveButton� m    �
� 
msng� ��� j    ��� 0 printbutton printButton� m    �
� 
msng� ��� j    ��� 0 agreecheckbox agreeCheckBox� m    �

�
 
msng� ��� j     �	��	 (0 choosetargetbutton chooseTargetButton� m    �
� 
msng� ��� j   ! #��� 0 installbutton installButton� m   ! "�
� 
msng� ��� l     ����  �  �  � ��� j   $ '��� $0 bundlestoprocess bundlesToProcess� J   $ &��  � ��� l     � �����   ��  ��  � ��� p   ( (�� ������ 60 defaultnotificationcentre defaultNotificationCentre��  � ��� l     ��������  ��  ��  � ��� i   ( +��� I      ������� 	0 split  � ��� o      ���� 0 thetext theText� ���� o      ���� 0 thedelimiters theDelimiters��  ��  � k     �� ��� r     ��� n    ��� 1    ��
�� 
txdl� 1     ��
�� 
ascr� o      ���� 0 olddelimiters oldDelimiters� ��� r    ��� o    ���� 0 thedelimiters theDelimiters� n     ��� 1    
��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� l   ������ n    ��� 2   ��
�� 
citm� o    ���� 0 thetext theText��  ��  � o      ���� 0 	theresult 	theResult� ��� r    ��� o    ���� 0 olddelimiters oldDelimiters� n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ���� L    �� o    ���� 0 	theresult 	theResult��  � ��� l     ��������  ��  ��  � ��� l     ������  �   do the install   � �      d o   t h e   i n s t a l l�  i   , / I      �������� 0 process  ��  ��   X    ��� Q   �	 k   �

  r    ! n    I    ������ "0 bundlewithpath_ bundleWithPath_ �� o    ���� 0 
bundlepath 
bundlePath��  ��   n    o    ���� 0 nsbundle NSBundle m    ��
�� misccura o      ���� 0 wsjtxbundle wsjtxBundle  Z   " H���� G   " 3 =   " % o   " #���� 0 wsjtxbundle wsjtxBundle m   # $��
�� 
msng >   ( 1 c   ( /  n  ( -!"! I   ) -�������� $0 bundleidentifier bundleIdentifier��  ��  " o   ( )���� 0 wsjtxbundle wsjtxBundle  m   - .��
�� 
ctxt m   / 0## �$$  o r g . k 1 j t . w s j t x R   6 D��%&
�� .ascrerr ****      � ****% c   : C'(' b   : A)*) b   : ?+,+ b   : =-.- m   : ;// �00 \ N o t   a n   a p p r o p r i a t e   W S J T - X   a p p l i c a t i o n   b u n d l e :  . o   ; <��
�� 
ret , l 
 = >1����1 o   = >��
�� 
ret ��  ��  * o   ? @���� 0 
bundlepath 
bundlePath( m   A B��
�� 
ctxt& ��2��
�� 
errn2 m   8 9�������  ��  ��   343 r   I R565 c   I P787 n  I N9:9 I   J N�������� 0 
bundlepath 
bundlePath��  ��  : o   I J���� 0 wsjtxbundle wsjtxBundle8 m   N O��
�� 
ctxt6 o      ���� 0 installroot installRoot4 ;<; I  S u��=>
�� .sysodlogaskr        TEXT= b   S \?@? b   S ZABA b   S XCDC m   S VEE �FF H I n s t a l l   K V A S D   i n t o   A p l i c a t i o n   B u n d l eD o   V W��
�� 
ret B l 
 X YG����G o   X Y��
�� 
ret ��  ��  @ l 
 Z [H����H o   Z [���� 0 installroot installRoot��  ��  > ��IJ
�� 
btnsI J   _ gKK LML m   _ bNN �OO  O kM P��P m   b eQQ �RR  S k i p��  J ��S��
�� 
dfltS J   j oTT U��U m   j mVV �WW  O k��  ��  < X��X Z   v�YZ����Y =   v �[\[ n   v }]^] 1   y }��
�� 
bhit^ 1   v y��
�� 
rslt\ m   } �__ �``  O kZ Q   ��abca k   �cdd efe r   � �ghg b   � �iji b   � �klk o   � ����� 0 installroot installRootl m   � �mm �nn   / C o n t e n t s / M a c O S /j n  � �opo o   � ����� 0 
targetname 
targetNamep o   � ����� 	0 kvasd  h o      ���� 
0 target  f qrq I  � ���s��
�� .ascrcmnt****      � ****s I  � ���t��
�� .sysoexecTEXT���     TEXTt b   � �uvu b   � �wxw b   � �yzy b   � �{|{ m   � �}} �~~  m v  | n  � �� o   � ����� 0 destination  � o   � ����� 	0 kvasd  z n  � ���� o   � ����� 0 
targetname 
targetName� o   � ����� 	0 kvasd  x 1   � ���
�� 
spacv o   � ����� 
0 target  ��  ��  r ��� X   �1����� Z   �,������� F   � ���� E   � ���� o   � ����� 0 theline theLine� m   � ��� ���  . d y l i b� H   � ��� E   � ���� o   � ����� 0 theline theLine� m   � ��� ���  l i b S y s t e m� k   �(�� ��� r   ���� n   � ���� 4 � ����
�� 
cobj� m   � ����� � I   � �������� 	0 split  � ��� o   � ����� 0 theline theLine� ���� J   � ��� ��� 1   � ���
�� 
tab � ���� 1   � ���
�� 
spac��  ��  ��  � o      ���� 0 thedylib theDylib� ���� I (�����
�� .ascrcmnt****      � ****� I $�����
�� .sysoexecTEXT���     TEXT� b   ��� b  ��� b  ��� b  ��� b  ��� m  �� ��� 4 i n s t a l l _ n a m e _ t o o l   - c h a n g e  � o  ���� 0 thedylib theDylib� m  
�� ��� $   @ e x e c u t a b l e _ p a t h /� n  ��� 4 ���
�� 
cobj� m  ������� I  ������� 	0 split  � ��� o  ���� 0 thedylib theDylib� ���� J  �� ���� m  �� ���  /��  ��  ��  � 1  �
� 
spac� o  �~�~ 
0 target  ��  ��  ��  ��  ��  �� 0 theline theLine� n   � ���� 2  � ��}
�} 
cpar� l  � ���|�{� I  � ��z��y
�z .sysoexecTEXT���     TEXT� b   � ���� m   � ��� ���  o t o o l   - L  � o   � ��x�x 
0 target  �y  �|  �{  � ��� I 2?�w��v
�w .ascrcmnt****      � ****� I 2;�u��t
�u .sysoexecTEXT���     TEXT� b  27��� m  25�� ���  c h m o d   + x  � o  56�s�s 
0 target  �t  �v  � ��r� I @c�q��
�q .sysodisAaleR        TEXT� b  @I��� b  @G��� b  @E��� m  @C�� ��� P K V A S D   i n s t a l l e d   i n t o   a p p l i c a t i o n   b u n d l e :� o  CD�p
�p 
ret � o  EF�o
�o 
ret � l 
GH��n�m� o  GH�l�l 0 installroot installRoot�n  �m  � �k��
�k 
btns� J  LQ�� ��j� m  LO�� ���  O k�j  � �i��
�i 
dflt� l 	TW��h�g� m  TW�� ���  O k�h  �g  � �f��e
�f 
givu� m  Z]�d�d �e  �r  b R      �c��b
�c .ascrerr ****      � ****� o      �a�a 0 errorstring errorString�b  c R  k��`��_
�` .ascrerr ****      � ****� b  m���� b  m~��� b  mz��� b  mx��� b  mv��� b  mt��� b  mr��� m  mp�� ��� Z F a i l e d   t o   m o v e   K V A S D   i n t o   a p p l i c a t i o n   b u n d l e :� o  pq�^
�^ 
ret � o  rs�]
�] 
ret � l 
tu��\�[� o  tu�Z�Z 0 installroot installRoot�\  �[  � o  vw�Y
�Y 
ret � o  xy�X
�X 
ret � m  z}�� ���  E r r o r :  � o  ~�W�W 0 errorstring errorString�_  ��  ��  ��   R      �V��U
�V .ascrerr ****      � ****� o      �T�T 0 errorstring errorString�U  	 I ���S��
�S .sysodisAaleR        TEXT� o  ���R�R 0 errorstring errorString� �Q 
�Q 
as A  m  ���P
�P EAlTwarN �O
�O 
btns J  �� �N m  �� �  O k�N   �M�L
�M 
dflt m  ��		 �

  O k�L  �� 0 
bundlepath 
bundlePath o    �K�K $0 bundlestoprocess bundlesToProcess  l     �J�I�H�J  �I  �H    l     �G�G   H B execute around handler to display a progress bar during an action    � �   e x e c u t e   a r o u n d   h a n d l e r   t o   d i s p l a y   a   p r o g r e s s   b a r   d u r i n g   a n   a c t i o n  i   0 3 I      �F�E�F  0 progressaction progressAction �D o      �C�C 
0 action  �D  �E   k        n    
 I    
�B�A�B "0 startanimation_ startAnimation_ �@  f    �@  �A   o     �?�? 0 progressbar progressBar   O   !"! I   �>�=�<
�> .aevtoappnull  �   � ****�=  �<  " o    �;�; 
0 action    #�:# n    $%$ I     �9&�8�9  0 stopanimation_ stopAnimation_& '�7'  f    �7  �8  % o    �6�6 0 progressbar progressBar�:   ()( l     �5�4�3�5  �4  �3  ) *+* l     �2�1�0�2  �1  �0  + ,-, l     �/./�/  . %  NSApplicationDelegate Protocol   / �00 >   N S A p p l i c a t i o n D e l e g a t e   P r o t o c o l- 121 l     �.�-�,�.  �-  �,  2 343 i   4 7565 I      �+7�*�+ B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_7 8�)8 o      �(�( 0 anotification aNotification�)  �*  6 Q     }9:;9 k    o<< =>= n   ?@? I    �'A�&�' 40 registerfordraggedtypes_ registerForDraggedTypes_A B�%B J    CC D�$D m    	EE �FF  p u b l i c . f i l e - u r l�$  �%  �&  @ o    �#�# 0 
mainwindow 
mainWindow> GHG l   �"�!� �"  �!  �   H IJI r    KLK n   MNM I    ���� 0 defaultcenter defaultCenter�  �  N n   OPO o    �� ,0 nsnotificationcenter NSNotificationCenterP m    �
� misccuraL o      �� 60 defaultnotificationcentre defaultNotificationCentreJ QRQ n   $STS I    $�U�� 0 seteditable_ setEditable_U V�V m     �
� boovfals�  �  T o    �� 0 eulatextview eulaTextViewR WXW l  % %����  �  �  X YZY h   % ,�[� 0 downloadeula downloadEula[ n    \]\ I    �^�� 0 
setstring_ 
setString_^ _�_ I   �`�
� .rdwrread****        ****` n   aba I   
 ��
�	� 0 	fetcheula 	fetchEULA�
  �	  b o    
�� 	0 kvasd  �  �  �  ] o     �� 0 eulatextview eulaTextViewZ cdc n  - 3efe I   . 3�g��  0 progressaction progressActiong h�h o   . /�� 0 downloadeula downloadEula�  �  f  f   - .d iji n  4 >klk I   9 >�m�� 0 setenabled_ setEnabled_m n� n m   9 :��
�� boovtrue�   �  l o   4 9���� 0 
savebutton 
saveButtonj opo n  ? Iqrq I   D I��s���� 0 setenabled_ setEnabled_s t��t m   D E��
�� boovtrue��  ��  r o   ? D���� 0 printbutton printButtonp uvu l  J J��������  ��  ��  v wxw l  J J��yz��  y < 6 add observers for view port changes on EULA text view   z �{{ l   a d d   o b s e r v e r s   f o r   v i e w   p o r t   c h a n g e s   o n   E U L A   t e x t   v i e wx |}| r   J O~~ n  J M��� o   K M���� F0 !nsviewboundsdidchangenotification !NSViewBoundsDidChangeNotification� m   J K��
�� misccura o      ���� (0 boundschangenotice boundsChangeNotice} ��� r   P U��� n  P S��� o   Q S���� D0  nsviewframedidchangenotification  NSViewFrameDidChangeNotification� m   P Q��
�� misccura� o      ���� &0 framechangenotice frameChangeNotice� ��� n  V a��� I   W a������� F0 !addobserver_selector_name_object_ !addObserver_selector_name_object_� ���  f   W X� ��� m   X Y�� ���  v i e w C h a n g e d :� ��� o   Y Z���� (0 boundschangenotice boundsChangeNotice� ���� m   Z [��
�� 
msng��  ��  � o   V W���� 60 defaultnotificationcentre defaultNotificationCentre� ���� n  b o��� I   c o������� F0 !addobserver_selector_name_object_ !addObserver_selector_name_object_� ���  f   c d� ��� m   d g�� ���  v i e w C h a n g e d :� ��� o   g h���� &0 framechangenotice frameChangeNotice� ���� m   h i��
�� 
msng��  ��  � o   b c���� 60 defaultnotificationcentre defaultNotificationCentre��  : R      �����
�� .ascrerr ****      � ****� o      ���� 0 errorstring errorString��  ; I   w }������� 	0 abort  � ���� o   x y���� 0 errorstring errorString��  ��  4 ��� l     ��������  ��  ��  � ��� i   8 ;��� I      ������� d0 0applicationshouldterminateafterlastwindowclosed_ 0applicationShouldTerminateAfterLastWindowClosed_� ���� o      ���� 
0 sender  ��  ��  � L     �� m     ��
�� boovtrue� ��� l     ��������  ��  ��  � ��� i   < ?��� I      ������� :0 applicationshouldterminate_ applicationShouldTerminate_� ���� o      ���� 
0 sender  ��  ��  � k     �� ��� n    ��� I    ������� "0 removeobserver_ removeObserver_� ����  f    ��  ��  � o     ���� 60 defaultnotificationcentre defaultNotificationCentre� ���� L    �� n   ��� o    
����  0 nsterminatenow NSTerminateNow� m    ��
�� misccura��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � 8 2 NSDraggingDestination (NSWindow Delgate) Protocol   � ��� d   N S D r a g g i n g D e s t i n a t i o n   ( N S W i n d o w   D e l g a t e )   P r o t o c o l� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � ' ! Accept Generic drag&drop sources   � ��� B   A c c e p t   G e n e r i c   d r a g & d r o p   s o u r c e s� ��� i   @ C��� I      ������� $0 draggingentered_ draggingEntered_� ���� o      ���� 
0 sender  ��  ��  � L     �� n    ��� o    ���� 00 nsdragoperationgeneric NSDragOperationGeneric� m     ��
�� misccura� ��� l     ��������  ��  ��  � ��� l     ������  � #  Process a drop on our window   � ��� :   P r o c e s s   a   d r o p   o n   o u r   w i n d o w� ��� i   D G��� I      ������� .0 performdragoperation_ performDragOperation_� ���� o      ���� 
0 sender  ��  ��  � k     v�� ��� r     ��� n    ��� I    �������� (0 draggingpasteboard draggingPasteboard��  ��  � o     ���� 
0 sender  � o      ���� 0 pb  � ��� Z    s������� E    ��� c    ��� n   ��� I   	 �������� 	0 types  ��  ��  � o    	���� 0 pb  � m    ��
�� 
list� n   ��� o    ���� "0 nsurlpboardtype NSURLPboardType� m    ��
�� misccura� k    o�� ��� r       K     ������ b0 /nspasteboardurlreadingcontentsconformtotypeskey /NSPasteboardURLReadingContentsConformToTypesKey J     �� m     � 8 c o m . a p p l e . a p p l i c a t i o n - b u n d l e��  ��   o      ���� 0 options  � 	 X    H
��
 s   9 C n  9 < o   : <���� 0 path   o   9 :���� 0 u   n        ;   A B o   < A���� $0 bundlestoprocess bundlesToProcess�� 0 u   n  " - I   # -������ @0 readobjectsforclasses_options_ readObjectsForClasses_options_  J   # ( �� n  # & o   $ &���� 	0 NSURL   m   # $��
�� misccura��   �� o   ( )���� 0 options  ��  ��   o   " #���� 0 pb  	  Z   I l���� F   I [ !  >   I Q"#" o   I N���� $0 bundlestoprocess bundlesToProcess# J   N P����  ! o   T Y���� 0 licenceagreed licenceAgreed n  ^ h$%$ I   c h��&���� 0 setenabled_ setEnabled_& '��' m   c d��
�� boovtrue��  ��  % o   ^ c���� 0 installbutton installButton��  ��   (��( L   m o)) m   m n�
� boovtrue��  ��  ��  � *�~* L   t v++ m   t u�}
�} boovfals�~  � ,-, l     �|�{�z�|  �{  �z  - ./. l     �y�x�w�y  �x  �w  / 010 l     �v23�v  2   UI handlers   3 �44    U I   h a n d l e r s1 565 l     �u�t�s�u  �t  �s  6 787 l     �r�q�p�r  �q  �p  8 9:9 l     �o;<�o  ;  
 Save EULA   < �==    S a v e   E U L A: >?> i   H K@A@ I      �nB�m�n 0 dosave_ doSave_B C�lC o      �k�k 
0 sender  �l  �m  A Q     $DEFD n   GHG I    �j�i�h�j 0 savelicense saveLicense�i  �h  H o    �g�g 	0 kvasd  E R      �fIJ
�f .ascrerr ****      � ****I o      �e�e 0 errorstring errorStringJ �dK�c
�d 
errnK o      �b�b 0 errornumber errorNumber�c  F Z    $LM�aNL =   OPO o    �`�` 0 errornumber errorNumberP m    �_�_��M l   �^QR�^  Q   just ignore Cancel   R �SS &   j u s t   i g n o r e   C a n c e l�a  N I    $�]T�\�] 	0 abort  T U�[U o     �Z�Z 0 errorstring errorString�[  �\  ? VWV l     �Y�X�W�Y  �X  �W  W XYX l     �VZ[�V  Z  
 Save EULA   [ �\\    S a v e   E U L AY ]^] i   L O_`_ I      �Ua�T�U 0 doprint_ doPrint_a b�Sb o      �R�R 
0 sender  �S  �T  ` Q     $cdec n   fgf I    �Q�P�O�Q 0 printlicense printLicense�P  �O  g o    �N�N 	0 kvasd  d R      �Mhi
�M .ascrerr ****      � ****h o      �L�L 0 errorstring errorStringi �Kj�J
�K 
errnj o      �I�I 0 errornumber errorNumber�J  e Z    $kl�Hmk =   non o    �G�G 0 errornumber errorNumbero m    �F�F��l l   �Epq�E  p   just ignore Cancel   q �rr &   j u s t   i g n o r e   C a n c e l�H  m I    $�Ds�C�D 	0 abort  s t�Bt o     �A�A 0 errorstring errorString�B  �C  ^ uvu l     �@�?�>�@  �?  �>  v wxw l     �=yz�=  y   Agree Button handler   z �{{ *   A g r e e   B u t t o n   h a n d l e rx |}| i   P S~~ I      �<��;�< 0 doagree_ doAgree_� ��:� o      �9�9 
0 sender  �:  �;   Z     ^���8�7� c     ��� n    	��� I    	�6�5�4�6 	0 state  �5  �4  � o     �3�3 0 agreecheckbox agreeCheckBox� m   	 
�2
�2 
bool� k    Z�� ��� Q    -���� k    �� ��� h    �1��1 0 downloadkvasd downloadKvasd� n    	��� I    	�0�/�.�0 0 fetchbinary fetchBinary�/  �.  � o     �-�- 	0 kvasd  � ��,� n   ��� I    �+��*�+  0 progressaction progressAction� ��)� o    �(�( 0 downloadkvasd downloadKvasd�)  �*  �  f    �,  � R      �'��&
�' .ascrerr ****      � ****� o      �%�% 0 errorstring errorString�&  � I   ' -�$��#�$ 	0 abort  � ��"� o   ( )�!�! 0 errorstring errorString�"  �#  � ��� n  . 8��� I   3 8� ���  0 setenabled_ setEnabled_� ��� m   3 4�
� boovfals�  �  � o   . 3�� 0 agreecheckbox agreeCheckBox� ��� r   9 @��� m   9 :�
� boovtrue� o      �� 0 licenceagreed licenceAgreed� ��� Z   A Z����� >   A I��� o   A F�� $0 bundlestoprocess bundlesToProcess� J   F H��  � n  L V��� I   Q V���� 0 setenabled_ setEnabled_� ��� m   Q R�
� boovtrue�  �  � o   L Q�� 0 installbutton installButton�  �  �  �8  �7  } ��� l     ����  �  �  � ��� l     ����  � #  Choose target button handler   � ��� :   C h o o s e   t a r g e t   b u t t o n   h a n d l e r� ��� i   T W��� I      ���
� "0 dochoosetarget_ doChooseTarget_� ��	� o      �� 
0 sender  �	  �
  � Q     c���� k    Z�� ��� X    4���� s   % /��� n   % (��� 1   & (�
� 
psxp� o   % &�� 
0 target  � n      ���  ;   - .� o   ( -�� $0 bundlestoprocess bundlesToProcess� 
0 target  � l 	  ���� I   �� �
� .sysostdfalis    ��� null�   � ����
�� 
prmp� l 	  	������ m    	�� ��� � C h o o s e   t h e   W S J T - X   a p p l i c a t i o n   b u n d l e   y o u   w i s h   t o   i n s t a l l   K V A S D   i n t o��  ��  � ����
�� 
ftyp� l 	 
 ������ m   
 �� ��� 8 c o m . a p p l e . a p p l i c a t i o n - b u n d l e��  ��  � ����
�� 
dflc� l 
  ������ c    ��� c    ��� m    �� ���  / A p p l i c a t i o n s� m    ��
�� 
psxf� m    ��
�� 
alis��  ��  � ����
�� 
lfiv� l 
  ������ m    ��
�� boovfals��  ��  � �����
�� 
mlsl� m    ��
�� boovtrue��  �  �  � ���� Z   5 Z������� F   5 I��� >   5 =��� o   5 :���� $0 bundlestoprocess bundlesToProcess� J   : <����  � o   @ E���� 0 licenceagreed licenceAgreed� n  L V��� I   Q V������� 0 setenabled_ setEnabled_� ���� m   Q R��
�� boovtrue��  ��  � o   L Q���� 0 installbutton installButton��  ��  ��  � R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      ���� ���  � l  b b������  �   just ignore Cancel   � ��� &   j u s t   i g n o r e   C a n c e l� ��� l     ��������  ��  ��  � ��� l     ������  �   Install button handler   � ��� .   I n s t a l l   b u t t o n   h a n d l e r� ��� i   X [��� I      ������� 0 
doinstall_ 
doInstall_�  ��  o      ���� 
0 sender  ��  ��  � k       I     �������� 0 process  ��  ��    r     J    ����   o      ���� $0 bundlestoprocess bundlesToProcess �� n   	
	 I    ������ 0 setenabled_ setEnabled_ �� m    ��
�� boovfals��  ��  
 o    ���� 0 installbutton installButton��  �  l     ��������  ��  ��    l     ����   < 6 handler called on eulaTextView scroll or view changes    � l   h a n d l e r   c a l l e d   o n   e u l a T e x t V i e w   s c r o l l   o r   v i e w   c h a n g e s  l     ����   > 8 enables agree/install button once the bottom is reached    � p   e n a b l e s   a g r e e / i n s t a l l   b u t t o n   o n c e   t h e   b o t t o m   i s   r e a c h e d  i   \ _ I      ������ 0 viewchanged_ viewChanged_ �� o      ���� 0 anotification aNotification��  ��   k     G  !  r     "#" c     	$%$ n    &'& o    ���� 
0 bounds  ' o     ���� 0 eulatextview eulaTextView% m    ��
�� 
reco# o      ���� 0 dr  ! ()( r    *+* c    ,-, n   ./. o    ���� 0 visiblerect visibleRect/ o    ���� 0 eulatextview eulaTextView- m    ��
�� 
reco+ o      ���� 0 vdr  ) 0��0 Z    G12����1 F    6343 B   +565 \    )787 n    9:9 o    ���� 
0 height  : n    ;<; o    ���� 0 size  < o    ���� 0 dr  8 l   (=����= [    (>?> n    "@A@ o     "���� 0 y  A n     BCB o     ���� 
0 origin  C o    ���� 0 vdr  ? n   " 'DED o   % '���� 
0 height  E n   " %FGF o   # %���� 0 size  G o   " #���� 0 vdr  ��  ��  6 l 
 ) *H����H m   ) *����  ��  ��  4 H   . 4II o   . 3���� 0 licenceagreed licenceAgreed2 n  9 CJKJ I   > C��L���� 0 setenabled_ setEnabled_L M��M m   > ?��
�� boovtrue��  ��  K o   9 >���� 0 agreecheckbox agreeCheckBox��  ��  ��   NON l     ��������  ��  ��  O PQP l     ��RS��  R   Abort handler   S �TT    A b o r t   h a n d l e rQ UVU i   ` cWXW I      ��Y���� 	0 abort  Y Z��Z o      ���� 0 errorstring errorString��  ��  X k     [[ \]\ I    ��^_
�� .sysodisAaleR        TEXT^ o     ���� 0 errorstring errorString_ ��`a
�� 
as A` m    ��
�� EAlTcriTa ��bc
�� 
btnsb J    dd e��e m    ff �gg  O k��  c ��h��
�� 
dflth m    	ii �jj  O k��  ] k��k I   ������
�� .aevtquitnull��� ��� null��  ��  ��  V lml l     ��������  ��  ��  m non l     ��pq��  p   About menu item   q �rr     A b o u t   m e n u   i t e mo s��s i   d gtut I      ��v���� 0 doabout_ doAbout_v w��w o      ���� 
0 sender  ��  ��  u I    ��x��
�� .sysodisAaleR        TEXTx m     yy �zz ( K V A S D - i n s t a l l e r   v 1 . 0��  ��  � {��{ l     �������  ��  �  ��       �~|}~�~  | �}�|�{�} 0 curl  �| 	0 kvasd  �{ "0 wsjtappdelegate WSJTAppDelegate} �z v  ��z 0 curl  �  ���� �y�x�y 0 download  �x 0 downloadmd5 downloadMD5� �w {�v�u���t�w 0 download  �v �s��s �  �r�q�p�r 0 url  �q 0 filename fileName�p 0 destination  �u  � �o�n�m�l�o 0 url  �n 0 filename fileName�m 0 destination  �l 0 file  �  � ��k�j�i ��h�g
�k .sysoexecTEXT���     TEXT�j  �i  
�h 
ret 
�g 
psxf�t 0��%E�O �%�%�%�%j W X  )j��%�%�%�%O��&� �f ��e�d���c�f 0 downloadmd5 downloadMD5�e �b��b �  �a�`�a 0 url  �` 0 filename fileName�d  � �_�^�]�_ 0 url  �^ 0 filename fileName�] 0 md5ext md5Ext�  � � ��\�[�Z ��Y
�\ .sysoexecTEXT���     TEXT�[  �Z  
�Y 
ret �c *�E�O �%�%�%�%j W X  )j��%�%�%�%~ �X �  ��X 	0 kvasd  � 	 � � � ������ �W�V�U�T�S�R�Q�W 0 
serverpath 
serverPath�V 0 destination  �U 0 
targetname 
targetName�T 0 	fetcheula 	fetchEULA�S 0 fetchbinary fetchBinary�R 0 savelicense saveLicense�Q 0 printlicense printLicense� �P ��O�N���M�P 0 	fetcheula 	fetchEULA�O  �N  �  � �L�L 0 download  �M b   b   b  �%b  m+ � �K
�J�I���H�K 0 fetchbinary fetchBinary�J  �I  � �G�F�E�D�G 0 url  �F 0 md5sum md5Sum�E 0 file  �D 0 md5calc md5Calc� �C�B�A8�@=�?�>X�=[]`c
�C .sysoexecTEXT���     TEXT�B 0 downloadmd5 downloadMD5�A 0 download  
�@ 
psxp
�? 
errn�>�
�= 
ret �H jb   ��%j %E�Ob   �b  l+ E�Ob   �b  b  m+ E�O��,%�%j E�O�� )��l��%�%�%�%�%�%�%�%�%Y h� �<k�;�:���9�< 0 savelicense saveLicense�;  �:  � �8�8 0 dest  � �7v�6�5�4�3�2���1�0�/
�7 
prmp
�6 
dflc
�5 afdrdocs
�4 .earsffdralis        afdr�3 
�2 .sysostflalis    ��� null
�1 
psxf
�0 
insh
�/ .coreclon****      � ****�9 +*����j � E�O� b  b  %�%�&�l U� �.��-�,���+�. 0 printlicense printLicense�-  �,  �  � ���*�)
�* 
psxf
�) .aevtpdocnull���     obj �+ � b  b  %�%�&j U �(����( "0 wsjtappdelegate WSJTAppDelegate� �� �'�&�
�' misccura
�& 
pcls� ���  N S O b j e c t�  ��%�$�#�"�!� ���������������������� ������������������
�	��������
� 
pare� 0 licenceagreed licenceAgreed� 0 
mainwindow 
mainWindow� 0 eulatextview eulaTextView� 0 progressbar progressBar� 0 
savebutton 
saveButton� 0 printbutton printButton� 0 agreecheckbox agreeCheckBox� (0 choosetargetbutton chooseTargetButton� 0 installbutton installButton� $0 bundlestoprocess bundlesToProcess� 	0 split  � 0 process  �  0 progressaction progressAction� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_� d0 0applicationshouldterminateafterlastwindowclosed_ 0applicationShouldTerminateAfterLastWindowClosed_� :0 applicationshouldterminate_ applicationShouldTerminate_�
 $0 draggingentered_ draggingEntered_�	 .0 performdragoperation_ performDragOperation_� 0 dosave_ doSave_� 0 doprint_ doPrint_� 0 doagree_ doAgree_� "0 dochoosetarget_ doChooseTarget_� 0 
doinstall_ 
doInstall_� 0 viewchanged_ viewChanged_� 	0 abort  � 0 doabout_ doAbout_�%  
�$ boovfals
�# 
msng
�" 
msng
�! 
msng
�  
msng
� 
msng
� 
msng
� 
msng
� 
msng� � ���   ��  � ������������� 	0 split  �� ����� �  ������ 0 thetext theText�� 0 thedelimiters theDelimiters��  � ���������� 0 thetext theText�� 0 thedelimiters theDelimiters�� 0 olddelimiters oldDelimiters�� 0 	theresult 	theResult� ������
�� 
ascr
�� 
txdl
�� 
citm�� ��,E�O���,FO��-E�O���,FO�� ������������ 0 process  ��  ��  � ���������������� 0 
bundlepath 
bundlePath�� 0 wsjtxbundle wsjtxBundle�� 0 installroot installRoot�� 
0 target  �� 0 theline theLine�� 0 thedylib theDylib�� 0 errorstring errorString� ;������������������#������/����E��NQ��V��������_m��}������������������������������������������	
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� misccura�� 0 nsbundle NSBundle�� "0 bundlewithpath_ bundleWithPath_
�� 
msng�� $0 bundleidentifier bundleIdentifier
�� 
ctxt
�� 
bool
�� 
errn���
�� 
ret �� 0 
bundlepath 
bundlePath
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit�� 0 
targetname 
targetName�� 0 destination  
�� 
spac
�� .sysoexecTEXT���     TEXT
�� .ascrcmnt****      � ****
�� 
cpar
�� 
tab �� 	0 split  
�� 
givu�� �� 
�� .sysodisAaleR        TEXT�� 0 errorstring errorString��  
�� 
as A
�� EAlTwarN����b  
[��l kh  s��,�k+ E�O�� 
 �j+ �&��& )��l��%�%�%�&Y hO�j+ �&E�Oa �%�%�%a a a lva a kva  O_ a ,a   �a %b  a ,%E�Oa b  a ,%b  a ,%_ %�%j  j !O qa "�%j  a #-[��l kh �a $	 
�a %�& ?*�_ &_ lvl+ '�l/E�Oa (�%a )%*�a *kvl+ '�i/%_ %�%j  j !Y h[OY��Oa +�%j  j !Oa ,�%�%�%a a -kva a .a /a 0a 1 2W X 3 4)ja 5�%�%�%�%�%a 6%�%Y hW "X 3 4�a 7a 8a a 9kva a :a 1 2[OY�f� ������������  0 progressaction progressAction�� ����� �  ���� 
0 action  ��  � ���� 
0 action  � �������� "0 startanimation_ startAnimation_
�� .aevtoappnull  �   � ****��  0 stopanimation_ stopAnimation_�� !b  )k+  O� *j UOb  )k+ � ��6���������� B0 applicationwillfinishlaunching_ applicationWillFinishLaunching_�� ����� �  ���� 0 anotification aNotification��  � ������������ 0 anotification aNotification�� 0 downloadeula downloadEula�� (0 boundschangenotice boundsChangeNotice�� &0 framechangenotice frameChangeNotice�� 0 errorstring errorString� E��������������[������������������������� 40 registerfordraggedtypes_ registerForDraggedTypes_
�� misccura�� ,0 nsnotificationcenter NSNotificationCenter�� 0 defaultcenter defaultCenter�� 60 defaultnotificationcentre defaultNotificationCentre�� 0 seteditable_ setEditable_�� 0 downloadeula downloadEula� �����������
�� .ascrinit****      � ****� k     �� ���� i     ��� I      ������
�� .aevtoappnull  �   � ****��  ��  � k     �� ���� l    [������  ��  ��  ��  ��  ��  � ��
�� .aevtoappnull  �   � ****� �� �����������
�� .aevtoappnull  �   � ****��  ��  �  � �������� 0 	fetcheula 	fetchEULA
�� .rdwrread****        ****�� 0 
setstring_ 
setString_�� b  b  j+  j k+ �� L  ��  0 progressaction progressAction�� 0 setenabled_ setEnabled_�� F0 !nsviewboundsdidchangenotification !NSViewBoundsDidChangeNotification�� D0  nsviewframedidchangenotification  NSViewFrameDidChangeNotification
�� 
msng�� �� F0 !addobserver_selector_name_object_ !addObserver_selector_name_object_�� 0 errorstring errorString��  �� 	0 abort  �� ~ qb  �kvk+ O��,j+ E�Ob  fk+ O��K 	S�O)�k+ 
Ob  ek+ Ob  ek+ O��,E�O��,E�O�)��a + O�)a ��a + W X  *�k+ � ������������� d0 0applicationshouldterminateafterlastwindowclosed_ 0applicationShouldTerminateAfterLastWindowClosed_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  �  �� e� ���������~�� :0 applicationshouldterminate_ applicationShouldTerminate_�� �}��} �  �|�| 
0 sender  �  � �{�{ 
0 sender  � �z�y�x�w�z 60 defaultnotificationcentre defaultNotificationCentre�y "0 removeobserver_ removeObserver_
�x misccura�w  0 nsterminatenow NSTerminateNow�~ �)k+ O��,E� �v��u�t���s�v $0 draggingentered_ draggingEntered_�u �r��r �  �q�q 
0 sender  �t  � �p�p 
0 sender  � �o�n
�o misccura�n 00 nsdragoperationgeneric NSDragOperationGeneric�s ��,E� �m��l�k���j�m .0 performdragoperation_ performDragOperation_�l �i��i �  �h�h 
0 sender  �k  � �g�f�e�d�g 
0 sender  �f 0 pb  �e 0 options  �d 0 u  � �c�b�a�`�_�^�]�\�[�Z�Y�X�W�V�c (0 draggingpasteboard draggingPasteboard�b 	0 types  
�a 
list
�` misccura�_ "0 nsurlpboardtype NSURLPboardType�^ b0 /nspasteboardurlreadingcontentsconformtotypeskey /NSPasteboardURLReadingContentsConformToTypesKey�] 	0 NSURL  �\ @0 readobjectsforclasses_options_ readObjectsForClasses_options_
�[ 
kocl
�Z 
cobj
�Y .corecnte****       ****�X 0 path  
�W 
bool�V 0 setenabled_ setEnabled_�j w�j+  E�O�j+ �&��, ^��kvlE�O (���,kv�l+ [��l kh ��,b  
6G[OY��Ob  
jv	 	b  �& b  	ek+ Y hOeY hOf� �UA�T�S���R�U 0 dosave_ doSave_�T �Q��Q �  �P�P 
0 sender  �S  � �O�N�M�O 
0 sender  �N 0 errorstring errorString�M 0 errornumber errorNumber� �L�K��J�I�L 0 savelicense saveLicense�K 0 errorstring errorString� �H�G�F
�H 
errn�G 0 errornumber errorNumber�F  �J���I 	0 abort  �R % b  j+  W X  ��  hY *�k+ � �E`�D�C���B�E 0 doprint_ doPrint_�D �A��A �  �@�@ 
0 sender  �C  � �?�>�=�? 
0 sender  �> 0 errorstring errorString�= 0 errornumber errorNumber� �<�;��:�9�< 0 printlicense printLicense�; 0 errorstring errorString� �8�7�6
�8 
errn�7 0 errornumber errorNumber�6  �:���9 	0 abort  �B % b  j+  W X  ��  hY *�k+ � �5�4�3���2�5 0 doagree_ doAgree_�4 �1��1 �  �0�0 
0 sender  �3  � �/�.�-�/ 
0 sender  �. 0 downloadkvasd downloadKvasd�- 0 errorstring errorString� 
�,�+�*���)�(�'�&�%�, 	0 state  
�+ 
bool�* 0 downloadkvasd downloadKvasd� �$��#�"���!
�$ .ascrinit****      � ****� k     �� �� � i     ��� I      ���
� .aevtoappnull  �   � ****�  �  � k     	�� ��� l    	����  �  �  �   �#  �"  � �
� .aevtoappnull  �   � ****� �� �������
� .aevtoappnull  �   � ****�  �  �  � �� 0 fetchbinary fetchBinary� 
b  j+  �! L  �)  0 progressaction progressAction�( 0 errorstring errorString�'  �& 	0 abort  �% 0 setenabled_ setEnabled_�2 _b  j+  �& Q ��K S�O)�k+ W X  *�k+ Ob  fk+ 	OeEc  Ob  
jv b  	ek+ 	Y hY h� �������� "0 dochoosetarget_ doChooseTarget_� ��� �  �� 
0 sender  �  � ��� 
0 sender  � 
0 target  � ���
��	���������� ���������
� 
prmp
�
 
ftyp
�	 
dflc
� 
psxf
� 
alis
� 
lfiv
� 
mlsl� 

� .sysostdfalis    ��� null
� 
kocl
� 
cobj
�  .corecnte****       ****
�� 
psxp
�� 
bool�� 0 setenabled_ setEnabled_��  � ������
�� 
errn������  � d \ 0*�������&�&�f�e� [��l kh ��,b  
6G[OY��Ob  
jv	 b  a & b  	ek+ Y hW X  h� ������������� 0 
doinstall_ 
doInstall_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  � ������ 0 process  �� 0 setenabled_ setEnabled_�� *j+  OjvEc  
Ob  	fk+ � ������������ 0 viewchanged_ viewChanged_�� ����� �  ���� 0 anotification aNotification��  � �������� 0 anotification aNotification�� 0 dr  �� 0 vdr  � 	�������������������� 
0 bounds  
�� 
reco�� 0 visiblerect visibleRect�� 0 size  �� 
0 height  �� 
0 origin  �� 0 y  
�� 
bool�� 0 setenabled_ setEnabled_�� Hb  �,�&E�Ob  �,�&E�O��,�,��,�,��,�,j	 
b  �& b  ek+ Y h� ��X���������� 	0 abort  �� ����� �  ���� 0 errorstring errorString��  � ���� 0 errorstring errorString� 	������f��i������
�� 
as A
�� EAlTcriT
�� 
btns
�� 
dflt�� 
�� .sysodisAaleR        TEXT
�� .aevtquitnull��� ��� null�� �����kv��� O*j � ��u���������� 0 doabout_ doAbout_�� ����� �  ���� 
0 sender  ��  � ���� 
0 sender  � y��
�� .sysodisAaleR        TEXT�� �j  ascr  ��ޭ