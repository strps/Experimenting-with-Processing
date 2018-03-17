  void setup (){
   size(500,500,P2D);
  }
  
  void draw () {
    background(255);
     for(int i = 0; i < 40; i++){
       pushMatrix();
       translate(0, height/2);
       ellipse(i*5,(100-i*2.5)*sin(radians(i+frameCount*5)),5,5);
       popMatrix();  
     }
  println(frameRate);
  
  }