gusanito gus = new gusanito();

void setup (){
  size(1200,600,P3D);
  background(0);

}

void draw (){
  background(0);
  gus.moveSin();
  gus.draw();
}