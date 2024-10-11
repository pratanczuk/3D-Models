
 nema23(0,1); //nema23 single shaft cylinder



module nema23(has_back, is_cylinder){
  mplate = 60; //mounting plate width
  mplateH = 20; //mounting plate height



  shaftR = 24/2; //shaft radius
  shaftH = 80.6;  //shaft lenght

  bodyL = 46.5; //46.5, 56.1, 77.7, 103.1, ...
  bodyInnerCube = 37.6;

  holeR = 5.21/2;
  holeL = 47.14/2; //distance between hole centres

  difference(){

//mounting plate
cube(size = [mplate,mplate,mplateH], center = true);

//shaft front
translate(v=[0,0,mplateH*2-shaftH/2])cylinder(r=shaftR, h=shaftH, center=true);

//M8
rotate(a=[0,90,0]) translate(v=[0,12,25])cylinder(h=6, r=13/2/sin(60), $fn=6, center=false); 
rotate(a=[0,90,0]) translate(v=[0,12,0])cylinder(r=4, h=shaftH, center=true);

rotate(a=[0,90,0]) translate(v=[0,-12,25])cylinder(h=6, r=13/2/sin(60), $fn=6, center=false); 
rotate(a=[0,90,0]) translate(v=[0,-12,0])cylinder(r=4, h=shaftH, center=true);   
 
translate(v=[holeL,holeL,0]) cylinder(r = holeR, h = 2*mplateH, center=true);
translate(v=[holeL,holeL,10])cylinder(h=6, r=7/2/sin(60), $fn=6, center=true); 

translate(v=[-holeL,holeL,0]) cylinder(r = holeR, h = 2*mplateH, center=true);
translate(v=[-holeL,holeL,10])cylinder(h=6, r=7/2/sin(60), $fn=6, center=true); 

translate(v=[-holeL,-holeL,0]) cylinder(r = holeR, h = 2*mplateH, center=true);
translate(v=[-holeL,-holeL,10])cylinder(h=6, r=7/2/sin(60), $fn=6, center=true); 

translate(v=[holeL,-holeL,0]) cylinder(r = holeR, h = 2*mplateH, center=true);
translate(v=[holeL,-holeL,10])cylinder(h=6, r=7/2/sin(60), $fn=6, center=true); 
  }
  
}
