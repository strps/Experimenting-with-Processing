  int steps = 10;
  
void setup() {
  fill(0);
  stroke(255);
  pushStyle();
  size(1000, 1000); 
  stroke(255);
  noFill();
  smooth(4);
  
  
}

void draw() {
  fill(0,20);
  rect(0,0, width,height);
  noFill();
  stroke(255);
  bezier(width/2, height-50, width/2, height-300, mouseX, mouseY, mouseX, mouseY);
  
  for (int i = 0; i <= steps; i++) {
  float t = i / float(steps);
  float x = bezierPoint(width/2, width/2, mouseX, mouseX, t);
  float y = bezierPoint(height-50, height-300, mouseY, mouseY, t);
  popStyle();
  ellipse(x, y, 5, 5);
  pushStyle();
  }
}