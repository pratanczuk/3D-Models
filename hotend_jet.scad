$fn=25;
hotend_h = 15;
hotend_r = 3;

whole3mm_h = 10;
whole3mm_r = 1.5;

whole0_5mm_h = 5;
whole0_5mm_r = 0.25;

difference()
{
	translate([0,0,2.5])cylinder(r=hotend_r, h=hotend_h,center=true);
	rotate(180,0,0)translate([-2,2.5,-2]) cube([4,2,5]);
	translate([-2,2.5,-2]) cube([4,2,5]);

	translate([0,0,-3]) ring(hotend_r, hotend_r/1.5, 1);
	translate([0,0,-4]) ring(hotend_r, hotend_r/2, 1);
	translate([0,0,-5]) ring(hotend_r, 0.7, 1);
	
	// whole 3mm
	translate([0,0,whole3mm_h/2]) cylinder( r=whole3mm_r,  h=whole3mm_h, center=true);
	
	// whole 0.5mm
	translate([0,0,-whole0_5mm_h/2]) cylinder(r=whole0_5mm_r, h=whole0_5mm_h, center=true);
}

 


// modules
module ring(r1, r2, h) {
    difference() {
        cylinder(r = r1, h = h);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2);
    }
}

