#!/bin/bash

#mkdir output_bybase

for f in /scratch/sojohnso/fs_2023/clean_run_8og_bur_ox/3step_curves/20_notails_curves_data/sevens/*
do
	(cd "$f"
	cp ../../../each_bp.sh .
	./each_bp.sh
	mv bybase_A_data.csv "$f"_bybase_A_data.csv
	mv bybase_B_data.csv "$f"_bybase_B_data.csv
	mv bybase_C_data.csv "$f"_bybase_C_data.csv
	mv bybase_D1_data.csv "$f"_bybase_D1_data.csv
	mv bybase_D2_data.csv "$f"_bybase_D2_data.csv
	mv bybase_E_data.csv "$f"_bybase_E_data.csv)

mv ./20_notails_curves_data/sevens/*csv ./output_bybase

done


cd output_bybase

#frame1=1
#frame2=201
#frame5=501
frame7=701

while [ $frame7 -le 250000 ]
do

#paste -d ' ' data_${frame1}_bybase_A_data.csv data_${frame1}_bybase_B_data.csv data_${frame1}_bybase_C_data.csv data_${frame1}_bybase_D1_data.csv data_${frame1}_bybase_D2_data.csv data_${frame1}_bybase_E_data.csv > data_${frame1}_bybase.csv

#paste -d ' ' data_${frame2}_bybase_A_data.csv data_${frame2}_bybase_B_data.csv data_${frame2}_bybase_C_data.csv data_${frame2}_bybase_D1_data.csv data_${frame2}_bybase_D2_data.csv data_${frame2}_bybase_E_data.csv > data_${frame2}_bybase.csv

#paste -d ' ' data_${frame5}_bybase_A_data.csv data_${frame5}_bybase_B_data.csv data_${frame5}_bybase_C_data.csv data_${frame5}_bybase_D1_data.csv data_${frame5}_bybase_D2_data.csv data_${frame5}_bybase_E_data.csv > data_${frame5}_bybase.csv

paste -d "" data_${frame7}_bybase_A_data.csv data_${frame7}_bybase_B_data.csv data_${frame7}_bybase_C_data.csv data_${frame7}_bybase_D1_data.csv data_${frame7}_bybase_D2_data.csv data_${frame7}_bybase_E_data.csv > data_${frame7}_bybase.csv

#let " frame1 +=1000 "
#let " frame2 +=1000 "
#let " frame5 +=1000 "
let " frame7 +=1000 "

done

#rm data_*_data.csv

cd ../
