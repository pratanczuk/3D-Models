scale([0.75,0.75,0.75])
union(){
	difference() {
		//head
		translate([-22.5,-6.5,0]) cube([23,23,23]);

		//mouth
		translate([-8.5,-7,14]) cube([7.5,6,3]);
		translate([-11,-7,8.5]) cube([8,6,6]);
		translate([-8.5,-7,5.5]) cube([7.5,6,3]);

		//left eye socket
		translate([-17,-7,3]) cube([6,6,6]);
		//right eye socket
		translate([-17,-7,14]) cube([6,6,6]);	
	}

	//left eye
	translate([-17,-4,3]) cube([3,3,3]);
	//right eye
	translate([-17,-4,17.5]) cube([3,3,3]);

	//body
	cube([38,12,23]);

	//feet
	translate([35,12,0]) cube([17,11,23]);
	translate([35,-11,0]) cube([17,11,23]);
}