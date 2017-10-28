sqrC cuadrado = new sqrC(50);
PShape s;

void setup() {
  size(855, 855, P2D);
  frameRate(60);
  rectMode(CENTER);
  noFill();
  background(0);
  

  
}

void draw() {
  fill(0);
  rect(width/2, height/2,width, height);
  s=cuadrado.getShape();
  
  translate(28,28.5);
  stroke(255);
  for(int i=0; i<256 ; i++){
    shape(s);
    translate(53,0);
    if ((i+1)%16==0 && i>0){
      translate(-848,53);
    }
  }
  
  println(frameRate);
}