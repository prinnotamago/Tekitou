import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer sound;
AudioPlayer sound2;


int i = 0;
int u = 0;
int o = 0;

int h = 0;
int j = 0;
int col = 255;
int tama = 60;
int tama2 = 30;
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
float handou_x = 0;
float handou_y = 0;
float mx = 0;
float my = 0;
float xsh = 0;
int count = 0;
int[] tama_flag = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; //60
float[] tama_x = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float[] tama_y = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float[] tama_x2 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float[] tama_y2 = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int[] tama_st = {255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255};
int[] tama_hit_flag = new int[60];
int[] tama_hit_count = new int[60];
int[] tama_hit_x = new int[60];
int[] tama_hit_y = new int[60];

int count_num = 0;
int hi_score = 0;

int counter = 0;

int time = 0;

int mato_x1 = 500;
int mato_x2 = 430;
int mato_x3 = 240;

int mato_vc1 = 1;
int mato_vc2 = -1;
int mato_vc3 = 1;

float rt1 = 10;
float rt2 = -10;

float matome_x;
float matome_y;

int click = 0;


void setup(){
  size(500,500);
  minim = new Minim(this);
  sound = minim.loadFile("nc30638.wav");
  sound2 = minim.loadFile("short_punch1.mp3");
  for(i = 0; i < 60; i++){
    tama_hit_flag[i] = 0;
    tama_hit_count[i] = 0;
    tama_hit_x[i] = 0;
    tama_hit_y[i] = 0;
  }
}

