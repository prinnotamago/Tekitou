void setup(){
  size(500,500);
  frameRate(60);
}

float x;
float y;
int maru1 = 300;
int maru2 = 100;
int maruX = 250;
int maruY = 250;

int dx;
int dy;
int dx2;
int dy2;
float r;

float r2;

void draw(){
  dx = mouseX - maruX;
  dy = mouseY - maruY;
  r = sqrt(dx * dx + dy * dy);
  
  r2 = atan2(dy ,dx);
  //x -= x - mouseX;
  //y -= y - mouseY;
  
  x = mouseX;
  y = mouseY;
  
  /*if(cos(r2) * r > 100 || cos(r2) * r < -100){
    x -= cos(r2) * r;
  }
  if(sin(r2) * r > 100 || sin(r2) * r < -100){
    y -= sin(r2) * r;
  }*/
  if(r > 100){
    x = cos(r2) * maru1 - cos(r2) * (maru1 - maru2) + 250;
    y = sin(r2) * maru1 - sin(r2) * (maru1 - maru2) + 250;
  }

  
  
  background(255);
  fill(255,255,255);
  ellipse(maruX,maruY,maru1,maru1);
  fill(255,0,0);
  ellipse(x,y,maru2,maru2);
}
