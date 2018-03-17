import processing.pdf.*;

float probHigh = .5;

float size = 50;

int xCol = 30;
int yRow = 30;

float xStart = 20;
float yStart = 20;

float xStep = 60;
float yStep = 60;

boolean[][] bitsArray;

float strokeW = 5;

boolean record;

void setup (){
  
  //size(500,500);
  fullScreen();
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeCap(ROUND);
  strokeWeight(strokeW);
  stroke(255);
  noFill();
  
  bitsArray = fillBitsArray(new boolean[xCol][yRow]);
  
}

void draw (){
  if (record) {
    beginRecord(PDF, "frame-####.pdf"); 
  }
  
  background(0);
  for(int y=0; y<yRow;y++){
    for(int x=0; x<xCol;x++){
      pushMatrix();
      translate(x*xStep+xStart,y*yStep+yStart);
      if(bitsArray[x][y]){
        strokeCap(ROUND);
        line(0,-size/2,0,size/2);
      }else{
        ellipse(0,0,size,size);
      }
      popMatrix();
    }
  }
  
  if (record) {
    endRecord();
    record = false;
  }
}

void keyPressed() {
  switch (key){
    case 'g':
      record = true;
      break;
    case 'w':
      probHigh=(probHigh < 1) ? probHigh + 0.1 : probHigh;
      bitsArray = fillBitsArray(new boolean[xCol][yRow]);
      break;
      
    case 's':
      probHigh=(probHigh > 0) ? probHigh - 0.1 : probHigh;
      bitsArray = fillBitsArray(new boolean[xCol][yRow]);
      break;
      
    case 'r':
      bitsArray = fillBitsArray(new boolean[xCol][yRow]);
      break;
      
    case 'a':
      size-=1;
      break;
      
    case 'd':
      size+=1;
      break;
      
    case '+':
      strokeW += 0.1;
      strokeWeight(strokeW);
      println(strokeW);
      break;
      
    case '-':
      strokeW = (strokeW-0.1 <=0)?0:strokeW-0.1;
      strokeWeight(strokeW);
      println(strokeW);
      break;
      
    case CODED:
    switch (keyCode){
      case LEFT:
        xStep -= 1;
        break;
      case RIGHT:
        xStep += 1;
        break;   
      case DOWN:
        yStep -= 1;
        break;
      case UP:
        yStep += 1;
        break;
    }      
  }   
}

boolean[][] fillBitsArray (boolean[][] bitA){
  for(int y=0; y<yRow; y++){
    for(int x=0; x<xCol; x++){
      bitA[x][y]=randomBool();
    }
  }
  return bitA;
}

boolean randomBool() {
  return random(1) < probHigh;
}