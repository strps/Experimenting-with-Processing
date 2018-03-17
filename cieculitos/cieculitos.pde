 float count;
 float space = 50;

void setup (){
  count = 0;
  size(800,800);
  blendMode(SUBTRACT);
  noFill();

}


void draw () {
  background(255);
  count = (count >= space)?0:count+1;
  for (int i = 0; i < 25; i++){
    pushMatrix ();
    pushStyle();
    strokeWeight(i*2);
    translate(width/2,height/2);
    rotate(random(0,TWO_PI));
    
    stroke(0, 0, 255, 255);
    ellipse(0,0, i*space+count-random(-4,4), i*space+count-random(-4,4));
    
    stroke(255, 0, 0, 255);
    ellipse(0,0, i*space+count-random(-4,4), i*space+count-random(-4,4));
    
    stroke(0, 255, 0, 255);
    ellipse(0,0, i*space+count-random(-4,4), i*space+count-random(-4,4));

    popStyle();
    popMatrix();
  }
  if (frameCount <= 500){
    saveFrame("vid-#####.tif");
  }
}