import processing.pdf.*;

int cantidad = 500;
gusano[] gusanos = new gusano[cantidad];
color[] colors = new color[5];

int t = 500;
boolean record;


void setup(){
  rectMode(CENTER);
  
//colors[0] = color(38,50,72,150);
//colors[1] = color(126,138,162,150);
//colors[2] = color(255,152,0,150);
//colors[3] = color(0,150);
//colors[4] = color(255,150);

colors[0] = color(255);
colors[1] = color(255);
colors[2] = color(255);
colors[3] = color(255);
colors[4] = color(255);

  
for (int i=0; i < cantidad ;i++){
  gusanos[i] = new gusano(colors[int(random(0,5))]); 
}
fullScreen(P2D);
//size(800,800,P2D);
smooth(4);
background(0);
fill(0);
noStroke();
//ellipseMode(CENTER);
//for(int y=1;y<16;y++){
//  for(int x=1;x<16;x++){
//    ellipse(50*x,50*y,5,5);
//  }
//}
}

void draw(){
  if (record) {
    beginRecord(PDF, "frame-####.pdf"); 
  }

  background(0);
  
  for(gusano t : gusanos){
    t.move();
  }
  
  if (record) {
    endRecord();
    record = false;
  }

}

void keyPressed() {
  if(key==ENTER){
    saveFrame("vid#####.tif");
  }else if((key=='p')||(key=='P')){
    record = true;
  }
  
}