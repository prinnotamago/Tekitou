int kazu = 10;
int size = 30;

int vx = 10, vy = 30;

class enemy{
  enemy(int xs, int ys){
    x = xs;
    y = ys;
  }
  
  int x, y;
  
  void Update(){
    x += vx;
  };
  void Draw(){
    fill(255,255,255);
    rect(x, y , size, size,10);
    fill(0,0,0);
    ellipse(x + 24,y + 10,5,5);
    ellipse(x + 8,y + 10,5,5);
    fill(255,0,0);
    rect((x + 5),(y+20),20,5);
  };
};

ArrayList<enemy> enemys;
void setup(){
  size(500,500);
  
  enemys = new ArrayList<enemy>();
  for(int i = 0; i < kazu; i++){
    enemys.add(new enemy(i * size, 0));
  }
}

boolean onoff = true;


int speed = 3;
int returns = 500 - size;

int x = 0, y = 0;

void draw(){
   background(128);
   for(enemy i : enemys){
     if(i.x > width - size || i.x < 0){
      vx *= -1;
        for(enemy b : enemys){
          b.y += vy;
        }
      }
      if(i.y > 470){
        for(enemy b : enemys){
          b.y = 0;
        }
      }
   }
   for(enemy i : enemys){  
     i.Update();      
     i.Draw();
   }
   /////////////////////////////
   /*
  for(int i = 0; i < kazu; i++){
    fill(255,255,255);
    rect((x + i * size),(y), size, size,10);
    fill(0,0,0);
    ellipse(x + i * size + 8,y + 10,5,5);
    ellipse(x + (i+1) * size - 8,y + 10,5,5);
    fill(255,0,0);
    rect((x + i * size + 5),(y+20),20,5);
  }
  
  /////////////////////////////
  
  if(x > width - (kazu * size)){
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
  */
  /////////////////////////////
}
