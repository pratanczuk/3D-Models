include <ISOThread.scad>
include <libraries/MCAD/nuts_and_bolts.scad>

DOC_SCALING_FACTOR = 13;
DOC_HEIGHT = 250;
DIM_SPACE = .1 * DOC_SCALING_FACTOR;

include <dimlines.scad>

DIM_LINE_WIDTH = .025 * DOC_SCALING_FACTOR;
DIM_SPACE = .1 * DOC_SCALING_FACTOR;


// Mounting plate dimentions
color("Blue")
{
translate([-37.5,-35,-15]) my_dimentions( 75);
translate([30,-25,-15]) my_dimentions( 7.5);
translate([5,-25,-15]) my_dimentions( 25);
translate([-20,-25,-15]) my_dimentions( 25);
translate([-37.5
,-25,-15]) my_dimentions( 17.5);

rotate([0,0,90]) translate([-12.5,-60,-15]) my_dimentions( 25);
rotate([0,0,90]) translate([-12.5,-50,-15]) my_dimentions( 12.5);
rotate([0,0,90]) translate([0,-50,-15]) my_dimentions( 12.5);

//holes

rotate([0,0,180]) translate([-10,-30,-15]) my_dimentions( 10);
rotate([0,0,180]) translate([17.5,-30,-15]) my_dimentions( 4);

 rotate([0,180,0]) translate([-6,15,15])  leader_line(angle=45 + 90, radius=.25,
                angle_length=15,
                horz_line_length=.5, direction=DIM_LEFT,
                line_width=DIM_LINE_WIDTH,
                text=str("Diameter ",  2.5));

//rotate([0,0,180]) translate([-6.5,-25,-15]) my_dimentions( 2.5);
}
$fn=100;

translate([0,0,25])
{
//color("Red") translate([0,0,-40]) ptfe_insert( out_diameter=8, in_diameter=3.2, hight=46);

color("Silver") translate([-37.5,-12.5,-43]) mounting_plate( length=75, width=25, hight=5);

//color("LightGrey") translate([0,0,-20]) coldend( cylinder_length=45, cylinder_out_diameter=10,cylinder_in_diameter=8, cylinder_whole_diameter=3.2, thread_length=10);

//translate([-3.5,0,5]) color("Silver") heater_block(cylinder_diameter=20, cylinder_length=20, resistor_diameter=6, resistor_wire_diameter=3,sensor_diameter=3, hotend_diameter= 9);

//color("DarkKhaki") translate([0,0,-20]) hotend( cylinder_diameter=8, whole_diameter=3.2, cylinder_length = 32);

}
// modules

module my_dimentions( a_length)
{
	rotate([180, 0, 0]) dimensions(length=a_length, line_width=DIM_LINE_WIDTH, loc=DIM_CENTER);

	// left arrow
	translate([0, -1.75, 0]) rotate([0, 0, 90]) line(length=10, width=DIM_LINE_WIDTH, height=DIM_HEIGHT, left_arrow=false, right_arrow=false);

	// right arrow
	translate([a_length, -1.75, 0]) rotate([0, 0, 90]) line(length=10, width=DIM_LINE_WIDTH, height=DIM_HEIGHT, left_arrow=false, right_arrow=false);
}


module ptfe_insert( out_diameter, in_diameter, hight)
{
	difference()
	{
		cylinder(r=out_diameter/2,h=hight,center=true);
		cylinder(r=in_diameter/2,h=hight+1,center=true);
	}
}

module mounting_plate( length, width, hight)
{
	difference()
	{
		minkowski()
		{  
			cube([length,width,hight]);
    		// rounded corners
    		cylinder(r=2,h=0.1);
		}
		// center hole
		translate([length/2+5,width/2,hight/2 ]) cylinder(r=5 ,h=hight+1,center=true);

		//mount holes
		translate([length/2+30,width/2,hight/2 ]) cylinder(r=2 ,h=hight+1,center=true);
		translate([length/2-20,width/2,hight/2 ]) cylinder(r=2 ,h=hight+1,center=true);
		
		//side, threaded holes
		rotate([90,0,0]) translate([length/2+5,hight/2,-width/2 ]) cylinder(r=1.5 ,h=width+5,center=true);

	}
}

