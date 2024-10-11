
//include <C:/Program Files/OpenSCAD/libraries/MCAD/hardware.scad>

radius =10;
width = 35;

// heater block
difference() {
	cylinder(h=width, r=radius, center=true);
	// resistor wholes
	translate ([0,0,-10]) rotate ([90,0,0])  cylinder (h = radius*2, r=3, center = true);
	translate ([0,0,10])rotate ([90,0,0])  cylinder (h = radius*2, r=3, center = true);
	
	// hotend whole
	//translate ([0,0,0])rotate ([90,0,0])  cylinder (h = radius*2, r=4.5, center = true);
	translate ([0,0,0])rotate ([90,0,90])  cylinder (h = radius*2, r=4.5, center = true);
	
	// terminstor whole
	translate ([6,0,6])rotate ([90,0,0])  cylinder (h = radius*2, r=1.5, center = true);
}

// hotend
difference() {
	union() {
		translate ([-22,0,0])rotate ([-90,0,90])cylinder(h = 4, r1 =4.5, r2 = 1, center = true);
		translate ([0,0,0])rotate ([90,0,90])  cylinder (h = 40, r=4.5, center = true);
	}
	
	translate ([0,0,0])rotate ([90,0,90])  cylinder (h = 49, r=0.25, center = true);
	translate ([2,0,0])rotate ([90,0,90])  cylinder (h = 38, r=2.5, center = true);
}

// isulator block
difference() {
	translate ([33,0,0])rotate ([-90,0,90])cylinder(h = 35, r =7.5,  center = true);
	translate ([33,0,0])rotate ([-90,0,90])cylinder(h = 35, r =2.5,  center = true);

}
// holder
translate ([14,0,0]) cube(size = [2.5,20,70], center = true);