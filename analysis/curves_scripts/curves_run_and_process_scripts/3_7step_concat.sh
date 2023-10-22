#!/bin/bash

frame=1
frame2=201
frame5=501
frame7=701
while [ $frame -le 250000 ]
do

sed -n '2,2p'  ./output_bybase/data_${frame}_bybase.csv >> 20_notails_bybase_data.csv 
sed -n '2,2p'  ./output_bybase/data_${frame2}_bybase.csv >> 20_notails_bybase_data.csv 
sed -n '2,2p'  ./output_bybase/data_${frame5}_bybase.csv >> 20_notails_bybase_data.csv 
sed -n '2,2p'  ./output_bybase/data_${frame7}_bybase.csv >> 20_notails_bybase_data.csv 

let " frame +=1000 "
let " frame2 +=1000 "
let " frame5 +=1000 "
let " frame7 +=1000 "

done

sed -i 's/----//g' 20_notails_bybase_data.csv
sed -i 's/---//g' 20_notails_bybase_data.csv
sed -i 's/ //g' 20_notails_bybase_data.csv
sed -i 's/,$//' 20_notails_bybase_data.csv

