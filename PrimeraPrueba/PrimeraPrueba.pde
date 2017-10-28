import ddf.minim.analysis.*;
import ddf.minim.*;
  int cantidad = 300;

  bug[] bugArray= new  bug[cantidad];
  float rot = 0;
  
  Minim minim;
  AudioInput in;
  FFT fft;
  float size = 10 ;
  
  PImage fade;

void setup(){
  //size(800,800);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,512);
  fft= new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60,7);
  
  fullScreen(P3D);
  background(0);
  noStroke();
  rectMode(CENTER);

  for (int i=0;i<cantidad;i++) {bugArray[i]=new bug(fft);}
  fade =get(0,0, width, height);
}

void draw(){
  
  pushStyle();
  tint(255,255,255,90);
  image(fade, 0,0);
  popStyle();

  fft.forward(in.mix);
  pushStyle();
  stroke(255);
  for(int i = 0; i < fft.avgSize(); i++){
    line(i, height, i, height-fft.getAvg(i));
  }
  popStyle();
  
  
  translate(width/2,height/2,400);
  //ambientLight(100,100,100,0,0,0);  
  sphere(40);
  pointLight(255, 255, 255, 0, 0, 0);
  lightSpecular(255, 0, 0);
  
  rotateZ(rot);
  rotateY(rot);
  rotateX(rot);
  for (bug i:bugArray){i.draw();}
  rot += 0.015 + random(0, 0.02);
  
 
  
  
  if(keyPressed){
      switch (key){
      
      case 's':
        size -=0.1;
        break;
        
      case 'S':
        size +=0.1;
        break;
      }
  }
  
  
  

}