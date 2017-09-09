int cantidad = 2;
gusano[] gusanos = new gusano[cantidad];
color[] colors = new color[5];

int t = 500;



void setup(){
  
//colors[0] = color(38,50,72,150);
//colors[1] = color(126,138,162,150);
//colors[2] = color(255,152,0,150);
//colors[3] = color(0,150);
//colors[4] = color(255,150);

colors[0] = color(255,0,0,255);
colors[1] = color(0,255,0,255);
colors[2] = color(0,0,255,255);
colors[3] = color(0,255);
colors[4] = color(255,255,0,255);
  
for (int i=0; i < cantidad ;i++){
  gusanos[i] = new gusano(colors[int(random(0,5))]); 
}
size(800,800,P2D);
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
  pushStyle();
  fill(255);
  rect(0,0,width,height);
  popStyle();
  
  
  for(gusano t : gusanos){
    t.move();
  }
  
  //t--;
  //if (t<=0){
  //  saveFrame("vid#####.tif");
  //}

  
  
  
}