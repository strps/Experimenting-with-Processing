color emitterColor = color(0);
color backgroundColor = color(255,5);
int cantidad = 500;



emitter[] emitters = new emitter[cantidad];


void setup() {
  //size(1080,1080);
  fullScreen();
  noStroke();
  background(backgroundColor);
  for(int i=0; i<cantidad; i++){
    emitters[i]= new emitter(random(0,width),random(0,height), emitterColor);
  }
}

void draw() {
  
  fill(backgroundColor);
  rect(0,0,width,height);
  for(emitter t: emitters){
    t.draw();
  }
  println(frameRate);
  
}