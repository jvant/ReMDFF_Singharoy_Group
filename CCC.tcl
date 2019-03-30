package require mdff

#set traj [mol new mdff-step1.psf]
#mol addfile output/0/mdff-step1.job0.0.sort.dcd
#set ref [mol new 3jcf.pdb]

set traj 0
set ref 1

set trajSel [atomselect $traj "name CA and ((chain A and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 350 351 ) or (chain B and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 348 349 350 351 ) or (chain C and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 349 350 351 ) or (chain D and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 350 351 ) or (chain E and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 348 349 350 351 ))"]

set refSel [atomselect $ref "name CA and ((chain A and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 350 351 ) or (chain B and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 348 349 350 351 ) or (chain C and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 349 350 351 ) or (chain D and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 350 351 ) or (chain E and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 348 349 350 351 ))"]

#set trajSel [atomselect $traj "backbone and ((chain A and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 349 350 351 ) or (chain B and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 347 348 349 350 351 ) or (chain C and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 348 349 350 351 ) or (chain D and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 349 350 351 ) or (chain E and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 347 348 349 350 351 ))"]

#set refSel [atomselect $ref "backbone and ((chain A and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 349 350 351 ) or (chain B and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 347 348 349 350 351 ) or (chain C and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 348 349 350 351 ) or (chain D and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 349 350 351 ) or (chain E and not resid 3 4 5 6 7 8 9 10 11 12 13 14 15 16 347 348 349 350 351 ))"]

set all [atomselect $traj all]
set fp [open "CCC.dat" w]
set nf [molinfo $traj get numframes]
for {set i 0} {$i < $nf} {incr i 1} {
	$trajSel frame $i
	set ccc_frame [mdff ccc $trajSel -i initialmaps/0.dx -res 3.8]
	puts $fp $ccc_frame
	flush $fp
}
close $fp
