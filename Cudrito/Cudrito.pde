int count = 0;

void setup (){
  frameRate(30);
  size(500,500,P2D);
  rectMode(CENTER);
  fill(0,0);
  strokeWeight(2);
  stroke(255);
}

void draw (){
  if(count<15){
    count++;
  }else{
    count=0;
  }
  background(0);
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0; i < 100; i++){
  pushStyle();
  fill(0,0);
  strokeWeight(2);
  stroke(255);  
  rotate(sin(radians(frameCount/2)));
  rect(0,0,i*15,i*15);
  popStyle();
  }
  popMatrix();
  println(frameRate);
  println(frameCount);
  println(sin(radians(frameCount)));
}