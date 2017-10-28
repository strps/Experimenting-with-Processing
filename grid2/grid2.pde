void setup (){
  size(600,600, P3D);
  background(0);

}

void draw (){
  for(int j=0; j <= height ; j += 50){
    for(int i =0 ; i <= width ; i += 50){
      pushMatrix();
      translate(i,j);
      ellipse(0,0, 10,10);
      popMatrix();
    }
  }
}