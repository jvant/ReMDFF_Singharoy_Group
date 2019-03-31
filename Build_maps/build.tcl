### Tcl script to prepare input files for ReMDFF
# @author: Daipayan Sarkar, modified by John Vant
# @email: sdaipayan@gmail.com, jvant@asu.edu
####

set num_replicas [lindex $argv 0]
set delsigma [lindex $argv 1]
set densityfile [lindex $argv 2]

package require volutil
package require mdff

set sigma 0
file mkdir initialmaps
file mkdir smoothed_density_maps

for {set i 0} {$i < $num_replicas} {incr i} {
    # Here the origonal desnity map in .situs format is given a gaussian blur according to parameters set above
    volutil -smooth $sigma $densityfile -o ./smoothed_density_maps/smooth-$i.dx
    # Here the density map is converted to a potential map using mdff's griddx command
    mdff griddx -i  ./smoothed_density_maps/smooth-$i.dx -o ./initialmaps/$i.dx
    set sigma [incr sigma $delsigma]
    puts $sigma
    puts "next iteration"
}
