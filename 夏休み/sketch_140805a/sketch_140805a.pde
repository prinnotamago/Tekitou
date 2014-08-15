

int i = 0;
int j = 0;
int o = 0;

int u = 0;
int num = 0;
float[] x = new float[5000];
float[] y = new float[5000];
float[] move_x = new float[5000];
float[] move_y = new float[5000];
int[] on = new int[5000];
float[] r = new float[5000];
float[] g = new float[5000];
float[] b = new float[5000];

void setup(){
  size(100,100);
  frameRate(60);
  /*for(i = 0; i < 500; i++){
    for(j = 0; j < 200; j++){
      x[i] = i;
      y[j] = j;
    }
  }*/
  for(i = 0; i < 5000; i++){
     x[i] = i % 100;
     y[i] = num;
     move_x[i] = 0;
     move_y[i] = 0;
     on[i] = 0;
     r[i] = i % 256;
     g[i] = i * 2 % 256;
     b[i] = i * 3 % 256;
     if(i % 100 == 99){
       num += 1;
     }
  }
  move_x[4999] = (int)random(5) + 1;
  move_y[4999] = (int)random(5) + 1;
  on[4999] = 1;
  /*move_x[4950] = 1;
  move_y[4950] = 1;
  on[4950] = 1;*/
  /*move_x[4959] = 1;
  move_y[4959] = 1;
  on[4959] = 1;*/
}

void draw(){
  //background(255);
  fill(255,30);
  rect(0,0,width,height);
  for(u = 0; u < 5000; u++){
    /*for(i = 0; i < 500; i++){
      for(j = 0; j < 200; j++){
        point(i,j);
      }
    }*/
    if(on[u] == 1){
      x[u] += move_x[u];
      y[u] += move_y[u];
    }
    if(x[u] < 0){
      move_x[u] *= -1;
      x[u] = 0;
    }
    if(width < x[u]){
      move_x[u] *= -1;
      x[u] = width;
    }
    if(y[u] < 0){
      move_y[u] *= -1;
      y[u] = 0;
    }
    if(height < y[u]){
      move_y[u] *= -1;
      y[u] = height;
    }
    for(j = 0; j < 5000; j++){
      if(i != j){
      /*if(x[u] == x[j] && y[u] == y[j] + 1 && on[u] == 1 && on[j] == 0
      || x[u] == x[j] && y[u] == y[j] - 1 && on[u] == 1 && on[j] == 0
      //||x[u] == x[j] + 1 && y[u] == y[j] && on[u] == 1 && on[j] == 0
      //|| x[u] == x[j] - 1 && y[u] == y[j] && on[u] == 1 && on[j] == 0
      ||x[u] == x[j] && y[u] == y[j] + 2 && on[u] == 1 && on[j] == 0
      || x[u] == x[j] && y[u] == y[j] - 2 && on[u] == 1 && on[j] == 0
      //||x[u] == x[j] + 2 && y[u] == y[j] && on[u] == 1 && on[j] == 0
      //|| x[u] == x[j] - 2 && y[u] == y[j] && on[u] == 1 && on[j] == 0
      ){
          move_x[j] = random(1) + 1;
          move_y[j] = random(1) + 1;
          on[j] = 1;
          //move_x[u] *= -1;
          move_y[u] *= -1;
          //x[u] = ;
          y[u] = y[j] + 1;
        }
        if(x[u] == x[j] + 1 && y[u] == y[j] && on[u] == 1 && on[j] == 0
      || x[u] == x[j] - 1 && y[u] == y[j] && on[u] == 1 && on[j] == 0
      ||x[u] == x[j] + 2 && y[u] == y[j] && on[u] == 1 && on[j] == 0
      || x[u] == x[j] - 2 && y[u] == y[j] && on[u] == 1 && on[j] == 0){
        move_x[j] = random(1) + 1;
        move_y[j] = random(1) + 1;
        on[j] = 1;
        move_x[u] *= -1;
        //move_y[u] *= -1;
        //x[u] = ;
        y[u] = y[j] + 1;
      }
      }*/
      if(x[u] == x[j] && y[u] == y[j] + 1 && on[u] == 1 && on[j] == 0){
          if(move_x[u] > 0){
            move_x[j] = (int)random(5) + 1;
          }else{
            move_x[j] = -((int)random(5) + 1);
          }
          move_y[j] = (int)random(5) + 1;
          on[j] = 1;
          //move_x[u] *= -1;
          if(move_y[u] < 0){
            move_y[u] *= -1;
          }
          //x[u] = ;
          y[j] += 1;
          y[u] = y[j] + 1;
        }
        if(x[u] == x[j] && y[u] == y[j] && on[u] == 1 && on[j] == 0){
        move_x[j] = (int)random(5) + 1;
        move_y[j] = (int)random(5) + 1;
        on[j] = 1;
        move_x[u] *= -1;
        //move_y[u] *= -1;
        //x[u] = ;
        y[u] = y[j] + 1;
      }
      }
    }
    stroke(r[u],g[u],b[u]);
    point(x[u],y[u]);
  }
  //ellipse(mouseX,mouseY,10,10);
}
