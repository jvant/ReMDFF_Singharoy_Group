#!/bin/bash

original_pdb=$1
map_name=$2
original_map_resolution=$3
path_to_colores=$4

$path_to_colores/colores $map_name $original_pdb -res $original_map_resolution -nopowell > docking.log
