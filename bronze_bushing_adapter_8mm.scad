$fn=100;
bushing_diameter = 12/2;
bushing_length = 9.5;

bearing_length = 24;
bearing_diameter = 7.5;
rod_diameter =4.5;

difference()
{
	difference()
	{
		cylinder(r=bearing_diameter ,h=bearing_length,center=true);
		translate([0,0,( bearing_length/2)- bushing_length/2] ) cylinder(r=bushing_diameter, h=bushing_length,center=true);

	}
	cylinder(r=rod_diameter, h=bearing_length +1,center=true);
}