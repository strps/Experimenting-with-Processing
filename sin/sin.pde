PVector v1, v2;

void setup() {
  size(1080,1080);
 ellipseMode(RADIUS);
}

void draw() {
  rect(0,0,width,height);
  gCircle circulo = new gCircle();
  circulo.draw();
}

class gCircle {
  
  int radio;
  
  void draw (){
    ellipseMode(RADIUS);
   ellipse(width/2, height/2, 150+100*sin(radians(frameCount)),150+100*sin(radians(frameCount)));
  }

}