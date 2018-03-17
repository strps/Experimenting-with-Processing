int count = 0;
PImage maskImg;
PGraphics graph;
void setup(){
  size(1080,1080,P2D);
  background(255);
  maskImg = loadImage("square.bmp");
  graph = createGraphics(1080,1080,P3D);
  rectMode(CENTER);

}

void draw(){
  if(count >= 15){
  count=0;
  }else{count ++;}
  
  background(255);
  

  graph.beginDraw();
  background(255);
  for(int i = 0; i < 10; i++){
    pushStyle();
    pushMatrix();
    fill(0,0);
    rotate(sin(count/100));
    println(count/10);
    translate(graph.width/2,graph.height/2);
    stroke(0,255);
    strokeWeight(5);
    rect(0,0, i*30+count*2,i*30+count*2);
    popMatrix();
    popStyle();
  }
  
  for(int i = 0; i < 10; i++){
    pushStyle();
    fill(0,0);
    stroke(0,255);
    strokeWeight(5);
    line(216,graph.height/2+i*15+count/2, 324,graph.height/2+i*15+count/2);
    line(216,graph.height/2-i*15-count/2, 324,graph.height/2-i*15-count/2);
    popStyle();
  }
  
  for(int i = 0; i < 10; i++){
    pushStyle();
    fill(0,0);
    stroke(0,255);
    strokeWeight(5);
    line(756,graph.height/2+i*15+count, 864,graph.height/2+i*15+count);
    line(756,graph.height/2-i*15-count, 864,graph.height/2-i*15-count);
    popStyle();
  }
  
    for(int i = 0; i < 10; i++){
    pushStyle();
    fill(0,0);
    stroke(0,255);
    strokeWeight(5);
    line(756,graph.height/2+i*15+count, 864,graph.height/2+i*15+count);
    popStyle();
  }
  
    for(int i = 0; i < 10; i++){
    pushStyle();
    fill(0,0);
    stroke(0,255);
    strokeWeight(5);
    line(i*15+count,324, i*15+count,756);
    popStyle();
  }
  
    for(int i = 0; i < 10; i++){
    pushStyle();
    fill(0,0);
    stroke(0,255);
    strokeWeight(5);
    line(1080-i*15-count,324, 1080-i*15-count,756);
    popStyle();
  }
  
  graph.endDraw();
  graph.mask(maskImg);
  image(graph,0,0);
}