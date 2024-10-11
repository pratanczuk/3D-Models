
//include <C:/Program Files/OpenSCAD/libraries/MCAD/hardware.scad>


module lathe_support( basement_x, basement_y, basement_z, holder_x, holder_y, holder_z, knife_size)
{
	knife_length = knife_size*7;
	//basement
	difference()
	{
		cube( [basement_x, basement_y, basement_z], center = true);
		//translate([0,0,-10]) cube( [basement_x-5, basement_y-5, basement_z+10], center = true);
		cylinder(h=basement_z,r=4,center=true);
	}
	
	//knife holder
	translate([0,knife_size,-basement_z])
	{
		difference()
		{
			translate([0,0,-holder_x/2-basement_z/2]) cube( [holder_x, holder_y, holder_z], center = true);
			translate([holder_x/2-knife_size/2,holder_y/2-knife_size/2,-holder_x/2-basement_z/2-knife_size]) cylinder(h=holder_z/2-knife_size/2,r=3,center=true);
			translate([holder_x/2-knife_size/2,-(holder_y/2-knife_size/2),-holder_x/2-basement_z/2-knife_size]) cylinder(h=holder_z/2-knife_size/2,r=3,center=true);
		}
	
		//knife
		translate([0,-knife_size,0])
		{
			translate([holder_x/2-knife_size/2,0,-holder_x/2-basement_z/2]) cube( [knife_size, knife_length , knife_size], center = true);
			translate([holder_x/2-knife_size/2,knife_length/2,-holder_x/2-basement_z/2]) cube( [1,knife_size,knife_size ], center = true);
		}

	}
}

module rod_holder()
{
	//rod holder
	difference(){
		translate ([0,0,52/2+5])  cube(size = [160,25,52], center = true);
		translate ([44,0,26 + table_shift]) rotate ([90,0,0]) cylinder (25.1, r=12.5, center = true);
		translate ([-44,0,26 + table_shift]) rotate ([90,0,0]) cylinder (25.1, r=12.5, center = true);
		translate ([68,0,30])  cube(size = [24,25,1], center = true);
		translate ([-68,0,30])  cube(size = [24,25,1], center = true);
		union(){
			translate ([67,0,26 + table_shift])  cylinder (50, r=6, center = true);
			translate ([67,0,46 + table_shift])  cylinder (10, r=10, center = true);
			
		}
		union(){
			translate ([-67,0,26 + table_shift])  cylinder (50, r=6, center = true);
			translate ([-67,0,46 + table_shift])  cylinder (10, r=10, center = true);
			
		}

	}
}

module chunk()
{
	chunk_spindle_radius = 6;
	chunk_radius = 34;
	max_chunk_radius = chunk_radius/2+12;
	difference()
	{
		union()
		{
			cylinder(h=48,r=chunk_radius,center=true);
			translate([35,0,20]) cube([max_chunk_radius, 10, 10], center = true);
			translate([-35,0,20]) cube([max_chunk_radius, 10, 10], center = true);
			translate([0,35,20]) rotate([2,0,90]) cube([max_chunk_radius, 10, 10], center = true);
			translate([0,-35,20]) rotate([0,0,90]) cube([max_chunk_radius, 10, 10], center = true);

		}

	cylinder(h=58,r=chunk_spindle_radius,center=true);
	translate([0,0,19]) cylinder(h=20,r=max_chunk_radius,center=true);
	translate([0,0,-19]) cylinder(h=10,r=chunk_spindle_radius+2,center=true);
	}
}

module spinde()
{
	//spindle block
	difference(){
		//block
		translate ([0,0,75/2]) cube(size = [60,60,75], center = true);
		//spindle
		translate ([0,0,55]) rotate ([90,0,0]) cylinder (800, r=8, center = true);
	}
	
	//spindle
	translate ([0,-55,55]) rotate ([90,0,0]) chunk();
}

//table
table = 10;
table_shift=table/2;
%translate ([-20,0,0]) cube(size = [200,400,table], center = true);

//rod holders
translate ([0,90,0])  rod_holder();
translate ([0,-185,0]) rod_holder();

//rods
translate ([44,-48,30]) rotate ([90,0,0]) cylinder (300, r=12.5, center = true);
translate ([-44,-48,30]) rotate ([90,0,0]) cylinder (300, r=12.5, center = true);


//spindle and block
translate ([0,155,55]) spinde();
#translate ([0,155,30]) cube(size = [60,60,50], center = true);

//bearings and plate for support
translate ([-44,40,51/2+5]) cube(size = [68,69,51], center = true);
translate ([44,40,51/2+5]) cube(size = [68,69,51], center = true);
#translate ([-20,40,71]) cube(size = [200,60,30], center = true);

// tailstock
//bearings and plate
translate ([-44,-130,51/2+5]) cube(size = [68,69,51], center = true);
translate ([44,-130,51/2+5]) cube(size = [68,69,51], center = true);
#translate ([0,-130,61]) cube(size = [160,60,10], center = true);
#translate ([0,-130,96]) cube(size = [60,60,60], center = true);



//lead screw
translate ([-100,-10,25]) rotate ([90,0,0]) cylinder (420, r=7.9, center = true);
#translate ([-100,-185,25]) cube(size = [40,25,40], center = true);
#translate ([-100,90,25]) cube(size = [40,25,40], center = true);
#translate ([-100,40,30]) cube(size = [40,60,50], center = true);

translate([-40,35,88]) rotate ([0,180,-90]) lathe_support(30,72, 5, 20,25,34,8);


/*
60,60,50
60,60,60
200,400,10
200,60,30
160,60,10
40,25,40
40,25,40
40,60,50

*/