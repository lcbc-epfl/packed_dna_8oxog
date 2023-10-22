#!/bin/bash

#make evry instance of a pdb into a directory, copy curves run file into each directory
for i in *.pdb
do
	subdir=${i%%.*}
	[ ! -d "$subdir" ] && mkdir -- "$subdir"
	mv -- "$i" "$subdir"/bna.pdb
	cp run_curves.sh "$subdir"
done

#run curves in each subdirectory (each associated with a frame)
#change file path to your case
for f in /scratch/sojohnso/fs_2023/clean_run_8og_bur_ox/3step_curves/*
do
	(cd "$f"
	./run_curves.sh)
done
