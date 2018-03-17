
plant[] p;

void setup (){
  size(1080,1080, P2D);
  noStroke();
  p = new plant[10]; 
  for(int i = 0 ; i < 10 ; i++){
    p[i] = new plant(random(0, width), random(0, height));
  }
  
}

void draw (){
  background(0);
  for(plant temp : p){
    temp.draw();
  }
  

}