class bug {
  PVector pos;
  float[] fillColor =new float[3];
  float speed;
  FFT fft;
  int band;
  
  bug (FFT fft){
    this.fft=fft;
    band = (int)random(0, fft.avgSize());
    pos = new PVector();
    pos.x = 0;//random(-width/2, width/2);
    pos.y = 0;//random(-height/2, height/2);
    pos.z = 0;
    speed = random (0.5, 4);
    //size = 30;
    fillColor[0]= random(10,255);
    fillColor[1]= random(10,255);
    fillColor[2]= random(10,255);
  }
  
  void draw () {
    if(mousePressed){
    if (mouseButton == LEFT){
      
      pos.x += random(-speed, speed)+speed*pos.normalize(null).x;
      pos.y += random(-speed, speed)+speed*pos.normalize(null).y; 
      pos.z += random(-speed, speed)+speed*pos.normalize(null).z; 
      
    }if (mouseButton == RIGHT){
      
      pos.x += random(-speed, speed)-speed*pos.normalize(null).x;
      pos.y += random(-speed, speed)-speed*pos.normalize(null).y;
      pos.z += random(-speed, speed)-speed*pos.normalize(null).z; 
      
    }
    }else{
      
      pos.x += random(-speed, speed);
      pos.y += random(-speed, speed);
      pos.z += random(-speed, speed);
    }
    
    if(keyPressed){
      
      switch (key){
      
      case 'r':
        fillColor[0] += 10;
        //fillColor[1] += random(-5,5);
        //fillColor[2] += random(-5,5);
        break;
        
      case 'R':
      
        fillColor[0] -= 10;
        //fillColor[1] += random(-5,5);
        //fillColor[2] += random(-5,5);
      break;
        
      case 'g':
      
        //fillColor[0] += random(-5,3);
        fillColor[1] +=10;
        //fillColor[2] += random(-5,3);
      break;
        
      case 'G':
      
        //fillColor[0] += random(-5,3);
        fillColor[1] -=10;
        //fillColor[2] += random(-5,3);
        break;
        
        
      case 'b':
        
        //fillColor[0] += random(-5,3);
        //fillColor[1] += random(-5,3);
        fillColor[2] += 10;
        break;
        
      case 'B':  
        //fillColor[0] += random(-5,3);
        //fillColor[1] += random(-5,3);
        fillColor[2] -= 10;
        break;
        
      default:
        
        
        break;
        
      }
      
    }else{
      
      fillColor[0]= fillColor[0]+random(-5,5);
      fillColor[1]= fillColor[1]+random(-5,5);
      fillColor[2]= fillColor[2]+random(-5,5); 
      
    }
    pushStyle();
    fill (fillColor[0],fillColor[1],fillColor[2]);
    pushMatrix();
    translate(pos.x+fft.getAvg(band)*pos.normalize(null).x*4, pos.y+fft.getAvg(band)*pos.normalize(null).y*4, pos.z+fft.getAvg(band)*pos.normalize(null).z*4);
    sphere(size);
    popMatrix();
    popStyle();
 
  }
  


}