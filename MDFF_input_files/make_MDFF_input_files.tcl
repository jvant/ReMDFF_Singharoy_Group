#!tcl

##########################################################
#             For the creation of psf files with varying pH
#                   written by John Vant
#                        ASU Biodesign
###########################################################
#                        Notes
# Make sure you are in the directory with mypdb value
# Usage:
#  in bash  $ vmd -dispdev text -e makepsf.pgn
#  in tkconsole  $ source makepsf.pgn 

#############################################################
set FILE ../PDB_PSF_Prep/Docked_psfgen

package require mdff

mdff gridpdb -psf $FILE.psf -pdb $FILE.pdb -o gridpdb0.pdb

package require ssrestraints

ssrestraints -psf $FILE.psf -pdb $FILE.pdb -o ssrestraints.txt -hbonds

mol $FILE.psf
mol $FILE.pdb

cispeptide restrain -o cispeptide.txt

chirality restrain -o chirality.txt

exit
