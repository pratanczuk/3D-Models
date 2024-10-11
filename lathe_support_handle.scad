
/*
translate([0,0,-23.25])  rotate([0,0,-90])
difference()
{
translate([0,0,34])  cylinder(r=8.5,h=21.5,center=true);
difference()
{
translate([0,0,34])  cylinder(r=8.51,h=30,center=true);
translate([-10,5.5,23]) cube([20,3,30]);
}
}
*/




difference()
{
	cylinder(r=12.5,h=20,center=true,$fa=5, $fs=0.1);
	cylinder(r=2,h=21,center=true,$fa=5, $fs=0.1);
	translate([8,0,0]) cylinder(r=1.5,h=21,center=true, $fa=5, $fs=0.1);
	translate([-8,0,0]) cylinder(r=1.5,h=21,center=true, $fa=5, $fs=0.1);
}

rotate ([0,0,90]) translate([-9,0,10]) cylinder(r=3.5,h=21,center=true, $fa=5, $fs=0.1);
rotate ([0,0,90]) translate([9,0,10]) cylinder(r=3.5,h=21,center=true, $fa=5, $fs=0.1);