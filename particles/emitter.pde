class emitter{
  
  ArrayList<particle> particles;
  float posX;
  float posY;
  color particleColor;
  
  emitter (float x, float y, color z){
    
    posX=x;
    posY=y;
    particleColor=z; 
    particles = new ArrayList<particle>();
    for(int i=0; i<20;i++){
      particles.add(new particle(posX,posY));
    }
  }
  
  void draw (){
    for(particle t:particles){
      t.drawP();
    }
    posX+= random(-1,1);
    posY+= random(-1,1);
  }
  
  void removeNadd(particle t){
    particles.remove(t);
    
  }
  
  class particle {
  
  int life;
  int time;
  float size;
  float angle;
  float rotAngle; //direccion de emision de la particular
  float offsetX;
  float offsetY;
  float dist;
  float maxSize;

  emitter emit;
   
  particle(float x, float y){
    life = 0;
    rotAngle = random(0,6.3);
    posX=x;
    posY=y;
    offsetX=posX + random(-20,20);
    offsetY=posY + random(-20,20);
    time = int(random(10,600));
    dist = random(20,50);
    maxSize = random(8,12);

  }

  void drawP (){
    time--;
    if (time<0){
      life += 1;
      angle=radians(2*life-90);
      
      size=maxSize*cos(angle)-pow(0.04*cos(angle),3);
      pushMatrix();
      translate(offsetX,offsetY);
      rotate(rotAngle);
      noStroke();
      fill(particleColor);
      ellipse(0,dist*(sin(angle)+1),size,size);
      popMatrix();
  
      if(2*life-90>90){
        life=0;
        rotAngle = random(0,6.3);
        time = int(random(10,120)); 
        offsetX = posX + random(-5,5);
        offsetY = posY + random(-5,5);
        dist = random(20,50);
        maxSize = random(8,12);

      }
    }
    
  }
}
  


}