/**
  * This sketch demonstrates how to use an FFT to analyze an 
  * AudioBuffer and draw the resulting spectrum. <br />
  * It also allows you to turn windowing on and off, 
  * but you will see there is not much difference in the spectrum.<br />
  * Use the number keys to choose different windows.
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;
String windowName;

void setup()
{
  size(1024, 512, P3D);
  
  minim = new Minim(this);
  
  jingle = minim.loadFile("rave.mp3", 2048);
  jingle.loop();
  
  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum
  // will be 512. see the online tutorial for more info.
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  
  textFont(createFont("Arial", 16));
  
  windowName = "Rectangular Window";
}

void draw()
{
  background(0);
  stroke(255);
  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(jingle.mix);
  
  pushStyle();
    fill(200,0,0);
    noStroke();
    float bandDBa = 20 * log( 2 * fft.getAvg(20) / fft.timeSize() );
    float bandHeighta = map( bandDBa, 0, -150, 0, height );
    rect(0, height-bandHeighta, 10, bandHeighta );
  popStyle();
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    // convert the magnitude to a DB value. 
    // this means values will range roughly from 0 for the loudest
    // bands to some negative value.
    float bandDB = 20 * log( 2 * fft.getBand(i) / fft.timeSize() );
    // so then we want to map our DB value to the height of the window
    // given some reasonable range
    float bandHeight = map( bandDB, 0, -150, 0, height );
    line(i, height, i, bandHeight );
  }
  fill(255);
  // keep us informed about the window being used
  text("The window being used is: " + windowName, 5, 20);
  println(fft.specSize(), jingle.bufferSize(), jingle.sampleRate(), fft.calcAvg(20, 2000), fft.getBandWidth());
}

void keyReleased()
{
  WindowFunction newWindow = FFT.NONE;
  
  if ( key == '1' ) 
  {
    newWindow = FFT.BARTLETT;
  }
  else if ( key == '2' )
  {
    newWindow = FFT.BARTLETTHANN;
  }
  else if ( key == '3' )
  {
    newWindow = FFT.BLACKMAN;
  }
  else if ( key == '4' )
  {
    newWindow = FFT.COSINE;
  }
  else if ( key == '5' )
  {
    newWindow = FFT.GAUSS;
  }
  else if ( key == '6' )
  {
    newWindow = FFT.HAMMING;
  }
  else if ( key == '7' )
  {
    newWindow = FFT.HANN;
  }
  else if ( key == '8' )
  {
    newWindow = FFT.LANCZOS;
  }
  else if ( key == '9' )
  {
    newWindow = FFT.TRIANGULAR;
  }

  fft.window( newWindow );
  windowName = newWindow.toString();
}