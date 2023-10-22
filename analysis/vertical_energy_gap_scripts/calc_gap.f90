! program name
Program calc_gap

! old statement to prevent Fortran treatment of specific variables, just a standard phrase for the majority of programs now
Implicit None

! declaring variables. Allocatable (dynamic memory as the program runs), dimension(:) allows for us to define array dimensions later
Integer::NF,i,id,NFmax
Integer,Allocatable,Dimension(:)::frame
Real,Allocatable,Dimension(:)::e0,e1,de
Real::av_de,st_dev

! open writable files of the following names. If they don't exist, create and open them. unit allows us to give a file nickname
Open(unit=45,file='frames_tot.txt')
Open(unit=55,file='energies_0_tot.txt')
Open(unit=65,file='energies_1_tot.txt')
Open(unit=75,file='DE.txt')
Open(unit=85,file='DE_statistics.txt')

! Write(*,*) writes out the variable/string. Read(*,*) assigns values to listed variables from the input files
Write(*,*)'Total number of frames'
Read(*,*)NF

! stick dimensions into the arrays based on number of frames
Allocate(frame(NF))
Allocate(e0(NF),e1(NF),de(NF)) 

! do a loop for all frames in which we fill up the arrays with the frame numbers for the energy and frame number files
Do i=1,NF
 Read(45,*)frame(i)
 Read(55,*)e0(i)
 Read(65,*)e1(i)
Enddo

! see notes from previous write/read section
Write(*,*)'maximum frame index'
Read(*,*)NFmax

! calculate vertical energy gaps, de(i), for each frame number do an iteration (tracked by id) where we calculate energy differences
! in eV and then write them to the de.txt file until we've reached the max number of frames. 
! Also, F12.5 means Fixed point format for real numbers with a width of 12 and number of digits equal to 5 for each
id=0
Do i=1,NF
 If(frame(i).le.NFmax) Then
  id=id+1
  de(id)=(e1(i)-e0(i))*27.2116 ! in eV
  Write(75,'(F12.5)')de(id)
 Else
 Endif
Enddo

! averages and standard deviation. For each of the calculated ids we caluclate at average de and use that to calculate std dev
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

! write the final de and std_dev to the DE_statistics file
Write(85,*)NF,av_de,st_dev

! close open files with these unit nicknames
Close(45)
Close(55)
Close(65)
Close(75)
Close(85)

! let go of dynamic memory requistion for the following arrays (frame is integer, the others are real)
Deallocate(frame)
Deallocate(e0,e1,de)

! end program
End Program
