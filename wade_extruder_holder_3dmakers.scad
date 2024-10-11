
//Wade extruder holder by 3dmakers
// it keeps extruder at springs side 

difference() 
{
	cube([30, 40, 5], center = true);
	translate([3, 0, 0]) cube([15, 30, 6], center = true);
	translate([-10, 13, 0]) cylinder(h = 6, r = 2, center = true);
	translate([-10, -13, 0]) cylinder(h = 6, r = 2, center = true);
}

difference() 
{
	translate([15, 0,5]) rotate([0, 90, 0])cube([15, 40, 4], center = true);
	rotate([0, 90, 0]) translate([-8, 13, 15]) cylinder(h = 6, r = 1.5, center = true);
	rotate([0, 90, 0])translate([-8, -13, 15]) cylinder(h = 6, r = 1.5, center = true);

}