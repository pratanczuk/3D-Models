include <ISOThread.scad>

$fn=100;


heater_top_cylinder_diameter = 10/2;
heater_top_cylinder_length = 26;
heater_top_cylinder_whole_diameter = 3.2/2;

heater_bottom_cylinder_diameter = 8/2;
heater_bottom_cylinder_length = 24;

// top

difference()
{

union()
{
	thread_out(10,heater_top_cylinder_length-10,center=true);
 	translate([0,0,18.5])	cylinder(r=heater_top_cylinder_diameter ,h=5,center=true);
	translate([0,0,heater_top_cylinder_length-5]) thread_out(6,5,center=true);

}
 	translate([0,0,heater_top_cylinder_length/2])	cylinder(r=heater_top_cylinder_whole_diameter ,h=heater_top_cylinder_length+0.1,center=true);
	
	translate([0,0,7.5])	cylinder(r=3 ,h=15.2,center=true);

	translate([0,7.5,19.4]) cube(7, center = true);
	translate([0,-7.5,19.4]) cube(7, center = true);
}


// heater block
heater_cylinder_diameter = 20/2;
heater_cylinder_length = 17;

hotend_cylinder_diameter = 6/2;
hotend_cylinder_length = 17;

resistor_cylinder_diameter = 6/2;
resistor_cylinder_length = 17;

resistor_wire_cylinder_diameter = 3/2;
resistor_wire_cylinder_length = 17;

sensor_cylinder_diameter = 3/2;
sensor_cylinder_length = 17;

translate([-3.5,0,37])
{

difference()
{
	cylinder(r=heater_cylinder_diameter ,h=heater_cylinder_length,center=true);
	translate([3.5,0,0]) cylinder(r=hotend_cylinder_diameter ,h=hotend_cylinder_length,center=true);
	translate([-6,0,0]) cylinder(r=resistor_cylinder_diameter ,h=resistor_cylinder_length,center=true);
	translate([-2,7,0]) cylinder(r=resistor_wire_cylinder_diameter ,h=resistor_wire_cylinder_length,center=true);
	translate([-2,-7,0]) cylinder(r=sensor_cylinder_diameter ,h=sensor_cylinder_length,center=true);
}
}

translate([0,0,50]) difference()
{

union()
{
	thread_out(6,12,center=true);
 	translate([0,0,13])	cylinder(r=heater_top_cylinder_diameter ,h=5,center=true);
	translate([0,0,16]) cylinder(h = 2, r1 = heater_top_cylinder_diameter, r2 = 0.25, center = true);

}
 	translate([0,0,7])	cylinder(r=heater_top_cylinder_whole_diameter ,h=17,center=true);
 	translate([0,0,15])	cylinder(r=0.25 ,h=17,center=true);	
	
	translate([0,7.5,14]) cube(7, center = true);
	translate([0,-7.5,14]) cube(7, center = true);

}