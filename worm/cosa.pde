class gusanito {
  
  int lenght;
  float step;
  float ancho;
  
  ArrayList<PVector> pos;
  PVector dir;
   
  
  gusanito () {
    lenght = 30;
    step = 3;
    ancho = 10; 
    pos = new ArrayList<PVector>(30);
    
    for (int i=0; i < lenght;i++){
      pos.add(new PVector(width, height));
    }
    dir = new PVector(1,1);
    
  }
  
  gusanito (int lenght, float step, float ancho) {
    this.lenght = lenght;
    this.step = step;
    this.ancho = ancho; 
  }
  
  void moveRandom(){
    PVector newPos = new PVector();
    PVector.add(pos.get(0), dir.normalize().mult(step), newPos);
    pos.add(0, newPos);
    pos.remove(30);
    float t = 0.5;
    dir.add(random(-t,t),random(-t,t)).normalize();
  }
  
  void moveSin(){
    PVector newPos = new PVector(pos.get(0).x,0);
    newPos.y = 100*sin(radians(frameCount))+height/2;
    newPos.x += 1;
    pos.add(0, newPos);
    pos.remove(30);
    
  }
  
  void draw (){
    for(PVector temp: pos){
      pushStyle();
      fill(255);
      stroke(255);
      ellipse(temp.x,temp.y, ancho, ancho);
      popStyle();
    }
  
  
  }
  

}