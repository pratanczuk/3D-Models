include<MCAD/nuts_and_bolts.scad>;



//hole = 7.9375;
//screw_hole = 30;
//holes = 10;

translate([50,0,0]) 
{
difference()
{


union()
{
	//scale([1,1,2]) translate([0,0,4]) nutHole(10, proj=-1);
	translate([0,0,4])  cylinder(r=10.25,h=16,center=true);
	translate([0,0,-6])  cylinder(r=25.25,h=4,center=true);
	//translate([11,-6,17])  rotate([30,90,0]) cylinder(r=2,h=8,center=true);
}

translate([0,0,0])  cylinder(r=7,h=50,center=true);

translate([0,17.75,-6])  cylinder(r=1.5,h=6,center=true);
}


difference()
{


translate([45,0,-4.5])  cylinder(r=14,h=7,center=true);

translate([45,0,0])  cylinder(r=6,h=50,center=true);

}}



teeth = 20;			// Number of teeth, standard Mendel T5 belt = 8, gives Outside Diameter of 11.88mm
profile = 3;		// 1=MXL 2=40DP 3=XL 4=H 5=T2.5 6=T5 7=T10 8=AT5 9=HTD_3mm 10=HTD_5mm 11=HTD_8mm 12=GT2_2mm 13=GT2_3mm 14=GT2_5mm

motor_shaft = 12;	// NEMA17 motor shaft exact diameter = 5
m3_dia = 3.2;		// 3mm hole diameter
m3_nut_hex = 1;		// 1 for hex, 0 for square nut
m3_nut_flats = 5.7;	// normal M3 hex nut exact width = 5.5
m3_nut_depth = 2.7;	// normal M3 hex nut exact depth = 2.4, nyloc = 4

include<Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;
