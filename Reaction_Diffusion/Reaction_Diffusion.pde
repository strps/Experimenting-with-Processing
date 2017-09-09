

float dA = 1;
float dB = 0.5;
float feed = 0.055;
float k = 0.062;
float dT = 0.9;


float[][][] grid;
float[][][] nextGrid;

void setup(){

  size(800,800,P3D);
  frameRate(60);
  
  //inicializar la arrays de los Grid
  grid = new float[width][height][2] ;
  nextGrid =new float[width][height][2];
  
  //inicializar los valores en el Grid
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      grid[i][j][0]=1;  //valores iniciales de a
      grid[i][j][1]=0;  //valores iniciales de b
    }
  }
  
  //crear un area con valores contrarios
  for(int i = (width/2)-21; i < (width/2)+20; i++){
    for(int j = (height/2)-21; j < (height/2)+20; j++){
      grid[i][j][0]=1;  //valores iniciales de a
      grid[i][j][1]=1;  //valores iniciales de b
    }
  }
  
  
  
}

void draw(){
   
  
  loadPixels();
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      float a = grid[i][j][0];
      float b = grid[i][j][1];
      
      pixels[i+j*width]=color((a-b)*255); //dibujar el grid en la pantalla
      
      
      
      int px=1 , mx=1, py=1, my=1;
      
      //border solution continuity
      if(i==0){mx=-(width-1);}else if(i==width-1){px=-(width-1);}
      if(j==0){my=-(width-1);}else if(j==width-1){py=-(width-1);}
      
      //calculo del convolution de A
      float lapA =0;
      lapA += a*-1;
      // adjacents neightbors
      lapA += grid[i-mx][j][0]*0.2;
      lapA += grid[i+px][j][0]*0.2;
      lapA += grid[i][j-my][0]*0.2;
      lapA += grid[i][j+py][0]*0.2;
      // diagonals neightbors
      lapA += grid[i-mx][j-my][0]*0.05;
      lapA += grid[i-mx][j+py][0]*0.05;
      lapA += grid[i+px][j-my][0]*0.05;
      lapA += grid[i+px][j+py][0]*0.05;
      
      
      //calculo del convolution de B
      float lapB =0;
      lapB += b*-1;
      // adjacents neightbors
      lapB += grid[i-mx][j][1]*0.2;
      lapB += grid[i+px][j][1]*0.2;
      lapB += grid[i][j-my][1]*0.2;
      lapB += grid[i][j+py][1]*0.2;
      // diagonals neightbors
      lapB += grid[i-mx][j-my][1]*0.05;
      lapB += grid[i-mx][j+py][1]*0.05;
      lapB += grid[i+px][j-my][1]*0.05;
      lapB += grid[i+px][j+py][1]*0.05;
      
      
      
      nextGrid[i][j][0] = a + ( dA*lapA - a*b*b + feed*(1-a))*dT; //asignar nuevo valor para la siguiente iteracion
      nextGrid[i][j][1] = b + ( dB*lapB + a*b*b - (k+feed)*b)*dT; //asignar nuevo valor para la siguiente iteracion
            
    }
  }
  updatePixels();
  
  grid=nextGrid;
  
  println(frameRate);


}