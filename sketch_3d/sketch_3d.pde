import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;

void setup (){

  size(800,800,P3D);
  cam = new PeasyCam(this, 800);
  noStroke();
  
  
}

void draw (){
  //pushStyle();
  //fill(0);
  //rect(0,0,width,height);
  //popStyle();
  background(0);
  //lights();
 
  box(150);
  
  


}