class hexagon {
  PVector pos;
  PImage img;
 
  
  hexagon(float x, float y,PImage i){
    pos=new PVector();
    img=i;
    pos.x=x;
    pos.y=y; 
  
  }
  
  void drawH(){
    color c = img.get(int(pos.x),int(pos.y));
    //int a = (c >> 24) & 0xFF;
    int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
    int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
    int b = c & 0xFF;          // Faster way of getting blue(argb)
    float multi=(r+g+b);
    //println(multi);
    pos.x+=random(-2,2);
    pos.y+=random(-2,2);
    float dist = pos.dist(new PVector(width/2,height/2));
    float size=multi*0.01*sin(radians(dist-5*frameCount));
    polygon(pos.x, pos.y, size, 6);  
    
  }
  
  void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
  
  void size(){
    
    

  }
}