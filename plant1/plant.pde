
class plant {
  section[] sections;
  PVector movDir = new PVector(0,1);
  float step = 2;

  plant (float x, float y){
    sections = new section[128];
    
    for(int i = 0; i < 128; i++){
      sections[i] = new section(x, y, 0, 0);
    }
    movDir.rotate(random(0, TWO_PI));
  }
  
  void draw (){
    for(int i = 0; i < 128; i++ ){
      if(i == 127){
        movDir.rotate(0.5*random(-1,1));
        sections[i] = new section(sections[i-1].getPositionX()+movDir.x*step, sections[i-1].getPositionY()+movDir.y*step, 3, PVector.angleBetween(movDir,new PVector(0,1)) );  // it change the position of the first section.
      }else{
        sections[i] = sections[i+1]; // it change the postion of al the secitons to the position of the next section
      }
      sections[i].draw(i*2,i*2,i*2);
    
    }
  }
}

/**************section class******************/

class section {
  float size;
  PVector pos;
  int type;
  float rotation;
  PShape leaf = loadShape("leaf.svg");
  
  section (float x, float y, float size, float rotation){
    leaf.disableStyle();
    this.size = size;
    this.pos = new PVector(x,y);
    this.type = int(random(0,50));
    this.rotation = rotation;
  }
  
  void draw (float r, float g, float b){
    pushMatrix();
    pushStyle();
    translate(pos.x, pos.y);
    rotate(rotation);
    fill(r,g,b);
    ellipse(0,0,size,size);
    if(type == 1){
      shape(leaf, size/2, -size*2, size*4, size*2);
      
    }
    popStyle();
    popMatrix();
    
    this.size += 0.1;
  }
  
  void setPosition (float x, float y){
    pos.x = x;
    pos.y = y;
  
  }
  
  float getPositionX (){
    return pos.x;
  }
  
  float getPositionY (){
    return pos.y;
  }
  
}