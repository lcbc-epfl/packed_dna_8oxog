#!/bin/bash

line=1

while [ $line -le 145 ]

do

sed -n ''$line' , '$line''p A_data.csv > A_test.csv
sed 's/,/ /g' A_test.csv > A_test.txt
awk '{print $2 $3 $4 "_Xdisp, " $2 $3 $4 "_Ydisp, " $2 $3 $4 "_Inclin, " $2 $3 $4 "Tip, " $2 $3 $4 "_Ax-bend, "}' A_test.txt >> A_header_split.csv
awk '{print $5 ", " $6 ", " $7 ", " $8 ", " $9 ", "}' A_test.txt >> A_data_split_split.csv

sed -n ''$line' , '$line''p B_data.csv > B_test.csv
sed 's/,/ /g' B_test.csv > B_test.txt
awk '{print $2 $3 $4 "_Shear, " $2 $3 $4 "_Stretch, " $2 $3 $4 "_Stagger, " $2 $3 $4 "_Buckle, " $2 $3 $4 "_Propel, " $2 $3 $4 "_Opening, "}' B_test.txt >> B_header_split.csv
awk '{print $5 ", " $6 ", " $7 ", " $8 ", " $9 ", " $10 ", "}' B_test.txt >> B_data_split_split.csv

sed -n ''$line' , '$line''p C_data.csv > C_test.csv
sed 's/,/ /g' C_test.csv > C_test.txt
awk '{print $2 $3 $4 "_Shift, " $2 $3 $4 "_Slide, " $2 $3 $4 "_Rise, " $2 $3 $4 "_Tilt, " $2 $3 $4 "_Roll, " $2 $3 $4 "_Twist, " $2 $3 $4 "_H-Ris, " $2 $3 $4 "_H-Twi, "}' C_test.txt >>  C_header_split.csv
awk '{print $5 ", " $6 ", " $7 ", " $8 ", " $9 ", " $10 ", " $11 ", " $12 ", "}' C_test.txt >> C_data_split_split.csv

sed -n ''$line' , '$line''p D1_data.csv > D1_test.csv
sed 's/,,,/,----,----,/g' D1_test.csv > commas0_D1_test.csv
sed 's/,,/,----,/g' commas0_D1_test.csv > commas_D1_test.csv
sed 's/,/ /g' commas_D1_test.csv > D1_test.txt
awk '{print $2 $3 "_Alpha, " $2 $3 "_Beta, " $2 $3 "_Gamma, " $2 $3 "_Delta, " $2 $3 "_Epsil, " $2 $3 "_Zeta, " $2 $3 "_Chi, " $2 $3 "_Phase, " $2 $3 "_Ampli, "}' D1_test.txt >> D1_header_split.csv
awk '{print $4 ", " $5 ", " $6 ", " $7 ", " $8 ", " $9 ", " $10 ", " $11 ", " $12 ", "}' D1_test.txt >> D1_data_split_split.csv

sed -n ''$line' , '$line''p D2_data.csv > D2_test.csv
sed 's/,,,/,----,----,/g' D2_test.csv > commas0_D2_test.csv
sed 's/,,/,----,/g' commas0_D2_test.csv > commas_D2_test.csv
sed 's/,/ /g' commas_D2_test.csv > D2_test.txt
awk '{print $2 $3 "_Alpha, " $2 $3 "_Beta, " $2 $3 "_Gamma, " $2 $3 "_Delta, " $2 $3 "_Epsil, " $2 $3 "_Zeta, " $2 $3 "_Chi, " $2 $3 "_Phase, " $2 $3 "_Ampli, "}' D2_test.txt >> D2_header_split.csv
awk '{print $4 ", " $5 ", " $6 ", " $7 ", " $8 ", " $9 ", " $10 ", " $11 ", " $12 ", "}' D2_test.txt >> D2_data_split_split.csv

if [ $line -ge 2 ]
then
sed -n ''$line' , '$line''p E_data.csv > E_test.csv
sed 's/,/ /g' E_test.csv > E_test.txt
awk '{print $1 "_W12, " $1 "_D12, " $1 "_W21, " $1 "_D21, "}' E_test.txt >> E_header_split.csv
awk '{print $2 ", " $3 ", " $4 ", " $5 ", "}' E_test.txt >> E_data_split_split.csv
fi

let " line +=1 "
done 

wait

