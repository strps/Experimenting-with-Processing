public class gusano {
  
  ArrayList<PVector> interVertex = new ArrayList<PVector>();  
  
  float gridSize;
  float weight;
  float speed;
  headTail head;
  headTail tail;
  color col;
  
  gusano(color c){
    gridSize=25;
    weight=5;
    speed=4;
    col=c;  
    float xorg=0;
    float yorg=400;
    float xdes=400;
    float ydes=400;
    interVertex.add(new PVector(xorg,yorg));
    interVertex.add(new PVector(xdes,ydes));
    
    head = new headTail(xorg, yorg, xdes, ydes, 1);
    tail = new headTail(xorg-200 , yorg, xorg, yorg, 0);
  
  }
  
  void move(){
    
    head.updatePos();
    tail.updatePos();
    
    pushStyle();
    noFill();
    strokeWeight(weight);
    stroke(col);
    strokeJoin(ROUND);
        
    //if(interVertex.size()>0){
      beginShape();      
      vertex(tail.pos.x,tail.pos.y);
      for(int i=0; i < interVertex.size()-1; i++){
        vertex(interVertex.get(i).x,interVertex.get(i).y);}
      vertex(head.pos.x,head.pos.y);
      endShape();
    if(interVertex.size()<2){
      line(head.pos.x,head.pos.y,tail.pos.x,tail.pos.y);
  } 
    
    
    
    
    //ellipse(head.pos.x,head.pos.y,10,10);
    //  for(PVector e:interVertex){
    //    ellipse(e.x,e.y,8,8);
    //  }  
    //ellipse(tail.pos.x,tail.pos.y,10,10);
    
    popStyle();
  }
  
  
  
  private class headTail {
    PVector pos; //posicion actual
    PVector des; //destino
    PVector dir; //vector unitario de direccion
    float dist;  //distancia por recorrer
    int def;  // cabeza o cola
    
    headTail(float x, float y, float desX, float desY ,int d){
      def=d;
      pos = new PVector();
      des = new PVector();
      dir = new PVector();
      pos.x= x;
      pos.y= y;
      des.x= desX;
      des.y= desY;
      dist= pos.dist(des);
      dir=PVector.sub(des,pos).normalize(null);
    }
    
    void updatePos (){
      
      dist -= speed;
      
      if (dist < 0){
        
        PVector newDes;
        if(def == 1){  //if is head
          
          interVertex.add(des);
          
          float x;
          float y;
          
          if(des.x > gridSize && des.x < width-gridSize){
           x =des.x+(round(random(-1,1)))*gridSize;
          }else if(des.x <= gridSize){
           x =des.x+(round(random(0,1)))*gridSize;
          }else{ x =des.x+(round(random(-1,0)))*gridSize;}
          
          if(des.y > gridSize && des.y < height-gridSize){
           y =des.y+(round(random(-1,1)))*gridSize;
          }else if(des.y <= gridSize){
           y =des.y+(round(random(0,1)))*gridSize;
          }else{ y = des.y+(round(random(-1,0)))*gridSize;}
          
          newDes = new PVector(x,y);          
          interVertex.add(newDes);
          
        }else{  //if is tail
          newDes=interVertex.get(0);
          interVertex.remove(0);
        }
        dir=PVector.sub(newDes,des).normalize(null);
        pos.x= des.x-dist*dir.x;
        pos.y= des.y-dist*dir.y;
        dist += des.dist(newDes);
        
        des = newDes;
        
      }else{
        
        pos.x+=speed*dir.x;
        pos.y+=speed*dir.y;
        
      }
      
      
    }
  }
  
}