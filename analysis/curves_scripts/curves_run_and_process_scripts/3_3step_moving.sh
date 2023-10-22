#!/bin/bash

mkdir output

for dir in  /scratch/sojohnso/fs_2023/clean_run_8og_bur_ox/3step_curves/*
do
	cd "$dir"
	mv r+bdna.lis "$dir".lis
	mv "$dir".lis ../output/
	cd ../
done

