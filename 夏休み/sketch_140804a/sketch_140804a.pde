import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer sound;

void setup(){
  size(500,500);
  minim = new Minim(this);
  sound = minim.loadFile("nc30638.wav");
}


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
float rt1 = 10;
float rt2 = -10;

void draw(){
  background(255);
  if(col < 255){
      col += 5;
    }
    
  if(count < 5){
    count++;
    xsh = 0;
    if(count == 4){
      sound.rewind();
    }
  }
  else if(mousePressed == true && tama2 > 0){
    count = 0;
    xsh = 8;
    col = 0;
    sound.play();
    for(h = 0; h < 60; h++){
      if(tama_flag[h] == 0){
        tama_flag[h] = 1;
        tama_x[h] = 250 + random(rt2+0, rt1-0) + x + x2;
        tama_y[h] = 250 + random(rt2+0, rt1-0) + y2;
        tama_x2[h] = 0;
        tama_y2[h] = 0;
        
        tama -= 1;
        tama2 -= 1;
        rt1 +=7;
        rt2 -=7;
        break;
      }
    }
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
  
  stroke(0, 0, 0);
  line(510 - x - x2 + y/2,500 - y2,510 - x - x2 + y/2,550 - y2 + y);
  line(490 - x - x2 - y/2,500 - y2,490 - x - x2 - y/2,550 - y2 + y);
  line(435 - x - x2 + y/2,350 - y2,435 - x - x2 + y/2,390 - y2 + y);
  line(425 - x - x2 - y/2,350 - y2,425 - x - x2 - y/2,390 - y2 + y);
  line(243 - x - x2 + y/2,400 - y2,243 - x - x2 + y/2,430 - y2 + y);
  line(237 - x - x2 - y/2,400 - y2,237 - x - x2 - y/2,430 - y2 + y);
  fill(0,0,255);
  ellipse(500 - x - x2,500 - y2,50+y,50+y);
  ellipse(430 - x - x2,350 - y2,30+y,30+y);
  ellipse(240 - x - x2,400 - y2,20+y,20+y);
  fill(255,255,255);
  ellipse(500 - x - x2,500 - y2,35+y,35+y);
  ellipse(430 - x - x2,350 - y2,20+y,20+y);
  ellipse(240 - x - x2,400 - y2,15+y,15+y);
  fill(255,0,0);
  ellipse(500 - x - x2,500 - y2,15+y,15+y);
  ellipse(430 - x - x2,350 - y2,8+y,8+y);
  ellipse(240 - x - x2,400 - y2,5+y,5+y);
  
  fill(255,255,0);
  stroke(0,0,0);
  //rect(400,480,20,30);
  quad(370,400,370,430,400,455,400,423);
  
  for(j = 0; j < 60; j++){
    if(tama_flag[j] == 1){
      tama_st[j] -= 1;
      fill(0,0,0,tama_st[j]);
      stroke(255-tama_st[j], 255-tama_st[j], 255-tama_st[j]);
      ellipse(tama_x[j] - x - x2, tama_y[j] - y2, 5 + y, 5 + y);
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
  stroke(0, 0, 0);
  fill(0,0,0.255);
  text(tama2,300,470);
  text(" / 30",315,470);
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
  line(0,650+y*5-y2,500,650+y*5-y2);
  stroke(0, 255, 255);
  line(250 + rt1,250,265 + rt1,250);
  line(250 + rt2,250,235 + rt2,250);
  line(250,250 + rt1,250,265 + rt1);
  line(250,250 + rt2,250,235 + rt2);
}

void stop(){
  sound.close();
  minim.stop();
  
  super.stop();
}
