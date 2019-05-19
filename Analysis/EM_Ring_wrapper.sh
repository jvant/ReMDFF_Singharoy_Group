#!/bin/bash

# The following scripts need to be present in the 
# Load Phenix module
num_frames=786
EMRING_PATH=~/Documents/EMRinger/Phenix_Scripts

module load phenix/1.14-3260

#mkdir EM_ringer_output
cd ./EM_ringer_output
pwd

# echo "######################"
# echo "Step 1 run EM Ringer"
# echo " "
# for ((i=0;i<=$num_frames;i++));
# do
#     echo " "
#     echo calc_step_$i
#     phenix.python $EMRING_PATH/emringer.py ../FramesAsPDB/Frame$i.pdb ../../Put_Your_PDB_and_Map_Here/em*map
# done

echo "######################"
echo "Step 2 -  Calculate Scores"
echo " "
for ((i=0;i<=$num_frames;i++));
do
    echo "Calc score $i"
    phenix.python $EMRING_PATH/emringer_score.py -i ./Frame$i\_emringer.pkl 
done
