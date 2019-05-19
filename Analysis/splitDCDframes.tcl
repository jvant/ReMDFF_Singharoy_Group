source load_replica.tcl
#load_replica 0

set all [atomselect top all]
set nf [molinfo top get numframes]
for {set i 0} {$i < $nf} {incr i 1} {
	animate goto $i
	$all frame $i
	set pdbName "FramesAsPDB/Frame${i}.pdb"
	#$all writepdb $pdbName
}
