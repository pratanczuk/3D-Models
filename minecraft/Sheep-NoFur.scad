//Declare the scale that will be used for the model. This scale is used to calculate the pixel to mm scale. EX. scale of 5 means 1pixel on skin = 5mm.

scale=5;

//create a single standard-sized animal leg

module animal_leg()
{
difference()
{
union()
{
cube([4*scale,4*scale,12*scale]);
translate([-.1*scale,-.1*scale,11*scale])cube([4.2*scale,4.2*scale,1*scale]);
}
leg_connector();
translate([2*scale,4.05*scale,11.5*scale])cube([2*scale,.1*scale,1*scale], center=true);
}
}

//create the connector hole for use to connect the leg to body with a piece of filament

module leg_connector()
{
translate([scale*2,scale*1,0])cylinder(r=1.5,h=scale*2, center=true,$fn=100); 
translate([scale*2,scale*2,0])cylinder(r=1.5,h=scale*2, center=true,$fn=100);
}

//create the indent for a the head of an animal, where the head is fixed to the body.
//required variables are width of the head, depth of the indent of the head where it attachs to the body, width of body. All variables are in # of pixels.

module head_indent(head_width,head_depth,body_width)
{
translate([body_width/2*scale,scale+.4,0])cube([head_width*scale+0.5,head_depth*scale+0.45,.4],center=true);
translate([body_width/2*scale,0,scale+.025])cube([head_width*scale+0.5,.4,head_depth*scale+.45],center=true);
}

//create the head of the sheep
module head()
{
translate([0,0.2,0.2])difference()
{
union()
{
cube([6*scale,8*scale,6*scale]);
translate([2*scale,-0.1*scale,4*scale])cube([2*scale,0.1*scale,2*scale]);
translate([-0.1*scale,1*scale,1*scale])cube([0.1*scale,1*scale,3*scale]);
translate([-0.1*scale,2*scale,1*scale])cube([0.1*scale,2*scale,2*scale]);
translate([6.0*scale,1*scale,1*scale])cube([0.1*scale,1*scale,3*scale]);
translate([6.0*scale,2*scale,1*scale])cube([0.1*scale,2*scale,2*scale]);
}
translate([3.9*scale,0*scale,2*scale])cube([1*scale,0.1*scale,1*scale]);
translate([3.9*scale,0*scale,2*scale])cube([2*scale,0.05*scale,1*scale]);
translate([1.1*scale,0*scale,2*scale])cube([1*scale,0.1*scale,1*scale]);
translate([0.1*scale,0*scale,2*scale])cube([2*scale,0.05*scale,1*scale]);
translate([0*scale,6*scale,4*scale])cube([6*scale,2*scale,2*scale]);
}
}

//create the body of the sheep

module body(){
difference()
{
translate([-1*scale,6*scale,4*scale])cube([8*scale,16*scale,6*scale]);

//remove the indent where the head attachs

translate([-1*scale,6*scale,4*scale])head_indent(6,2,8);

//remove the holes for used to connect the legs with a piece of filament

translate([-2*scale,6*scale,10*scale])leg_connector();
translate([4*scale,6*scale,10*scale])leg_connector();
translate([-2*scale,19*scale,10*scale])leg_connector();
translate([4*scale,19*scale,10*scale])leg_connector();
}
}

//create the legs of the sheep

module legs(){
translate([-2*scale,6*scale,10*scale])animal_leg();
translate([4*scale,6*scale,10*scale])animal_leg();
translate([-2*scale,19*scale,10*scale])animal_leg();
translate([4*scale,19*scale,10*scale])animal_leg();
}


head();  //Call to generate the sheep's head
body();  //Call to generate the sheep's head
legs();    //Call to generate the sheep's head