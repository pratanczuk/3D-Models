//inner radius of the bracelet in mm
inner_radius = 28; //[15:150]

//outer radius of the bracelet in mm
outer_radius = 33; //[15:150]

//length of the bracelet in mm
length = 15;  // [5:60]

//diameter of your 3d printer nozzle in mm
nozzle = 0.4; 

//number of sections on bracelets
sections = 25; //[15:60]

//text to put on bracelet
text = "Olcia";

//view text as holes?
holes = "no"; // [yes, no]

//text thickness as amount of nozzle
text_thickness = 4;  //[2:6]

use <MCAD/fonts.scad>

module test(){
  echo("test");
}

baseheight = 0.8;
r1 = inner_radius;
r2 = outer_radius;
n = sections;
gapin=2*nozzle;
gapout = 3*nozzle;
alpha = 2*PI/sections;
alpha_1 = alpha - gapin/r1;
beta = 2*PI/sections;
beta_1 = alpha - gapout/r2;
alpha_2 = gapin/r1;
beta_2 = gapout/r2;
alpha_3 = nozzle/r1;
beta_3 = nozzle/r2;

fudge = 0.01;

//process the text, we have beta_1 for the symbol, use beta_2 for border!
thisFont=8bit_polyfont();
x_shift=thisFont[0][0];
y_shift=thisFont[0][1];
theseIndicies=search(text,thisFont[2],1,1);
wordlength = (len(theseIndicies));

factorygap = 3;
scale_x = (beta_1-beta_2) * r2 / x_shift;
scale_y = (length - factorygap*gapout) / y_shift;
thicknessword = text_thickness * nozzle;

// Create the Text
module alltext() {
    for( j=[0:(len(theseIndicies)-1)] ) 
      rotate([0, 0, (3/2*beta_2 + (beta_1-beta_2)/2 + j* beta)*180/PI]) 
      translate([r2 -1.5* nozzle, -(beta_1-beta_2) * r2 /2 , factorygap/2*gapout])
      rotate([90,0,90]) 
        {
        scale([scale_x,scale_y,1]){
          linear_extrude(height=thicknessword) 
            polygon(points=thisFont[2][theseIndicies[j]][6][0],paths=thisFont[2][theseIndicies[j]][6][1]);
        }
      }
}

module innerholes() {
  union() {
    for (i = [0:n-1]){
      rotate([0,0,(-alpha_1/2 + i* alpha)*180/PI])
        translate([r1,0,0]) 
          cube(size=[3*nozzle,gapin, 3*length], center=true);
    }
  }
}

module spikes() {
  linear_extrude(height=length) { union(){
    for (i = [0:n-1]){
      polygon(points = [ [r1*cos((-alpha_1/2 + i* alpha-alpha_2/2)*180/PI), 
                          r1*sin((-alpha_1/2 + i* alpha-alpha_2/2)*180/PI)], 
                         [r2*cos((2*beta_2/2 + (i-1)* beta)*180/PI), 
                          r2*sin((2*beta_2/2 + (i-1)* beta)*180/PI)], 
                         [r2*cos((2*beta_2/2 + (i-1)* beta-beta_3)*180/PI), 
                          r2*sin((2*beta_2/2 + (i-1)* beta-beta_3)*180/PI)], 
                         [r1*cos((-alpha_1/2 + i* alpha-alpha_2/2-alpha_3)*180/PI), 
                          r1*sin((-alpha_1/2 + i* alpha-alpha_2/2-alpha_3)*180/PI)]
                         ], 
                   paths = [ [0,1,2,3]]);
    }
  }}
  linear_extrude(height=length) { union(){
    for (i = [0:n-1]){
      polygon(points = [ [r1*cos((-alpha_1/2 + i* alpha+alpha_2/2+alpha_3)*180/PI), 
                          r1*sin((-alpha_1/2 + i* alpha+alpha_2/2+alpha_3)*180/PI)], 
                         [r2*cos(((i)* beta+beta_3)*180/PI), 
                          r2*sin(( (i)* beta+beta_3)*180/PI)], 
                         [r2*cos(( (i)* beta)*180/PI), 
                          r2*sin(( (i)* beta)*180/PI)], 
                         [r1*cos((-alpha_1/2 + i* alpha+alpha_2/2)*180/PI), 
                          r1*sin((-alpha_1/2 + i* alpha+alpha_2/2)*180/PI)]
                         ], 
                   paths = [ [0,1,2,3]]);
    }
  }}
}

module outerholes() {
  union() {
    for (i = [0:n-1]){
      rotate([0,0,(beta_2/2 + i* beta)*180/PI])
        translate([r2-nozzle,0,0]) 
          cube(size=[3*nozzle, gapout, 3*length], center=true);
    }
  }
}

module outercirc(){
  difference(){
    cylinder(h=length, r=r2, $fn=100);
    translate([0,0,-fudge]) cylinder(h=length+2*fudge, r=r2-nozzle, $fn=100);
    outerholes();
  }
}

module innercirc(){
  difference(){
    cylinder(h=length, r=r1+nozzle, $fn=100);
    translate([0,0,-fudge]) cylinder(h=length+2*fudge, r=r1, $fn=100);
    innerholes();
  }
}

module baseform(){
  union(){
    outercirc();
    innercirc();
    spikes();
  }
}

rotate([0,0,-90])
if (holes == "yes") {
  difference(){
  baseform();
  alltext();
  }
} else {
  union(){
    baseform();
    alltext();
  }
}


