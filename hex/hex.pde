
hexagon[] hexs =new hexagon[5000];  
PImage img;

void setup() {
  size(1600,1200);
  background(0);
  noStroke();
  img= loadImage("ClintEastwood.jpg");
  img.resize(width,height);
  imageMode(CENTER);
  for(int i=0;i<7000;i++){
  
    hexs[i]=new hexagon(random(0,width),random(0,height),img);
  
  }
}

void draw() {
  
  pushStyle();
  fill(0,26);
  rect(0,0,width, height);
  popStyle();
  
  for(hexagon a:hexs){
    a.drawH();
  }


  
}