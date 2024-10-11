// A280 Mill top slide bracket design, to hold a NEMA17 stepper.
// vik@diamondage.co.nz 1-Mar-2013, Placed in the Public Domain
// I'll upload it to thingiverse.com

// Measurements in mm
nema17_side=42;				// NEMA17 side length
wall=9;						// Thickness of any bit of bracket.
bk_length=64;				// Length of bracket along axis of slide screw.
bk_width=69-nema17_side; 	// Width of bit taking slide mount screws.
m3_clearance_rad=1.8;

module body_block() {
	cube([bk_width,bk_length,wall]);		// Slab for screws
	translate([bk_width-wall,0,0])		// Wall down the middle
		cube([wall,bk_length,nema17_side/2]);
	cube([bk_width+nema17_side,wall,nema17_side/2]);	// Frontpiece to hold motor
}

module slot() {
	cube([8,7,50],center=true);
	translate ([-4,0,0])cylinder(r=3.5,h=50,center=true);
	translate ([4,0,0]) cylinder(r=3.5,h=50,center=true);
}

// Hole for a NEMA17 with one sloped side so that the wires can dangle
// out of it...
module nema_17_slots() {
	union () {
		cylinder (h=nema17_side*1.5,r=22.5/2,center=true);
        // 8mm * M3 clearance slots, 4 of.
        rotate ([0,0,45]) translate([21.5,0,0]) scale(0.5) slot();
		rotate ([0,0,-45]) translate([21.5,0,0])  scale(0.5) slot();
		rotate ([0,0,135]) translate([21.5,0,0])  scale(0.5) slot();
		rotate ([0,0,-135]) translate([21.5,0,0])  scale(0.5) slot();
	}
}


difference () {
	body_block();
	translate([10,24,0]) slot();
	translate([10,51,0]) slot();
	// NEMA17 Mounting holes
    translate([bk_width+nema17_side/2,0,nema17_side/2])
        rotate([90,0,0]) nema_17_slots();
}

