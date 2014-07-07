void setup(){
  size(500,500);
   background(255);
}

void draw(){
  float cx = 100;
  float cy = 100;
  float r = 25;
  float x = mouseX;
  float y = mouseY;
  float dx = x - cx;
  float dy = y - cy;
  
  if(dx * dx + dy * dy < r * r){
    fill(0,255,0);
    ellipse(x,y,25,25);
  }
  else{
    fill(255,0,0);
    ellipse(x,y,25,25);
  }
}
