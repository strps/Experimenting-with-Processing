class sqrC {
  PShape s;
  float a1;
  float b2;
  float c3;
  float d4;

  float size;
  
  sqrC (){
    
    size=150;

   
  }
  sqrC (float t){
    
    size = t;
  
  }
  
  PShape getShape(){
  
    a1=size*(sin(radians(frameCount))/2);
    b2=-a1;
    c3=size*(cos(radians(frameCount))/2);
    d4=-c3;

    s = createShape();
    noFill();
   // s.disableStyle();
    s.beginShape();
    s.vertex(a1  ,d4);
    s.vertex(b2  ,d4);
    s.vertex(b2  ,a1);
    s.vertex(c3  ,a1);
    s.vertex(c3  ,b2);
    s.vertex(b2  ,b2);
    s.vertex(b2  ,c3);
    s.vertex(a1  ,c3);
    s.vertex(a1  ,b2);
    s.vertex(d4  ,b2);
    s.vertex(d4  ,a1);
    s.vertex(a1  ,a1);
    //s.vertex(a1  ,d4);
    s.endShape(CLOSE);
    s.setStrokeWeight(2);
    s.setStrokeJoin(MITER);

    return(s);
    


  }
}