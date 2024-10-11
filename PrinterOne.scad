include <libraries/MCAD/units.scad>
include <libraries/MCAD/materials.scad>
include <libraries/MCAD/stepper.scad>
include <libraries/MCAD/bearing.scad>
include <libraries/MCAD/nuts_and_bolts.scad>

// Material colors Oak, Pine, Birch, FiberBoard, BlackPaint, Iron, Steel, Stainless, Aluminum, Brass, Transparent
//usage example color(Aluminium)

//Definition of objects and its dimentions
//All dimentions has to be in mm
	//PrinterOne
		//Global_Parameters
			MDF_THICKNESS=18;

		//Body
			BODY_External_WIDTH = 200;
			BODY_External_LENGTH = 300;
			BODY_External_HIGHT = 120;

			//MDF BOX

		//PSU
		//ATX PSU:150 mm × 86 mm × 140 mm
		PSU_WIDTH = 140;
		PSU_LENGTH = 150;
		PSU_HIGHT = 86;
		
//Implementation
	//Body
		//MDF BOX
		%color(FiberBoard) empty_box( BODY_External_WIDTH, BODY_External_LENGTH, BODY_External_HIGHT, MDF_THICKNESS);
		//PSU
		color(Steel) translate([0,0,MDF_THICKNESS]) empty_box( PSU_WIDTH, PSU_LENGTH, PSU_HIGHT, 2);



// empty box module
module empty_box( EXTERNAL_WIDTH, EXTERNAL_LENGTH, EXTERNAL_HIGHT, MATRIAL_THICKNESS)
{
	//top_plate
	translate([0,0,EXTERNAL_HIGHT-MATRIAL_THICKNESS/2]) cube( [EXTERNAL_WIDTH, EXTERNAL_LENGTH, MATRIAL_THICKNESS],  center = true);

	//bottom_plate
	translate([0,0,MATRIAL_THICKNESS/2]) cube( [EXTERNAL_WIDTH, EXTERNAL_LENGTH, MATRIAL_THICKNESS],  center = true);

	//left_side_plate
	translate([0, EXTERNAL_LENGTH/2 - MATRIAL_THICKNESS/2, EXTERNAL_HIGHT/2]) rotate([90, 0, 0]) cube( [EXTERNAL_WIDTH-(2*MATRIAL_THICKNESS), EXTERNAL_HIGHT -(2*MATRIAL_THICKNESS), MATRIAL_THICKNESS],  center = true);

	//right_side_plate
	translate([0, -(EXTERNAL_LENGTH/2 - MATRIAL_THICKNESS/2), EXTERNAL_HIGHT/2]) rotate([90, 0, 0]) cube( [EXTERNAL_WIDTH-(2*MATRIAL_THICKNESS), EXTERNAL_HIGHT-(2*MATRIAL_THICKNESS), MATRIAL_THICKNESS],  center = true);
	
	//front_side_plate
	translate([-(EXTERNAL_WIDTH/2 - MATRIAL_THICKNESS/2), 0, EXTERNAL_HIGHT/2]) rotate([90, 0, 90]) cube( [EXTERNAL_LENGTH, EXTERNAL_HIGHT-(2*MATRIAL_THICKNESS), MATRIAL_THICKNESS],  center = true);

	//rear_side_plate
	translate([(EXTERNAL_WIDTH/2 - MATRIAL_THICKNESS/2), 0, EXTERNAL_HIGHT/2]) rotate([90, 0, 90]) cube( [EXTERNAL_LENGTH, EXTERNAL_HIGHT-(2*MATRIAL_THICKNESS), MATRIAL_THICKNESS],  center = true);
}



