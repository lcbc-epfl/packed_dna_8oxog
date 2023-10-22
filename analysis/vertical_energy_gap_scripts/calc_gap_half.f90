! name of program
Program calc_gap_half

! standard header (archaic, see program calc_gap for more details on all code)
Implicit None

! delcaring variables
Integer::NF,i,id,NFmin,NFmax
Integer,Allocatable,Dimension(:)::frame
Real,Allocatable,Dimension(:)::e0,e1,de
Real::av_de,st_dev

! opening/writing files
Open(unit=45,file='frames_tot.txt')
Open(unit=55,file='energies_0_tot.txt')
Open(unit=65,file='energies_1_tot.txt')
Open(unit=75,file='DE.txt')
Open(unit=85,file='DE_statistics.txt')

! write string, assign values to NF variable from input files
Write(*,*)'Total number of frames'
Read(*,*)NF

! define array dimensions based on NF
Allocate(frame(NF))
Allocate(e0(NF),e1(NF),de(NF)) 

! do loop for all frames assigning a frame number to arrays
Do i=1,NF
 Read(45,*)frame(i)
 Read(55,*)e0(i)
 Read(65,*)e1(i)
Enddo

! write string, assign values to NFmin variable from input files
Write(*,*)'minimum frame index'
Read(*,*)NFmin

! write string, assign values to NFmax variable from input files
Write(*,*)'maximum frame index'
Read(*,*)NFmax

! calculate vertical energy gaps, de(i), where the frame index is greater than NFmin and lesser than NFmax 
id=0
Do i=1,NF
 If((frame(i).gt.NFmin).and.(frame(i).le.NFmax)) Then
  id=id+1
  de(id)=(e1(i)-e0(i))*27.2116 ! in eV
  Write(75,'(F12.5)')de(id)
  If(id.eq.1) Then 
   Write(*,*)frame(i),de(id)
  Else
  Endif
 Else
 Endif
Enddo

! averages and standard deviation
av_de=0
Do i=1,id
 av_de=av_de+de(i)
Enddo
av_de=av_de/id

st_dev=0
Do i=1,id
 st_dev=st_dev+(de(i)-av_de)*(de(i)-av_de)
Enddo
st_dev=sqrt(st_dev/(id-1))

! write final values into file nicknamed 85
Write(85,*)NF,NFmax,av_de,st_dev

! close all open files
Close(45)
Close(55)
Close(65)
Close(75)
Close(85)

! release memory holds for arrays
Deallocate(frame)
Deallocate(e0,e1,de)

! end program
End Program
