void setup(){
  size(500,500);
}

int x = 0, y = 0;
boolean onoff = true;

int kazu = 8;
int size = 30;
int speed = 5;
int returns = 500 - size;

void draw(){
   background(128);
   
   /////////////////////////////
   
  for(int i = 0; i < kazu; i++){
    fill(255,255,255);
    rect((x + i * size),(y), size, size);
    fill(0,0,0);
    ellipse(x + i * size + 8,y + 10,5,5);
    ellipse(x + (i+1) * size - 8,y + 10,5,5);
    fill(255,0,0);
    rect((x + i * size + 5),(y+20),20,5);
  }
  
  /////////////////////////////
  
  if(x > 500 - kazu * size){
    onoff = false;
    y+=size;
  }
  else if(x < 0){
    onoff = true;
    y+=size;
  }
  
  /////////////////////////////
  
  if(onoff == true){
    x+=speed;
  }
  else if(onoff == false){
    x-=speed;
  }
  
  /////////////////////////////
  
  if(y > returns){
    y = 0;
  }
  
  /////////////////////////////
}
