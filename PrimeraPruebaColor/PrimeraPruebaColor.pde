import ddf.minim.analysis.*;
import ddf.minim.*;
  int cantidad = 700;

  bug[] bugArray= new  bug[cantidad];
  float rot = 0;
  
  Minim minim;
  AudioInput in;
  FFT fft;

void setup(){
  //size(800,800);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,512);
  fft= new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60,7);
  
  fullScreen();
  background(0);
  noStroke();
  for (int i=0;i<cantidad;i++) {bugArray[i]=new bug(fft);}
}

void draw(){
  
  fft.forward(in.mix);
  pushStyle();
  stroke(255);
  for(int i = 0; i < fft.avgSize(); i++){
    line(i, height, i, height-fft.getAvg(i));
  }
  popStyle();
  
  translate(width/2,height/2);
  fill(0,40);
  rect(-width/2,-height/2,width,height);
  rotate(rot);
  for (bug i:bugArray){i.draw();}
  rot += 0.03;
  println(fft.avgSize());

}