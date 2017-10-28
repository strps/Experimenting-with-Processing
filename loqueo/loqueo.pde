void setup () {

  size (500, 500, P3D);
  noStroke();
}

void draw () {
  
  background(0); 
  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  box(40);

}