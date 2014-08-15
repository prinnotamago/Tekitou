int NUM = 10;
int NUM2 = 150;

int[] count = new int[NUM];
int[] toumei= new int[NUM];
int[] r = new int[NUM];
int[] g = new int[NUM];
int[] b = new int[NUM];
int[] size = new int[NUM];
int[] PONG = new int[NUM];
float[][] x = new float[500][NUM];
float[][] y = new float[500][NUM];
float[][] move_x = new float[500][NUM];
float[][] move_y = new float[500][NUM];

float[] x2 = new float[NUM2];
float[] y2 = new float[NUM2];
int[] size2 = new int[NUM2];

int i;
int j;

int t;
/*int i2;
int i3;
int i4;
int i5;
int i6;*/

void setup(){
  size(1000,1000);
  for(j = 0; j < NUM; j++){
  x[0][j] = random(800) + 100;
  y[0][j] = random(100) + 1000;
  move_x[0][j] = 0;
  move_y[0][j] = 0;
  for(i = 1; i < 500; i++){
    x[i][j] = x[0][j];
    y[i][j] = y[0][j];
    move_x[i][j] = move_x[0][j];
    move_y[i][j] = move_y[0][j];
  }
  count[j] = 0;
  toumei[j] = 255;
  r[j] = (int)random(128) + 128;
  g[j] = (int)random(128) + 128;
  b[j] = (int)random(128) + 128;
  size[j] = (int)random(2) + 1;
  PONG[j] = (int)random(20);
  }
  ////////////////////////////////////////////
  for(t = 0; t < NUM2; t++){
    x2[t] = random(1000);
    y2[t] = random(1000);
    size2[t] = (int)random(2) + 1;
  }
}

void draw(){
  background(0);
  for(j = 0; j < NUM; j++){
  count[j]++;
  if(count[j] < 50 - PONG[j]){
    for(i = 0; i < 500; i++){
      y[i][j] -= 15;
    }
  }
  else if(count[j] == 50 - PONG[j]){
    for(i = 0; i < 500; i++){
      move_x[i][j] = ((cos(i)) * (i % 100)) / 10 / size[j];
      move_y[i][j] = ((sin(i)) * (i % 100)) / 10 / size[j];
    }
  }
  else if(count[j] > 50 - PONG[j]){
    for(i = 0; i < 500; i++){
      x[i][j] += move_x[i][j];
      y[i][j] += move_y[i][j];
    }
  }
  if(count[j] > 60 - PONG[j]){
    toumei[j] -= 10;
  }
  if(toumei[j] < 0){
    x[0][j] = random(800) + 100;
    y[0][j] = 1000;
    move_x[0][j] = 0;
    move_y[0][j] = 0;
    for(i = 1; i < 500; i++){
      x[i][j] = x[0][j];
      y[i][j] = y[0][j];
      move_x[i][j] = move_x[0][j];
      move_y[i][j] = move_y[0][j];
    }
    count[j] = 0;
    toumei[j] = 255;
    r[j] = (int)random(128) + 128;
    g[j] = (int)random(128) + 128;
    b[j] = (int)random(128) + 128;
    size[j] = (int)random(2) + 1;
    PONG[j] = (int)random(20);
  }
  
  for(i = 0; i < 500; i++){
      fill(r[j],g[j],b[j],toumei[j]);
      stroke(0,0,0);
      //fill(0,0,0);
      ellipse(x[i][j],y[i][j],5,5);
  }
  //////////////////////////////////////////////
  for(t = 0; t < NUM2; t++){
      fill(255,255,255);
      stroke(0,0,0);
      //fill(0,0,0);
      size2[t] = (int)random(2) + 1;
      ellipse(x2[t],y2[t],size2[t],size2[t]);
  }
  //fill(0,0,0);
  //ellipse(x[499],y[499],10,10);
  }
}
