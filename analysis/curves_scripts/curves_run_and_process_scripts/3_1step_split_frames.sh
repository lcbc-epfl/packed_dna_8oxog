#!/bin/bash

file_1=$1

frame1=1
frame2=201
frame5=501
frame7=701

#for 001 frames
line1=1
line2=9286

#for 201 frames
line3=18573
line4=27858

#for 501 frames
line5=46431
line6=55716

#for 701 frames
line7=65003
line8=74288

while [ $line8 -le 23215000 ] #need to include number of frames/steps from the simulation

do

cat ./header > frame_$frame1.pdb
sed -n ''$line1' , '$line2''p $1 >> frame_$frame1.pdb 

cat ./header > frame_$frame2.pdb
sed -n ''$line3' , '$line4''p $1 >> frame_$frame2.pdb 

cat ./header > frame_$frame5.pdb
sed -n ''$line5' , '$line6''p $1 >> frame_$frame5.pdb 

cat ./header > frame_$frame7.pdb
sed -n ''$line7' , '$line8''p $1 >> frame_$frame7.pdb 

wait

let " line1 +=92860 "
let " line2 +=92860 "
let " line3 +=92860 "
let " line4 +=92860 "
let " line5 +=92860 "
let " line6 +=92860 "
let " line7 +=92860 "
let " line8 +=92860 "
let " frame1 +=1000 "
let " frame2 +=1000 "
let " frame5 +=1000 "
let " frame7 +=1000 "

done

