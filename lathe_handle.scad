include<MCAD/nuts_and_bolts.scad>;


hole = 7.9375;
screw_hole = 30;
holes = 10;
notches = 40;



translate([0,-40,15])  cylinder(r=4.5,h=15,center=true);
translate([0,-36,12])  cylinder(r=4,h=10,center=true);
translate([0,-32,12])  cylinder(r=4,h=10,center=true);
translate([0,-28,12])  cylinder(r=4,h=10,center=true);
translate([0,-24,12])  cylinder(r=4,h=10,center=true);
translate([0,-21,12])  cylinder(r=4,h=10,center=true);
translate([0,-19,12])  cylinder(r=4.5,h=10,center=true);


translate([0,40,15])  cylinder(r=4.5,h=15,center=true);
translate([0,36,12])  cylinder(r=4,h=10,center=true);
translate([0,32,12])  cylinder(r=4,h=10,center=true);
translate([0,28,12])  cylinder(r=4,h=10,center=true);
translate([0,24,12])  cylinder(r=4,h=10,center=true);
translate([0,21,12])  cylinder(r=4,h=10,center=true);
translate([0,19,12])  cylinder(r=4.5,h=10,center=true);



 difference(){


translate([0,0,5])
union(){
translate([0,0,5]) cylinder(r=16.5,h=15,center=true);

	difference(){
		translate([0,0,0]) cylinder(r=48.5,h=5,center=true);
		translate([0,0,0]) cylinder(r=43,h=11,center=true);

		for(a=[0:notches]){
			rotate([0,0,a*(360/notches)])
			translate([50,0,0])
			cube([6,3,11], center=true);
		}
	}

	difference(){
		union(){
			translate([0,0,0.]) cylinder(r=45,h=5,center=true);
			translate([0,0,0]) cylinder(r=9,h=5,center=true);
		}
		//translate([0,0,-3]) cube([hole,hole,10],center=true);
		//translate([0,0,5]) cylinder(r=screw_hole/2,h=4,center=true);
		for(a=[0:holes]){
			rotate([0,0,a*(360/holes)])
			translate([40,0,0])
			scale([2.6,1,1])
			cylinder(r=7,h=20,center=true);
		}
	
	}
}

scale([1,1,2]) translate([0,0,4]) nutHole(16, proj=-1);
translate([0,0,4])  cylinder(r=8,h=15,center=true);
translate([11,-6,12])  rotate([30,90,0]) cylinder(r=3,h=8,center=true);
}