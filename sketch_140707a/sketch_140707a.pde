void setup(){
  size(500,500);
  frameRate(60);
}


void draw(){
  background(255);
  int x = mouseX;
  int y = mouseY;
  float dx = 250 - x;
  float dy = 250 - y;
  float r = sqrt(dx * dx + dy * dy);
  
  if(r <= 150){
    fill(255,0,0, 128);
    ellipse(250,250,300,300);
  }
  else{
    fill(255,255,0, 128);
    ellipse(250,250,300,300);
  }
  
  float dx2 = 350 - x;
  float dy2 = 350 - y;
  float r2 = sqrt(dx2 * dx2 + dy2 * dy2);
  if(r2 <= 150){
    fill(0,0,255, 128);
    ellipse(350,350,300,300);
  }
  else{
    fill(0,255,0, 128);
    ellipse(350,350,300,300);
  }
  //ellipse(250,250,300,300);
  //ellipse(350,350,300,300);
  fill(255,255,255);
  text(x, 10, 20);
  text(y, 10, 40);
  text(r, 10, 60);
  //int c = atan2(x, y);
}