line2=146
sed -n ''$line2' , '$line2''p A_data.csv > A_test.csv
sed 's/,/ /g' A_test.csv > A_test.txt
awk '{print $2 $3 $4 "_Xdisp, " $2 $3 $4 "_Ydisp, " $2 $3 $4 "_Inclin, " $2 $3 $4 "Tip, " $2 $3 $4 "_Ax-bend, "}' A_test.txt >> A_header_split.csv
awk '{print $5 ", " $6 ", " $7 ", " $8 ", " $9 ", "}' A_test.txt >> A_data_split_split.csv

sed -n ''$line2' , '$line2''p B_data.csv > B_test.csv
sed 's/,/ /g' B_test.csv > B_test.txt
awk '{print $2 $3 $4 "_Shear, " $2 $3 $4 "_Stretch, " $2 $3 $4 "_Stagger, " $2 $3 $4 "_Buckle, " $2 $3 $4 "_Propel, " $2 $3 $4 "_Opening, "}' B_test.txt >> B_header_split.csv
awk '{print $5 ", " $6 ", " $7 ", " $8 ", " $9 ", " $10 ", "}' B_test.txt >> B_data_split_split.csv

sed -n ''$line2' , '$line2''p D1_data.csv > D1_test.csv
sed 's/,/ /g' D1_test.csv > D1_test.txt
awk '{print $2 $3 "_Alpha, " $2 $3 "_Beta, " $2 $3 "_Gamma, " $2 $3 "_Delta, " $2 $3 "_Epsil, " $2 $3 "_Zeta, " $2 $3 "_Chi, " $2 $3 "_Phase, " $2 $3 "_Ampli, "}' D1_test.txt >> D1_header_split.csv
awk '{print $4 ", " $5 ", " $6 ", " $7 ", " $8 ", " $9 ", " $10 ", " $11 ", " $12 ", "}' D1_test.txt >> D1_data_split_split.csv

sed -n ''$line2' , '$line2''p D2_data.csv > D2_test.csv
sed 's/,/ /g' D2_test.csv > D2_test.txt
awk '{print $2 $3 "_Alpha, " $2 $3 "_Beta, " $2 $3 "_Gamma, " $2 $3 "_Delta, " $2 $3 "_Epsil, " $2 $3 "_Zeta, " $2 $3 "_Chi, " $2 $3 "_Phase, " $2 $3 "_Ampli, "}' D2_test.txt >> D2_header_split.csv
awk '{print $4 ", " $5 ", " $6 ", " $7 ", " $8 ", " $9 ", " $10 ", " $11 ", " $12 ", "}' D2_test.txt >> D2_data_split_split.csv

while [ $line2 -le 285 ]
do

sed -n ''$line2' , '$line2''p E_data.csv > E_test.csv	
sed 's/,/ /g' E_test.csv > E_test.txt	
awk '{print $1 "_W12, " $1 "_D12, " $1 "_W21, " $1 "_D21, "}' E_test.txt >> E_header_split.csv
awk '{print $2 ", " $3 ", " $4 ", " $5 ", "}' E_test.txt >> E_data_split_split.csv

let " line2 +=1  "

done

awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' A_header_split.csv > A_header.csv
awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' A_data_split_split.csv > A_data_split.csv

awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' B_header_split.csv > B_header.csv
awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' B_data_split_split.csv > B_data_split.csv

awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' C_header_split.csv > C_header.csv
awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' C_data_split_split.csv > C_data_split.csv

awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' D1_header_split.csv > D1_header.csv
awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' D1_data_split_split.csv > D1_data_split.csv

awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' D2_header_split.csv > D2_header.csv
awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' D2_data_split_split.csv > D2_data_split.csv

awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' E_header_split.csv > E_header.csv
awk -v d="" '{s=(NR==1?s:s d)$0}END{print s}' E_data_split_split.csv > E_data_split.csv

wait

#sed -i 's/.5_/_5_/g' E_header.csv 

wait

#sed -i 's/.0_/_0_/g' E_header.csv 

wait 

cat A_header.csv A_data_split.csv > bybase_A_data.csv
cat B_header.csv B_data_split.csv > bybase_B_data.csv
cat C_header.csv C_data_split.csv > bybase_C_data.csv
cat D1_header.csv D1_data_split.csv > bybase_D1_data.csv
cat D2_header.csv D2_data_split.csv > bybase_D2_data.csv
cat E_header.csv E_data_split.csv > bybase_E_data.csv

sed -i 's/\//-/g' bybase_C_data.csv 

rm *_header* *_data_split* *_test* 
