#!/bin/bash


for i in {0..786}
do
	    python grab_zscore.py --f ./Frame$i\_emringer.output/emringer_scores.pkl >> EM_ringerscores.txt
done

