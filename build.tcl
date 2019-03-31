### Tcl script to prepare input files for ReMDFF
# @author: Daipayan Sarkar, modified by John Vant
# @email: sdaipayan@gmail.com, jvant@asu.edu
# Usage:
# source build.tcl
# build_remdff <max. sigma value> <delta sigma> <location of density file>
####

package require volutil
package require mdff

proc build_remdff {sigmamax delsigma densityfile} {
    set sigma 0
    file mkdir initialmaps
    file mkdir smoothed_density_maps
    while {$sigma < $sigmamax} {
	# Here the origonal desnity map in .situs format is given a gaussian blur according to parameters set above
	volutil -smooth $sigma $densityfile -o ./smoothed_density_maps/smooth-$sigma.dx
	# Here the density map is converted to a potential map using mdff's griddx command
	mdff griddx -i  ./smoothed_density_maps/smooth-$sigma.dx -o ./initialmaps/$sigma.dx
	set sigma [incr sigma $delsigma]
	puts $sigma
	puts "next iteration"
    }
}
