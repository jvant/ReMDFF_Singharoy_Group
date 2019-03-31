#!/bin/bash

#################################################################################
# This section is devoted to obtaining parameters for setup

echo "Please enter the name of your pdb file EXAMPLE: [3jcf.pdb]"
read OG_PDB

echo "Please enter the name of your map file EXAMPLE: [map.situs]"
read MAP

echo "Enter the origonal resolution of your map EXAMPLE [3.2]"
read OG_RESOLUTION

echo "Enter in the absolute path to your Situs2.8 package downloaded as a part of this tutorial EXAMPLE [/home/username/.../Situs2.8/bin/]"
read SITUS_PATH

echo "Enter the number of replicas you want to run, make sure this is a power of 2. For most applications 8 is sufficient "
READ NUM_REPLICAS

echo "Enter the difference in resolution between replicas. For most applications 1 is sufficient "
READ DELTA_SIGMA

#################################################################################


echo "Begin docking protocol using Situs2.8"
cd ./Dock_PDB/
pwd
echo "The progress of this step is being logged in ./Dock_PDB/docking.log"
bash dock_wrapper.sh $OG_PDB $MAP $OG_RESOLUTION $SITUS_PATH
echo "Docking is complete using best docked pdb col_best_01.pdb for the next steps"
echo " "

echo "Generating Gaussian blurred maps, progress of this step is being logged in ./Build_maps/build.log"
cd ../Build_maps/
pwd
vmd -dispdev text -eofexit < build.tcl -args $NUM_REPLICAS $DELTA_SIGMA $MAP > build.log 
echo "Map building is complete"
echo " "

echo "Begin PDB and PSF preparation, logged in ./PDB_PSF_Prep/psfgen.log"
cd ../PDB_PSF_Prep/
pwd
vmd -dispdev text -eofexit < makepsf.pgn > psfgen.log 
echo "Hydrogens have been added to PDB and PSF has been created."
echo " "

echo "Generating gridpdb & extrabonds files"
cd ../MDFF_input_files/
pwd
vmd -dispdev text -eofexit < make_MDFF_input_files.tcl > input_file_generation.log 
echo "Input files have been generated"
echo " "
