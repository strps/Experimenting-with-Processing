class ball {
  float bSize;
  PVector pos;
  
  ball(PVector pos, float bSize){
    this.pos = pos;
    this.bSize = bSize;
  }
  
  void draw (){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    pushStyle();
    lights();
    fill(255);
    sphere(bSize);
    popStyle();
    popMatrix();
  }
  void moveRandom (){
    pos.add(random(-2,2),random(-2,2),random(-2,2)); 
  }
  void moveZplus (){
    pos.add(0, 0, 2);
  }

}