void draw(){
  background(200);
  
  if(mousePressed == true){
    click++;
  }else{
    click = 0;
  }
  
  if(time > 0){
    time--;
  }
  if(time == 0){
    if(hi_score < count_num){
      hi_score = count_num;
    }
  }
  
  counter++;
  if(counter > 600){
    counter = 0;
  }

  if(col < 255){
      col += 5;
    }
    
  if(count < 5){
    count++;
    xsh = 0;
   /* if(count == 4){
      sound.rewind();
    }*/
  }
  else if(click > 0 && tama2 > 0 && time > 0){
    count = 0;
    xsh = 8;
    col = 0;
    sound.play(1);
    for(h = 0; h < 60; h++){
      if(tama_flag[h] == 0){
        tama_flag[h] = 1;
        
        tama_x[h] = 250 + random(rt2 + 0, rt1 - 0) + x + x2 + handou_x;
        tama_y[h] = 250 + random(rt2 + 0, rt1 - 0) + y2 + handou_y;
        //tama_y[h] = 250 + random(tama_x[h] - 250, 0) + y2 + handou_y;
        tama_x2[h] = 0;
        tama_y2[h] = 0;
        
        tama_hit_flag[h] = 0;
        
        float dx1 = mato_x1 - tama_x[h];
        float dy1 = 500 - tama_y[h];
        float r1 = dx1 * dx1 + dy1 * dy1;
        if(r1 < 25 * 25 + y){
          sound2.play(1);
          tama_hit_flag[h] = 1;
          tama_hit_count[h] = 30;
          tama_hit_x[h] = mato_x1 - 20;
          tama_hit_y[h] = 500 - 50 - (int)y;
          count_num += 1;
        }
        
        float dx2 = mato_x2 - tama_x[h];
        float dy2 = 350 - tama_y[h];
        float r2 = dx2 * dx2 + dy2 * dy2;
        if(r2 < 15 * 15 + y){
          sound2.play(1);
          tama_hit_flag[h] = 2;
          tama_hit_count[h] = 30;
          tama_hit_x[h] = mato_x2 - 20;
          tama_hit_y[h] = 350 - 30 - (int)y;
          count_num += 2;
        }
        
        float dx3 = mato_x3 - tama_x[h];
        float dy3 = 400 - tama_y[h];
        float r3 = dx3 * dx3 + dy3 * dy3;
        if(r3 < 10 * 10 + y){
          sound2.play(1);
          tama_hit_flag[h] = 3;
          tama_hit_count[h] = 30;
          tama_hit_x[h] = mato_x3 - 20;
          tama_hit_y[h] = 400 - 20 - (int)y;
          count_num += 3;
        }
        
        if(handou_y > -70){
          handou_y -= 10;
        }
        if(handou_y < -40){
          handou_x = (int)random(rt1) - 5;
        }
        
        tama -= 1;
        tama2 -= 1;
        rt1 +=7;
        rt2 -=7;
        break;
      }
    }
  }
  else if(click == 1 && time == 0){
    time = 600;
    count_num = 0;
    col = 255;
    tama = 60;
    tama2 = 30;
    x = 0;
    y = 0;
    x2 = 0;
    y2 = 0;
    handou_x = 0;
    handou_y = 0;
    mx = 0;
    my = 0;
    xsh = 0;
    count = 0;
    for(i = 0; i < 60; i++){
      tama_flag[i] = 0;
      tama_x[i] = 0;
      tama_y[i] = 0;
      tama_x2[i] = 0;
      tama_y2[i] = 0;
      tama_st[i] = 255;
      tama_hit_flag[i] = 0;
      tama_hit_count[i] = 0;
      tama_hit_x[i] = 0;
      tama_hit_y[i] = 0;
    }
    rt1 = 10;
    rt2 = -10;
  }
  
  
  if(rt1 != 10){
    rt1 -= 1;
  }
  if(rt1 > 25){
    rt1 = 25;
  }
  if(rt2 != -10){
    rt2 += 1;
  }
  if(rt2 < -25){
    rt2 = -25;
  }
  
  if(handou_y < 0){
     handou_y += 1;
  } 
  if(handou_x > 0){
     handou_x -= 1;
  }
  else if(handou_x < 0){
     handou_x += 1;
  }
  
  //mato
  mato_x1 += 3 * mato_vc1;
  mato_x2 += 4 * mato_vc2;
  mato_x3 += 5 * mato_vc3;
  
  if(mato_x1 < 210 + 30 + y && mato_vc1 < 0){
     mato_vc1 *= -1;
   }
  if(mato_x1 > 790 - 30 - y && mato_vc1 > 0){
     mato_vc1 *= -1;
   } 
   
   if(mato_x2 < 250 + 20 + y && mato_vc2 < 0){
     mato_vc2 *= -1;
   }
   if(mato_x2 > 750 - 20 - y && mato_vc2 > 0){
     mato_vc2 *= -1;
   }  
   
   if(mato_x3 < 280 + 15 + y && mato_vc3 < 0){
     mato_vc3 *= -1;
   }
   if(mato_x3 > 720 - 15 - y && mato_vc3 > 0){
     mato_vc3 *= -1;
   }  
  
  
  int yh = -50;
  stroke(0, 0, 0 ,0);
  /*fill(200,200,200);
  rect(0,0,500,600 - matome_y);*/
 
  fill(150,150,150);
  rect(0, 500 - matome_y + 200 + y + yh - 50, 1000,1000);
  
  fill(100,100,100, 64);
  triangle(200 - matome_x - y, 500 - matome_y + 200 + y + yh, 0, 500 - matome_y + 200 + y + yh, -100 - matome_x + y + x,1000 - matome_y + y);
  triangle(200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 500, 500 - matome_y + 200 + y + yh, 1200 - matome_x + y + x,1000 - matome_y + y);
  
  fill(255,255,255);
  quad(250 + 50 - matome_x + y, 0,250 + 50 - matome_x + y, 450 - matome_y + 200 + y + yh, 200 - matome_x - y, 500 - matome_y + 200 + y + yh, 200 - matome_x - y, 0);
  quad(250 + 450 - matome_x - y, 0,250 + 450 - matome_x - y, 450 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 0);
  
  fill(128,128,128);
  quad(200 - matome_x - y, 500 - matome_y + 200 + y + yh, 200 - matome_x - y, 0, 0, 0, 0, 500 - matome_y + 200 + y + yh);
  quad(200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 0, 500, 0, 500, 500 - matome_y + 200 + y + yh);
   
  
  stroke(0, 0, 0, 0);
  //line(510 - matome_x + y/2,500 - matome_y,510 - matome_x + y/2,550 - matome_y + y);
  //line(490 - matome_x - y/2,500 - matome_y,490 - matome_x - y/2,550 - matome_y + y);
  //line(435 - matome_x + y/2,350 - matome_y,435 - matome_x + y/2,390 - matome_y + y);
  //line(425 - matome_x - y/2,350 - matome_y,425 - matome_x - y/2,390 - matome_y + y);
  //line(243 - matome_x + y/2,400 - matome_y,243 - matome_x + y/2,430 - matome_y + y);
  //line(237 - matome_x - y/2,400 - matome_y,237 - matome_x - y/2,430 - matome_y + y);
  fill(0,0,255);
  ellipse(mato_x1 - matome_x,500 - matome_y,50+y,50+y);
  ellipse(mato_x2 - matome_x,350 - matome_y,30+y,30+y);
  ellipse(mato_x3 - matome_x,400 - matome_y,20+y,20+y);
  fill(255,255,255);
  ellipse(mato_x1 - matome_x,500 - matome_y,35+y,35+y);
  ellipse(mato_x2 - matome_x,350 - matome_y,20+y,20+y);
  ellipse(mato_x3 - matome_x,400 - matome_y,15+y,15+y);
  fill(255,0,0);
  ellipse(mato_x1 - matome_x,500 - matome_y,15+y,15+y);
  ellipse(mato_x2 - matome_x,350 - matome_y,8+y,8+y);
  ellipse(mato_x3 - matome_x,400 - matome_y,5+y,5+y);
  
  //juu
  fill(255,255,0);
  stroke(0,0,0);
  //rect(400,480,20,30);
  quad(370,400,370,430,400,455,400,423);
  
  for(j = 0; j < 60; j++){
    if(tama_flag[j] == 1){
      tama_st[j] -= 1;
      fill(0,0,0,tama_st[j]);
      stroke(255-tama_st[j], 255-tama_st[j], 255-tama_st[j]);
      ellipse(tama_x[j] - x - x2 - handou_x, tama_y[j] - y2 - handou_y, 5 + y, 5 + y);
      fill(255,255,0);
      stroke(0,0,0);
      tama_x2[j] -= random(10);
      tama_y2[j] += 7;
      //rect(tama_x2[j],tama_y2[j],20,30);
      quad(370+tama_x2[j],400+tama_y2[j],370+tama_x2[j],430+tama_y2[j],400+tama_x2[j],455+tama_y2[j],400+tama_x2[j],423+tama_y2[j]);
    }
    
    if(tama_st[j] < 0){
      tama_flag[j] = 0;
      tama_st[j] = 255;
      tama += 1;
    }
  }
  
  for(j = 0; j < 60; j++){
    if(tama_hit_count[j] > 0){
      tama_hit_count[j]--;
      tama_hit_y[j]--;
    }
  }
  
  for(j = 0; j < 60; j++){
    if(tama_flag[j] == 1){
      if(tama_hit_flag[j] == 1){
        tama_x[j] += 3 * mato_vc1;
      }
      if(tama_hit_flag[j] == 2){
        tama_x[j] += 4 * mato_vc2;
      }
      if(tama_hit_flag[j] == 3){
        tama_x[j] += 5 * mato_vc3;
      }
   }
  }
  
  mx = mouseX;
  my = mouseY;
  mouseX = 250;
  mouseY = 250;
  if(my > mouseY || my < mouseY){
    y2 = my;
  }
  if(mx > mouseX|| mx < mouseX){
    x2 = mx;
  }
  /*if(mx < mouseX){
    x -= 3;
  }*/
  
  
  //text(mx,10,30);
  //text(mouseX,10,60);
  
  if(keyPressed){
    if(key == 'A' || key == 'a'){
      x -= 5;
    }
    if(key == 'D' || key == 'd'){
      x += 5;
    }
    if(key == 'W' || key == 'w'){
      if(y < 5){
        y += 0.1;
      }
    }
    if(key == 'S' || key == 's'){
      if(y > -3){
        y -= 0.1;
      } 
    }
  }
  
  if(keyPressed && mousePressed == false){
    if(key == 'R' || key == 'r'){
      tama2 = tama;
    }
  }
  
  if(tama2 > 30){
    tama2 = 30;
  }
  stroke(255, 0, 0);
  fill(0,0,0.255);
  textSize(20);
  text("TIME : ",230,430);
  text(time / 60,300,430);
  text("SCORE : ",230,450);
  text(count_num,310,450);
  text(tama2,240,470);
  text(" / 30",270,470);
  if(tama2 == 0 && time / 15 % 2 == 1){
    text("'R' Reload!!",230,490);
  }
  if(tama2 == 0 && time / 5 % 2 == 1){
    text("No Bullet!!",200,290);
  }
  
  /*if(time == 0){
    textSize(60);
    text("MATOATE",100,170);
    textSize(30);
    text("HI SCORE : ",100,290);
    text(hi_score,270,290);
    textSize(40);
      if(counter / 15 % 2 == 1){
       text("CLICK TO START",90,370);
      }
  }*/
  
  
  fill(255,255,255);
  line(330+ xsh,330,500,450);
  line(400+ xsh,320,500,370);
  line(330+ xsh,330,400,320);
  /*line(337,335,408,325);
  line(340,338,415,327);*/
  for(u=0;u<200;u+=5){
    line(333 + u/1.05+ xsh, 333 + u/1.5, 405 + u*1.02, 323 + u/2);
  }
  line(330+ xsh,330,330,400);
  line(330+ xsh,400,500,550);
  /*line(330,395,500,545);
  line(330,390,500,540);
  line(330,385,500,535);*/
  for(i=0;i<65;i+=5){
    line(330+ xsh,395 - i,500,545 - i * 1.45);
  }
  /*line(415,475,413,500);
  line(360,428,350,500);*/
  for(o=0;o<30;o+=3){
    line(360+ xsh + o, 428 + o/1.1, 355 + o, 500 + o);
  }
  line(430+ xsh,490,428,550);
  ellipse(310+ xsh,310,10,10);
  stroke(255, 255, 255);
  fill(255,255,col);
  ellipse(311+ xsh,311,10,10);
  stroke(0, 0, 0);
  fill(255,255,255);
  line(313+ xsh,305,340,328);
  line(306+ xsh,313,330,335);
  
  //line(0,650+y-matome_y,500,650+y-matome_y);
  
  /*fill(128,128,128);
  rect(50 - matome_x, 0, 250, 650+y-matome_y);
  rect(700 - matome_x, 0, 250, 650+y-matome_y); 
  fill(255,255,255);
  rect(0 - matome_x, 0, 250, 650+y-matome_y);
  rect(750 - matome_x, 0, 250, 650+y-matome_y);*/
  
  //line(250 - matome_x, 0,250 - matome_x, 500);
  //line(750 - matome_x, 0,750 - matome_x, 500);
  /*
  int yh = -50;
  quad(250 + 50 - matome_x + y, 0,250 + 50 - matome_x + y, 450 - matome_y + 200 + y + yh, 200 - matome_x - y, 500 - matome_y + 200 + y + yh, 200 - matome_x - y, 0);
  quad(250 + 450 - matome_x - y, 0,250 + 450 - matome_x - y, 450 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 0);
  
  fill(128,128,128);
  quad(200 - matome_x - y, 500 - matome_y + 200 + y + yh, 200 - matome_x - y, 0, 0, 0, 0, 500 - matome_y + 200 + y + yh);
  quad(200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 0, 500, 0, 500, 500 - matome_y + 200 + y + yh);
  */
  
  //quad(250 + 50 - matome_x + y, -50 - matome_y + 200 + y + yh,250 + 50 - matome_x + y, 450 - matome_y + 200 + y + yh, 200 - matome_x - y, 500 - matome_y + 200 + y + yh, 200 - matome_x - y, 0 - matome_y + 200 + y + yh);
  //quad(250 + 450 - matome_x - y, -50 - matome_y + 200 + y + yh,250 + 450 - matome_x - y, 450 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 0 - matome_y + 200 + y + yh);
  
  //quad(250 + 50 - matome_x + y, -50 - matome_y + 200 + y + yh,250 + 50 - matome_x + y, 450 - matome_y + 200 + y + yh, 200 - matome_x - y, 500 - matome_y + 200 + y + yh, 200 - matome_x - y, 0 - matome_y + 200 + y + yh);
  //quad(250 + 450 - matome_x - y, -50 - matome_y + 200 + y + yh,250 + 450 - matome_x - y, 450 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 0 - matome_y + 200 + y + yh);
  
  //fill(128,128,128);
  //quad(200 - matome_x - y, 500 - matome_y + 200 + y + yh, 200 - matome_x - y, 0 - matome_y + 200 + y + yh, 100 - matome_x - y - y, 0 - matome_y + 200 + y + yh, 100 - matome_x - y - y, 500 - matome_y + 200 + y + yh);
  //quad(200 + 500 + 100 - matome_x + y, 500 - matome_y + 200 + y + yh, 200 + 500 + 100 - matome_x + y, 0 - matome_y + 200 + y + yh, 200 + 500 + 200 - matome_x + y + y, 0 - matome_y + 200 + y + yh, 200 + 500 + 200 - matome_x + y + y, 500 - matome_y + 200 + y + yh);
  //fill(64,64,64);
  //quad(100 - matome_x - y - y, 0 - matome_y + 200 + y,200 - matome_x - y, 0 - matome_y + 200 + y, 250 + 50 - matome_x + y, -50 - matome_y + 200 + y , -200,-200);
  //quad();
  
  stroke(0, 255, 255);
  line(250 + rt1,250,265 + rt1,250);
  line(250 + rt2,250,235 + rt2,250);
  line(250,250 + rt1,250,265 + rt1);
  line(250,250 + rt2,250,235 + rt2);
  
  for(j = 0; j < 60; j++){
    if(tama_hit_count[j] > 0){
      fill(0, 0, 0);
     text("H I T !!", tama_hit_x[j] - matome_x, tama_hit_y[j] - matome_y);
    }
  }
  
  fill(0, 0, 0);
  if(time == 0){
    textSize(60);
    text("MATOATE",100,170);
    textSize(30);
    text("HI SCORE : ",150,290);
    text(hi_score,320,290);
    textSize(40);
      if(counter / 15 % 2 == 1){
       text("'CLICK' TO START",90,370);
      }
  }
  
  matome_x = x + x2 + handou_x;
  matome_y = y2 + handou_y;
}

void stop(){
  sound.close();
  minim.stop();
  
  super.stop();
}
