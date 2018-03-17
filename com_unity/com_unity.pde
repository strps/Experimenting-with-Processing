//import peasy.PeasyCam;

icoVert test = new icoVert(100);

PImage invert;
PImage mask;



void setup (){
  
  size(700,700, P3D);
  //ortho();
  background(255);
  fill(0);
  noStroke();

  test.calcVerticesPosition2();
  sphereDetail(100);
  
  
}

void draw () {
  lights();
  pushMatrix();
  translate(width/2,height/2,0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  //background(0);
  pushStyle();
  fill(255);
  //sphere(100);
  mask = get();
  background(255);
  //sphere(100);//chage this to chage the invert style
  popStyle();
  
  test.draw();
  popMatrix();
  
  invert = get();
  invert.mask(mask);
  invert.filter(INVERT);
  image(invert,0,0);


  
  
}