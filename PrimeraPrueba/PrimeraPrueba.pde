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
  
  int[] lightColor = new int[3];

void setup(){
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,2048);
  fft= new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60,7);
  lightColor[0]=0;
  lightColor[0]=0;
  lightColor[0]=0;
  
  frameRate(24);
  fullScreen(P3D);
  //size(1000,1000, P3D);
  smooth(4);
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
  rotateZ(rot);
  rotateY(rot);
  rotateX(rot);
  pushStyle();
  fill(lightColor[0], lightColor[1] ,lightColor[2]);
  sphere(40);
  popStyle();
  pointLight(lightColor[0],lightColor[1],lightColor[2], 0, 0, 0);
  //ambientLight(lightColor[0],lightColor[1],lightColor[2]);
  lightSpecular(255, 0, 0);
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
  
  //if ((frameCount % 3) == 0){
    lightColor[0]=0;
    lightColor[1]=0;
    lightColor[2]=0;
    lightColor[(frameCount/2) % 3]=255;
  //}
println(lightColor);
}