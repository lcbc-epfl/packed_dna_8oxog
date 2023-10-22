Program res_res_contacts_atom

Implicit None

Integer::i,NF,NL_DNA,NL_Prot,j,k,NR_DNA,NR_Prot,l,m
Character(11)::char1
Integer,Allocatable,Dimension(:,:)::resid_DNA
Integer,Allocatable,Dimension(:,:)::resid_Prot
Character(12)::char2
Real,Allocatable,Dimension(:,:,:)::r_DNA
Real,Allocatable,Dimension(:,:,:)::r_Prot
Integer,Allocatable,Dimension(:)::res_DNA
Integer,Allocatable,Dimension(:)::res_Prot
Integer::res_min_Prot
Character(3)::char3
Real::d_max
Real::d
Real,Allocatable,Dimension(:,:,:)::contact
Real,Allocatable,Dimension(:,:)::occ_frac
Character(2)::char4
Character(5),Allocatable,Dimension(:,:)::atomtype_DNA
Character(5),Allocatable,Dimension(:,:)::atomtype_Prot
Character(4),Allocatable,Dimension(:,:)::restype_DNA
Character(4),Allocatable,Dimension(:,:)::restype_Prot

! Read pdb trajectory file
Write(*,*)'Number of frames'
Read(*,*)NF

Write(*,*)'Lines per frame, DNA'
Read(*,*)NL_DNA

Write(*,*)'Lines per frame protein'
Read(*,*)NL_Prot

Allocate(r_DNA(NF,NL_DNA,3))
Allocate(resid_DNA(NF,NL_DNA))
Allocate(atomtype_DNA(NF,NL_DNA))
Allocate(restype_DNA(NF,NL_DNA))
Allocate(r_Prot(NF,NL_Prot,3))
Allocate(resid_Prot(NF,NL_Prot))
Allocate(atomtype_Prot(NF,NL_Prot))
Allocate(restype_Prot(NF,NL_Prot))

! Get DNA residues
Write(*,*)'Number of residues, DNA' 
Read(*,*)NR_DNA

Allocate(res_DNA(NR_DNA))

Open(Unit=45,file='dna_resname.txt')
Do i=1,NR_DNA
 Read(45,*)res_DNA(i) 
Enddo 

! Get Protein residues
Write(*,*)'Number of residues, protein'
Read(*,*)NR_Prot

Allocate(res_Prot(NR_Prot))

Write(*,*) 'smallest residue number, Protein'
Read(*,*)res_min_Prot
res_Prot(1)=res_min_Prot
Do i=2,NR_Prot
 res_Prot(i)=res_Prot(i-1)+1
Enddo 

Allocate(contact(NF,NR_DNA,NR_Prot))
Allocate(occ_frac(NR_DNA,NR_Prot))

Do k=1,NF
 Do i=1,NR_DNA
  Do j=1,NR_Prot
   contact(k,i,j)=0
  Enddo
 Enddo 
Enddo

! Read DNA PDB
Open(Unit=55,file='dna.pdb')

Do i=1,NF
 Do j=1,NL_DNA
  If(j.le.(NL_DNA-1)) Then
   Read(55,8)char1,atomtype_DNA(i,j),restype_DNA(i,j),char4,resid_DNA(i,j),r_DNA(i,j,1),r_DNA(i,j,2),r_DNA(i,j,3),char2
  Else
   Read(55,'(a3)')char3
  Endif 
 Enddo
 8 Format(a11,a5,a4,a2,I4,F12.3,2F8.3,a12)
Enddo

! Read Protein PDB
Open(Unit=65,file='protein.pdb')

Do i=1,NF
 Do j=1,NL_Prot
  If(j.le.(NL_Prot-1)) Then
   Read(65,9)char1,atomtype_Prot(i,j),restype_Prot(i,j),char4,resid_Prot(i,j),r_Prot(i,j,1),r_Prot(i,j,2),r_Prot(i,j,3),char2
  Else
   Read(65,'(a3)')char3
  Endif 
 Enddo
 9 Format(a11,a5,a4,a2,I4,F12.3,2F8.3,a12)
Enddo

! Determine contacts
Write(*,*)'Maximum contact distance ?'
Read(*,*)d_max

Open(Unit=75,file='contacts.txt')
Open(Unit=95,file='contacts_atoms.txt')

Do i=1,NF
 Do j=1,NL_DNA-1
  Do k=1,NL_Prot-1
   d=sqrt((r_DNA(i,j,1)-r_Prot(i,k,1))**2+(r_DNA(i,j,2)-r_Prot(i,k,2))**2+(r_DNA(i,j,3)-r_prot(i,k,3))**2)
   If(d.le.d_max) Then
    Do l=1,NR_DNA
     Do m=1,NR_Prot
      If((resid_DNA(i,j).eq.res_DNA(l)).and.(resid_Prot(i,k).eq.res_Prot(m))) Then
       contact(i,l,m)=contact(i,l,m)+1
       Write(95,'(I4,a4,a5,I4,a4,a5)')&
       resid_DNA(i,j),restype_DNA(i,j),atomtype_DNA(i,j),resid_Prot(i,k),restype_Prot(i,k),atomtype_Prot(i,k)
      Else
      Endif
     Enddo
    Enddo
   Else
   Endif
  Enddo
 Enddo
Enddo

! Normalization of contact counts
! E.g. more than one atoms of a given residue
! within the distance limlit
Do i=1,NR_DNA
 Do j=1,NR_Prot
  Do k=1,NF
   If(contact(k,i,j).ne.0) Then
    contact(k,i,j)=1
   Else
   Endif
  Enddo
 Enddo
Enddo

! Time series of close contact counts 
Do i=1,NR_DNA
 Do j=1,NR_Prot
  Write(75,'(2I5,2501F10.1)')res_DNA(i),res_Prot(j),(contact(k,i,j),k=1,NF)
 Enddo
Enddo 

! Occupancy Fractions
Do i=1,NR_DNA
 Do j=1,NR_Prot
  occ_frac(i,j)=0
 Enddo
Enddo

Do i=1,NR_DNA
 Do j=1,NR_Prot
  Do k=1,NF
   occ_frac(i,j)=occ_frac(i,j)+contact(k,i,j)
  Enddo
  occ_frac(i,j)=occ_frac(i,j)/NF
 Enddo
Enddo
 
Open(Unit=85,file='occupancy_fractions.txt')
Do i=1,NR_DNA
 Do j=1,NR_Prot
  Write(85,'(2I5,F10.3)')res_DNA(i),res_Prot(j),occ_frac(i,j)
 Enddo
Enddo 

Close(45)
Close(55)
Close(65)
Close(75)
Close(85)
Close(95)

Deallocate(r_DNA)
Deallocate(r_Prot)
Deallocate(resid_DNA)
Deallocate(resid_Prot)
Deallocate(res_DNA)
Deallocate(res_Prot)
Deallocate(contact)
Deallocate(occ_frac)
Deallocate(atomtype_DNA)
Deallocate(atomtype_Prot)
Deallocate(restype_DNA)
Deallocate(restype_Prot)

End Program 
