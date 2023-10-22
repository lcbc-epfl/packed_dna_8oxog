! program name
PROGRAM DE_distr

! archaic header (see program gap_calc for more specifics for fortran commands)
Implicit None

! declaring variables
Integer::i,j,NL,nc
Real::min_VIE,max_VIE,min_1,max_1,DVIE_tot
Real::cs
Real,Allocatable,Dimension(:)::VIE
Real,Allocatable,Dimension(:)::cl,id,c_av
Real,Allocatable,Dimension(:)::cumul

! writing/reading NL 
Write(*,*)'Give me the number of lines'
Read(*,*) NL

! setting up array dimensions
Allocate(VIE(NL))

! opening de.txt file
Open(Unit=45,file='DE.txt')

! Part 2: Construction of the DE Histograms
! Assign frame numbers into VIE array
Do i=1,NL
 Read(45,*)VIE(i)
Enddo

! Now we will find the smallest and largest values of VIE  
! Find the min values of VIE. For each iteration if our VIE is less than the min then set it equal to the new value
min_VIE=VIE(1)
Do i=1,NL
 If(VIE(i).lt.min_VIE) Then
 min_VIE=VIE(i)
 Else
 Endif
Enddo

! same thing for greater than 
max_VIE=VIE(1)
Do i=1,NL
 If(VIE(i).gt.max_VIE) Then
 max_VIE=VIE(i)
 Else
 Endif
Enddo

! write min/max values
Write(*,*)min_VIE,max_VIE

! write values
Write(*,*)'Give me the minimal and maximal values'
Read(*,*)min_1, max_1

! caluculate dVIEs
DVIE_tot=max_1-min_1

! Define class size for the number of classes
Write(*,*)'Give me the class size'
Read(*,*)cs 

! Number of classes
nc=DVIE_tot/cs

! Limits of the classes and their averages. not sure what cl means but we have a class id, class average and some sort of cumulative
Allocate(cl(nc+1))
Allocate(id(nc))
Allocate(c_av(nc))
Allocate(cumul(nc))

! do loops for set the first cl to the minimum value and then for following indices run through the classes update the cl array by
! adding the previous to the original cs
cl(1)=min_1
Do i=2,nc+1
 cl(i)=cl(i-1)+cs
Enddo

! for the number of classes calculate the c average
Do i=1,nc
 c_av(i)=0.5*(cl(i)+cl(i+1))
Enddo

! Assignment of each VIE to the appropriate class
Do j=1,nc
 id(j)=0
Enddo

! loop number of lines and then number of classes. if VIE is greater/equal to cl and it is less than cl of the next index 
! then the loop would add to the next class
Do i=1,NL
 Do j=1,nc
  If((VIE(i).ge.cl(j)).and.(VIE(i).lt.cl(j+1))) Then
   id(j)=id(j)+1
  Else
  Endif
 Enddo
Enddo

! for each class, divide the id number by number of lines
Do i=1,nc
 id(i)=id(i)/NL
Enddo

! set the cumulative array equal to the id number which has been split by number of lines (?)
cumul(1)=id(1)

! for the next class update the cumul array by calculating the culumtive previous value and the id values 
Do i=2,nc
 cumul(i)=cumul(i-1)+id(i)
Enddo

! specifically add to de_dist file
Open(Unit=55,file='DE_distribution.txt')

! for 
Do i=1,nc
 Write(55,5)c_av(i),id(i),cumul(i)
 5 Format(F8.3,2F10.4)
Enddo

! close open files
Close(45)
Close(55)

! release memory hokd 
Deallocate(VIE)
Deallocate(cl)
Deallocate(id)
Deallocate(c_av)
Deallocate(cumul)

! end program
End Program
