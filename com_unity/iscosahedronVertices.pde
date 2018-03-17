class icoVert {
  PVector[] vertices;
  cilinder[] edges;
  float radius; 
  float gld = (1 + sqrt(5))/2;

  icoVert(float radius){
    this.radius=radius;
    
    vertices= new PVector[12];
    edges = new cilinder[30];
    

  }
  void calcVerticesPosition1 (){
    vertices[0]=new PVector(0,0,radius);
    vertices[11]=new PVector(0,0,-radius);
    for(int i = 1; i < 6; i++){
    }
    for(int i = 1; i < 6; i++){
    }
  }
  
  void calcVerticesPosition2 (){
    
    vertices[0] = new PVector  (0,   gld,  1);
    vertices[1] = new PVector  (0,  -gld,  1);
    vertices[2] = new PVector  (0,   gld, -1);
    vertices[3] = new PVector  (0,  -gld, -1);
    
    vertices[4] = new PVector  (1,   0,   gld);
    vertices[5] = new PVector  (1,   0,  -gld);
    vertices[6] = new PVector  (-1,  0,   gld);
    vertices[7] = new PVector  (-1,  0,  -gld);
    
    vertices[8] = new PVector  (gld, 1,   0);
    vertices[9] = new PVector  (-gld,1,   0);
    vertices[10] = new PVector (gld,-1,   0);
    vertices[11] = new PVector(-gld,-1,  0);
    
    this.calcEdges ();
  }
  
  void calcEdges () {
     int count = 0;
     for (int i = 0; i < 12; i++ ){
       for(int c = i ; c < 12; c++){
         if(vertices[i].dist(vertices[c]) <=  2.1 && i != c){  
          edges[count]= new cilinder(
             vertices[i].x*radius,
             vertices[i].y*radius, 
             vertices[i].z*radius,
             vertices[c].x*radius,
             vertices[c].y*radius, 
             vertices[c].z*radius, 
             7, 
             40);
           count++;      
         }
       }  
     }
  }
  
  void draw (){
    for (PVector temp: vertices){
      pushMatrix();
      translate(radius*temp.x,radius*temp.y,radius*temp.z);
      sphere(20);
      popMatrix();
      
    }
    
    for (cilinder temp: edges){
      temp.draw();    
  }
}
}





//Cilinder Class


class cilinder {

  float radius;
  PVector start;
  PVector end;

  int detail;
  
  PVector a;
  PVector b;

  
  cilinder(float startX, float startY, float startZ, float endX, float endY, float endZ, float radius, int detail){
    
   start= new PVector(startX, startY, startZ);
   end =new PVector (endX,endY,endZ);
   this.detail= detail;
   this.radius = radius;
   
   PVector sub = PVector.sub(end,start).normalize();
   if(sub.z == 0){
     a= new PVector(1,1,(-sub.x-sub.y)/1).normalize();
   }else{
     a= new PVector(1,1,(-sub.x-sub.y)/sub.z).normalize();
   }
   b= new PVector();
   PVector.cross(a,sub,b);//y aqui esta el error

  }
  
  void draw (){
    pushMatrix();
    beginShape(TRIANGLE_STRIP);
    float angle;
    for(int i = 0; i <= detail ; i++){
       angle = (TWO_PI/detail)*i; 
       vertex(start.x + radius*cos(angle)*a.x + radius*sin(angle)*b.x, start.y + radius*cos(angle)*a.y + radius*sin(angle)*b.y, start.z + radius*cos(angle)*a.z + radius*sin(angle)*b.z);
       vertex(end.x + radius*cos(angle)*a.x + radius*sin(angle)*b.x, end.y + radius*cos(angle)*a.y + radius*sin(angle)*b.y, end.z + radius*cos(angle)*a.z + radius*sin(angle)*b.z);
    }
    endShape();
    popMatrix();
  }
    
}