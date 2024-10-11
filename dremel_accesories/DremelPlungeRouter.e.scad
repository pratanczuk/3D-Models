/*
 * Dremel plunge router attachment
 *
 * 2013-01-02 New
 * 2013-01-03 ImplicitCAD code
 */

include <../OpenScad Libraries/Screw Library/Thread_Library.scad> // http://www.thingiverse.com/thing:8793
include <../OpenScad Libraries/ISO metric thread library/ISOThread.scad> // http://www.thingiverse.com/thing:27183

// ISO Nuts
nutM8Height=6.5;   // fixed values for M8 nut
halfNutM8Height=4.0;
nutM8Dia=15.5;     // 15mm + extra margin

nutM4Height=3.2;   // 3mm +margin
nutM4Dia=8.5;      // 8mm +margin

// baseplate related vars
baseTh=5;          // base thickness
baseDia=150;       // base diameter
baseHeight=15;     // base (ridge) height
baseRad=baseDia/2; // base radius
cuttingHoleRad=20; // Radius of the bottom cutting hole

// guide
guideMountDia=13.0;
guideMountThread=8; // M8 bolt diameter
guideMountHeight=25-baseTh;

// guideplate
guideTh=baseTh;     // thickness
guideHeight=35;
guideExtraWidth=5;
guideWidth=baseDia/2+guideExtraWidth;
guideDist=baseDia/2; // distance between guide post centers

guideSlideHeight=15;
guideSlideDiaTop=10.0;
guideSlideDiaBottom=13.0;
guideSlideThread=guideMountThread;

// Dremel thread
threadRad=9.0;     // Tweak this so the thread fits snugly on your dremel
nutRad=14;         // Outer radius of the nut / top of attachment
//nutDepth=9.5;    // Depth of the top nut
nutDepth=guideTh*2;// Depth of the top nut

// miscellanious stuff
e=0.1;             // epsilon, used where needed for boolean cuts to show properly in preview (F5)
pi=3.14158;


// Modules are defined before being refered to (for ImplicitCAD)

//-----------------------------------------------------------------------
// M8 Nut
module nutM8() {
	cylinder( h=nutM8Height, r=nutM8Dia/2, $fn=6 );
}

//-----------------------------------------------------------------------
// Top nut that attaches to the rotary tool
module nut() {
     trapezoidNut( length=nutDepth, radius=nutRad, 
        pitch=2.0, pitchRadius=threadRad, threadHeightToPitch=0.7, stepsPerTurn=20, countersunk=0.2 );
}

//-----------------------------------------------------------------------
// Top nut negative space
module nutNegative() {
	trapezoidThreadNegativeSpace( length=nutDepth, radius=nutRad, 
        pitch=2.0, pitchRadius=threadRad, threadHeightToPitch=0.7, stepsPerTurn=20, countersunk=0.2 );
}

//-----------------------------------------------------------------------
// Guide mount cylinders
module guideMount() {
	difference() {
		cylinder( h=guideMountHeight, r=guideMountDia );
//		translate([0,0,guideMountHeight-nutM8Height+e]) nutM8();
		translate([0,0,guideMountHeight-nutM8Height+e]) cylinder(r=nutM8Dia/2, h=nutM8Height);
	}
}

//-----------------------------------------------------------------------
// Guide slide cylinders
module guideSlide() {
	cylinder( h=guideMountHeight, r1=guideSlideDiaBottom, r2=guideSlideDiaTop );
}

//-----------------------------------------------------------------------
// Base plate
module basePlate() {
	difference() {
//		union(r=5) {
		union(r=2.5) {
			difference() {
				cylinder( h=baseHeight, r=baseRad, $fn=64 );
				translate([0,0,baseHeight/2-e]) cylinder( h=(baseHeight-baseTh), r=(baseRad-baseTh), $fn=64);
				translate([0,0,-e]) cylinder( h=baseHeight+e, r=cuttingHoleRad);
				translate([baseRad/2,-baseDia/2,-e]) cube( [baseRad, baseDia, baseHeight+2*e]);
			}
		translate([0,baseDia/4,baseHeight/2]) guideMount();
		translate([0,-baseDia/4,baseHeight/2]) guideMount();
		}

	translate([0,baseDia/4,-5]) cylinder( h=guideMountHeight*2, r=guideMountThread/2 );
	translate([0,baseDia/4,-e]) nutM8();

	translate([0,-baseDia/4,-5]) cylinder( h=guideMountHeight*2, r=guideMountThread/2 );
	translate([0,-baseDia/4,-e]) nutM8();
	}
}

//-----------------------------------------------------------------------
// Guide plate
module guidePlate() {
	difference() {
		union() {
			translate([-guideHeight/2,-guideWidth/2,0]) cube( [guideHeight, guideWidth, guideTh] );
			translate([0,guideWidth/2,0]) cylinder(r=guideHeight/2, h=guideTh);
			translate([0,-guideWidth/2,0]) cylinder(r=guideHeight/2, h=guideTh);
			translate([0,baseDia/4,guideTh]) guideSlide();
			translate([0,-baseDia/4,guideTh]) guideSlide();
			translate([0,0,guideTh]) cylinder(r=nutRad, h=guideTh, $fn=6); // Spindle mount
			translate([-guideHeight/2,guideWidth/4,0]) cylinder(r=guideHeight/3, h=guideTh*2); // Z stop
		}
	// 2x slider
	translate([0,baseDia/4,-5]) cylinder( h=guideMountHeight*2, r=guideMountThread/2 );
	translate([0,-baseDia/4,-5]) cylinder( h=guideMountHeight*2, r=guideMountThread/2 );

	// Z stop
	translate([-guideHeight/2,guideWidth/4,0]) thread_out(8, guideTh*2);  // thread
	translate([-guideHeight/2,guideWidth/4,guideTh+halfNutM8Height/2]) cylinder( h=halfNutM8Height, r=nutM8Dia/2, $fn=6); // top nut
	translate([-guideHeight/2,guideWidth/4,-halfNutM8Height/2]) cylinder( h=halfNutM8Height, r=nutM8Dia/2, $fn=6); // bottom nut

	// spindle mount thread
	translate([0,0,0]) nutNegative();

	// lock
	translate([0,guideWidth-20,10]) rotate([90,0,0]) cylinder( h=20, r=2 );
	translate([0,guideWidth-32,10]) rotate([90,0,0]) cylinder( h=nutM4Height, r=nutM4Dia/2, $fn=6 );
	translate([-7.5/2,guideWidth-35.2,-10]) cube([7.5,nutM4Height,20]); // 7.5 is M4 flat side dia

	translate([0,-guideWidth+20,10]) rotate([-90,0,0]) cylinder( h=20, r=2 );
	translate([0,-guideWidth+32,10]) rotate([-90,0,0]) cylinder( h=nutM4Height, r=nutM4Dia/2, $fn=6 );
	translate([-7.5/2,-guideWidth+32,-10]) cube([7.5,nutM4Height,20]); // 7.5 is M4 flat side dia

	}
}

// -----------------------------------
// comment out the bits you don't need
// -----------------------------------
//basePlate();
guidePlate();
//assembly();   // mockup of how it all fits together

// END
