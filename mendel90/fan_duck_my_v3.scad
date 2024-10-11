
//%color("light blue",1) translate([102,36+1,-43.5]) rotate([0,0,180])import("x_carriage_fan_duct_50.stl");

%translate([-22,-100,0]) rotate([45,0,0]) color("light blue",1) translate([102,36+1,-43.5]) rotate([0,0,180])import("fan 50.stl");

%translate([100,30,0]){
rotate([180,0,180])import("x_carriage.stl");

%translate([17.5,-28,-16])rotate([0,90,0])cylinder(h=24, r=15/2, $fn=30, center=true);
%translate([-49.5,-28,-16])rotate([0,90,0])cylinder(h=24, r=15/2, $fn=30, center=true);
%translate([-16,28,-16])rotate([0,90,0])cylinder(h=24, r=15/2, $fn=30, center=true);

//hot end
%translate([0,0,-23.5])rotate([0,0,0])cylinder(h=31, r=20/2, $fn=30, center=true);
%translate([0,0,-42])rotate([0,0,0])cylinder(h=6, r2=20/2,r1=2/2, $fn=30, center=true);
//

// belt
translate([0,-43,-10]) cube([300,5.5,3], center=true);
translate([0,-43,-29]) cube([300,5.5,3], center=true);

}

translate([80,-2,2]) rotate([180,0,0]) fan_duct_holder();
translate([80,-2,2]) fan_duct_holder();
module fan_duct_holder(){
difference(){
union(){
translate([0,0,0])cube([48,20,4], center=true);
translate([0,-11,-5])cube([48,10,14], center=true);
}
union(){



for (i=[-1,1]){
translate([0,-11,-11])rotate([90,0,0]){
translate([18*i,5,3])cylinder(h=21, r=3.5/2, $fn=30, center=true);
translate([18*i,5,-4])cylinder(h=4, r=6.5/2, $fn=6, center=true);
}
}

for (i=[0:10]){
translate([-5+i,5,0]) rotate([0,0,0]) translate([0,0,0])cylinder(h=11, r=3.5/2, $fn=30, center=true);
}

}
}
}


translate([100,30,-42]) fan_duct();
module fan_duct(){
difference(){
union(){
translate([0,0,8])cylinder(h=16, r=54/2, $fn=300, center=true);
//translate([0,0,2])cylinder(h=4, r2=44/2,r1=38/2, $fn=300, center=true);

translate([0,0,-2]){
//rotate([0,0,-20]) translate([0,-29,10])cube([54,60,16], center=true);
rotate([0,0,-19]) translate([0,-40,10])cube([54,80,16], center=true);
}


translate([-20,-70,27])cube([50,44,54], center=true);

}


union(){

translate([-20,-90,47])rotate([-45,0,0])cube([74,44,74], center=true);
translate([0,0,10.5])cylinder(h=13, r=28/2, $fn=300, center=true);
translate([0,0,2])cylinder(h=4.1, r1=20/2,r2=28/2, $fn=300, center=true);



//cut for belt ext wall
translate([-20,-42,21])  cube([80,12,20], center=true);


translate([-50,-50,28]) cube([10,100,60], center=true);

translate([-20,-43,20]) rotate([45,0,0]) translate([0,-9,30]){
	 cylinder(h=6, r=47/2, $fn=300, center=true);
	for (i=[0:3]){
	rotate([0,0,90*i]) translate([20,20,1])cylinder(h=11, r=2/2, $fn=30, center=true);
		}

}

translate([-2,-50+4,38]) rotate([90,0,0]) translate([0,0,0])cylinder(h=11, r=3.5/2, $fn=30, center=true);
translate([-38,-50+4,38]) rotate([90,0,0]) translate([0,0,0])cylinder(h=11, r=3.5/2, $fn=30, center=true);

difference(){
	union(){
	translate([0,0,8])cylinder(h=13, r=50/2, $fn=300, center=true);
//	translate([0,0,0])cylinder(h=4, r=32/2, $fn=300, center=true);
	translate([0,0,2])cylinder(h=4.1, r2=40/2,r1=32/2, $fn=300, center=true);
//----------------
	//rotate([0,0,-25]) translate([0,-29,8])cube([50,58,13], center=true);
	rotate([0,0,-19]) translate([0,-40,8])cube([50,76,13], center=true);
//----------------
	translate([-20,-70,26.5])cube([46,40,50], center=true);



	translate([-20,-90,47])rotate([-45,0,0])cube([74,44,74], center=true);

	}

	union(){
	translate([0,0,10])cylinder(h=12, r=32/2, $fn=300, center=true);
	translate([0,0,2])cylinder(h=4, r2=32/2,r1=24/2, $fn=300, center=true);

//cut for belt int wall
	translate([-20,-42,21])  cube([80,16,24], center=true);



	translate([-20,-88,45])rotate([-45,0,0])cube([74,44,74], center=true);
	translate([-48,-50,28]) cube([10,100,60], center=true);
	}
}

//test cut
//translate([30,-70,2]) cube([60,600,600], center=true);
//translate([0,-70,55]) cube([100,600,100], center=true);
//
}
//translate([-52,-45,2]) cube([10,10,60], center=true);
}
}

