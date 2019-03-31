#!/bin/bash

path_to_colores='./'
original_map_resolution=5
original_pdb='3jch_0.3_final.pdb'

$path_to_colores/colores map.situs $original_pdb -res $original_map_resolution -nopowell
