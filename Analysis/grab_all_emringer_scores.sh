#!/bin/bash

# The following scripts need to be present in the 
# Load Phenix module


MDFF_PATH=~/Documents/Research/mdff/wss-restraints_truegridpdbs

for pdb in '5zqz' '6c0v' '6gx5' '6dvy' '6h3l' 
do
    
    for l in {1..3}
    do
	for i in {0..499}
	do
	    python grab_zscore.py --f $MDFF_PATH/$pdb/EM_RINGER/Step.$pdb.$l/frame.$i\_emringer.output/emringer_scores.pkl >> EM_ringerscores.$pdb.$l.txt
	done
    done
done
