
hexagon[] hexs =new hexagon[10000];  
PImage img;

void setup() {
  size(1080,1080);
  background(0);
  noStroke();
  img= loadImage("skull.jpg");
  img.resize(width,height);
  imageMode(CENTER);
  for(int i=0;i<10000;i++){
  
    hexs[i]=new hexagon(random(0,width),random(0,height),img);
  
  }
}

void draw() {
  
  pushStyle();
  fill(0,25);
  rect(0,0,width, height);
  popStyle();
  
  for(hexagon a:hexs){
    a.drawH();
  }

saveFrame("vid####.tif");
  
}