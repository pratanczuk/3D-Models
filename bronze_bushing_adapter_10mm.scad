$fn=100;
bushing_diameter = 13;
bushing_length = 10;

bearing_length = 29;
bearing_diameter = 19;
rod_diameter =6;

difference()
{
	difference()
	{
		cylinder(r=bearing_diameter/2 ,h=bearing_length,center=true);
		//translate([0,0,( bearing_length/2)- bushing_length/2] ) cylinder(r=bushing_diameter, h=bushing_length,center=true);
		//translate([0,0,-( bearing_length/2)+ bushing_length/2] ) cylinder(r=bushing_diameter, h=bushing_length,center=true);
	}
	cylinder(r=(bushing_diameter/2)+0.3, h=bearing_length +1,center=true);
}