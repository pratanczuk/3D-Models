head=10;
ancho=6*head/10;
miniancho=2*head/10;

//module for legs
module parab_leg(altura,lrate,first,iter) {
	for(i=[1:iter])
		{translate([0,0,(i-1)*altura]) cylinder(h=altura,r1=lrate*i*i+first,r2=lrate*(i+1)*(i+1)+first,center=true,$fn=4);}
}

//module for legs (5th grade)
module parab5_leg(altura,lrate,first,iter) {
	for(i=[1:iter])
		{translate([0,0,(i-1)*altura]) cylinder(h=altura,r1=lrate*i*i*i*i*i+first,r2=lrate*(i+1)*(i+1)*(i+1)*(i+1)*(i+1)+first,center=true,$fn=4);}
}

rotate([180,0,0])
color("Indigo")
difference(){
	union() {
		union() {
			union() {
					//head	
					translate([0,0,3*head/2])
					cube([head,head,head*0.8],center=true);
	
					//body
					translate([0,0,5])
					cube([head*0.8,0.5*head,3*head/2],center=true);
					}
						//arms
						rotate([0,-7,0])
						translate([head*0.6,0,-head*0.4])	
						cube([miniancho,miniancho,2.5*head+5],center=true);
	
						rotate([0,7,0])
						translate([-head*0.6,0,-head*0.4])
						cube([miniancho,miniancho,2.5*head+5],center=true);
	
				}
			//legs
			translate([head*0.2,0,head*0.2])
			rotate([180,0,45])
			parab5_leg(0.2,0.00000000005,1.5,150);
	
			translate([-head*0.2,0,head*0.2])
			rotate([180,0,45])
			parab5_leg(0.2,0.00000000005,1.5,150);
			}

	//eyes
	translate([5*head/16,head*0.8,1.5*head])
	cube([2.6*head/8,head,head/8],center=true);

	translate([-5*head/16,head*0.8,1.5*head])
	cube([2.6*head/8,head,head/8],center=true);
	}