#!/bin/bash

#cd ./20_notails_curves_data
#mkdir sevens
#mv data_*701 sevens
#mkdir fives
#mv data_*501 fives
#mkdir twos
#mv data_*201 twos
#mkdir zeroes
#mv data_* zeroes

#cd ../

mkdir output_bybase

./zeroes_collect_base_data.sh &
./twos_collect_base_data.sh &
./fives_collect_base_data.sh &
./sevens_collect_base_data.sh &

wait

cd output_bybase

#rm data_*_data.csv

cd ../
