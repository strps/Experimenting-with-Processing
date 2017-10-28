class bug {
  
  PVector pos;
  float[] fillColor =new float[3];
  float speed;
  float size;
  FFT fft;

  
  bug (FFT fft){
    this.fft=fft;  
    pos = new PVector();
    pos.x = 0;//random(-width/2, width/2);
    pos.y = 0;//random(-height/2, height/2);
    speed = random (0.5, 4);
    size = 10;
    fillColor[0]= random(10,255);
    fillColor[1]= random(10,255);
    fillColor[2]= random(10,255);
  }
  
  void draw () {
    if(mousePressed){
    if (mouseButton == LEFT){
      
      pos.x += random(-speed, speed)+speed*pos.normalize(null).x;
      pos.y += random(-speed, speed)+speed*pos.normalize(null).y; 
      
    }if (mouseButton == RIGHT){
      
      pos.x += random(-speed, speed)-speed*pos.normalize(null).x;
      pos.y += random(-speed, speed)-speed*pos.normalize(null).y;
      
    }
    }//else{
      
   //   pos.x += random(-speed, speed);
     // pos.y += random(-speed, speed);
      
   // }
    
    if(keyPressed){
      
      switch (key){
      
      case 'r':
        fillColor[0] += 5;
        fillColor[1] += random(-5,5);
        fillColor[2] += random(-5,5);
        break;
        
      case 'R':
      
        fillColor[0] -= 5;
        //fillColor[1] += random(-5,5);
        //fillColor[2] += random(-5,5);
        break;
        
      case 'g':
      
        fillColor[0] += random(-5,3);
        fillColor[1] +=5;
        fillColor[2] += random(-5,3);
        break;
        
      case 'b':
        
        fillColor[0] += random(-5,3);
        fillColor[1] += random(-5,3);
        fillColor[2] += 5;
        break;
      
      default:
        
        fillColor[0]+= 1;
        fillColor[1]-= 1;
        fillColor[2]-= 1;
        break;
        
      }
      
    }else{
      
      randomizeColor(fillColor[0]);
      randomizeColor(fillColor[1]);
      randomizeColor(fillColor[2]);
    }
    
    fill (fillColor[0],fillColor[1],fillColor[2]);
    float bandNumber = map(fillColor[0], 0, 255, 0, 4)*8 + map(fillColor[0], 0, 255, 0, 2)*8 + map(fillColor[0], 0, 255, 0, 1)*8;
    float avg; 
    try{
      avg= fft.getAvg(round(bandNumber));
      ellipse(pos.x+avg*pos.normalize(null).x*4, pos.y+avg*pos.normalize(null).y*4, size, size);
    }catch(IndexOutOfBoundsException e){
      println(round(bandNumber));
    }
    
  }
  
  void randomizeColor (float c){
   c += random(-5,5);
   if (c > 255){ c=255;} 
   else if (c < 0){ c=0;} 
  }
  

}