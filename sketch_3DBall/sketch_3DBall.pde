int quantity = 500;
float posX = 200;
float posY = 200;
ball[] b01;
PImage fade; 

void setup (){
  lights();
  size(400,400, P3D);
  background(255);
  noStroke();
  smooth(4);
  b01 = new ball[quantity];
  
  for (int i=0; i<b01.length; i++ ){
    b01[i]= new ball(new PVector(random(0,width), random(0,height), random(-5,5)),3);
  
  }
  
  fade = get();
}

void draw (){
  
  background(255);
  tint(255,255,255,240);
  image(fade, 0, 0);
  noTint();
  
  for (ball temp: b01) {
    temp.moveRandom();
    temp.draw();
  }
 
  fade = get();


}