module heater_block( cylinder_diameter, cylinder_length, resistor_diameter, resistor_wire_diameter, sensor_diameter, hotend_diameter )
{
	cylinder_diameter=cylinder_diameter/2;
	resistor_diameter=resistor_diameter/2;
	resistor_wire_diameter=resistor_wire_diameter/2;
	sensor_diameter=sensor_diameter/2;
	hotend_diameter=hotend_diameter/2;

	difference()
	{
		cylinder(r=cylinder_diameter ,h=cylinder_length,center=true);
		translate([3.5,0,-5]) cylinder(r=hotend_diameter ,h=cylinder_length-10+0.1,center=true);
		translate([3.5,0,0]) cylinder(r=3 ,h=cylinder_length+0.1,center=true);		
		translate([-6,0,0]) cylinder(r=resistor_diameter ,h=cylinder_length+1,center=true);
		translate([-2,7,0]) cylinder(r=resistor_wire_diameter ,h=cylinder_length+1,center=true);
		translate([-2,-7,0]) cylinder(r=sensor_diameter ,h=cylinder_length+1,center=true);
	}
}

module hotend( cylinder_diameter, whole_diameter, cylinder_length )
{
	cylinder_diameter=cylinder_diameter/2;
	whole_diameter=whole_diameter/2;
	
	difference()
	{
		thread_out(dia=6,hi=cylinder_length,center=true);
		translate([0,0,cylinder_length/2])	cylinder(r=whole_diameter ,h=cylinder_length+0.1,center=true);
	}
	
	difference()
	{
 		union()
		{
 			translate([0,0,36])	cylinder(r=cylinder_diameter ,h=5,center=true);
			translate([0,0,40]) cylinder(h = 3, r1 = cylinder_diameter, r2 = 0.25, center = true);
		}
 	
		translate([0,0,23])	cylinder(r=3 ,h=5+0.1,center=true);	
		translate([0,0,25])	cylinder(r=0.25 ,h=cylinder_length+0.1,center=true);	
	
		translate([0,7,23]) cube(7, center = true);
		translate([0,-7,23]) cube(7, center = true);
	}
}

module coldend( cylinder_length, cylinder_out_diameter, cylinder_in_diameter, cylinder_whole_diameter, thread_length)
{
	cylinder_out_diameter= cylinder_out_diameter/2;
	cylinder_in_diameter=cylinder_in_diameter/2;
	cylinder_whole_diameter=cylinder_whole_diameter/2;
	
	difference()
	{
		union()
		{
 			cylinder(r=cylinder_out_diameter ,h=cylinder_length,center=true);


		//	translate([0,0,cylinder_length/2]) thread_out(dia=10,hi=thread_length,thr=32);
		}
		translate([0,0,thread_length/2 ])	cylinder(r=cylinder_in_diameter ,h=cylinder_length+thread_length+1,center=true);

		union()
		{
			translate([-cylinder_out_diameter,cylinder_out_diameter-3.5,-cylinder_length/2 + 7]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);
			translate([-cylinder_out_diameter,(-cylinder_out_diameter)-1.5,-cylinder_length/2 + 7]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);

			rotate([0,0,90])translate([-cylinder_out_diameter,cylinder_out_diameter-3.5,-cylinder_length/2 + 10]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);
			rotate([0,0,90]) translate([-cylinder_out_diameter,(-cylinder_out_diameter)-1.5,-cylinder_length/2 + 10]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);

			translate([-cylinder_out_diameter,cylinder_out_diameter-3.5,-cylinder_length/2 + 13]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);
			translate([-cylinder_out_diameter,(-cylinder_out_diameter)-1.5,-cylinder_length/2 + 13]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);

			rotate([0,0,90])translate([-cylinder_out_diameter,cylinder_out_diameter-3.5,-cylinder_length/2 + 16]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);
			rotate([0,0,90]) translate([-cylinder_out_diameter,(-cylinder_out_diameter)-1.5,-cylinder_length/2 + 16]) cube([cylinder_out_diameter*2,cylinder_out_diameter,1]);
		}
	}
	
	difference()
	{
		translate([0,0,cylinder_length/2-2.5])cylinder(r=cylinder_in_diameter ,h=5,center=true);
		translate([0,0,cylinder_length/2-2.5])cylinder(r=3 ,h=5.1,center=true);

	}
}