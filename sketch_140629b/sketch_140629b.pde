final float [] LPX = {random(500) - 500, random(500) - 500, random(500) - 500, random(500) - 500, random(500) - 500, mouseX};
final float [] LPY = {random(500) - 500, random(500) - 500, random(500) - 500, random(500) - 500, random(500) - 500, mouseY};
final float [] SPD = {random(30) + 10, random(30) + 10, random(30) + 10, random(30) + 10, random(30) + 10};
final float [] Ra = {random(127)+128,random(127)+128,random(127)+128,random(127)+128,random(127)+128,255};
final float [] Ga = {random(127)+128,random(127)+128,random(127)+128,random(127)+128,random(127)+128,255};
final float [] Ba = {random(127)+128,random(127)+128,random(127)+128,random(127)+128,random(127)+128,255};
final float [] LP = {random(20)+10, random(20)+10, random(20)+10, random(20)+10, random(20)+10, 20};
PImage img;
float LPA = 1;
float HW;
float HH;
void setup(){
  size(500,500);
  HW = width / 2;
  HH = height / 2;
  frameRate(60);
}

/*void draw(){
  background(240);
  brightness(0);
  //fill (255, 255, 255, 4);
  //stroke (255, 255, 255, 4);
  noStroke();
  for(int i = 0; i < 500; i++){
     ellipse(mouseX, mouseY, i, i);
  }
}*/
void draw(){
  background(0);
  img = loadImage("14378218.png");
  tint(70);
  image(img, 0, 0, height, width);
  //final int [] LPX = {mouseX, 100, 300};
  //final int [] LPY = {mouseY, 200, 300};
  LPX [5] = mouseX;
  LPY [5] = mouseY;
 // LP += LPA;
 //LP = 20;
  /*if(LP > 50){
    LP = 50;
    LPA *= -1;
  }
  if(LP < 0){
    LP = 0;
    LPA *= -1;
  }*/
  loadPixels();
  
  for(int i = 0; i < 6; i++){
    if(LPX[i] > width + 250 && i < 5|| LPY[i] > height + 250 && i < 5){
      LPX[i] = random(500) - 500;
      LPY[i] = random(500) - 500;
      SPD[i] = random(30) + 10;
      Ra[i] = random(127)+128;
      Ga[i] = random(127)+128;
      Ba[i] = random(127)+128;
      LP[i] = random(20)+10;
    }
    if(i != 5){
      LPX[i] += SPD[i];
      LPY[i] += SPD[i];
    }
    if (mousePressed == true) {
      Ra[5] = random(127)+128;
      Ga[5] = random(127)+128;
      Ba[5] = random(127)+128;
    }
    for(int x = 0; x < height; x++){
      for(int y = 0; y < width; y++){
        int pixelIndex = x + y * width;

        int r = pixels[pixelIndex] >> 16 & 0xFF;
        int g = pixels[pixelIndex] >> 8 & 0xFF;
        int b = pixels[pixelIndex] & 0xFF;
        
        float dx = LPX[i] - x;
        float dy = LPY[i] - y;
        float distance = sqrt(dx * dx + dy * dy);
        
        if(distance < 1){
          distance = 1;
        }
        
        r += (Ra[i] * LP[i]) / distance;
        g += (Ga[i] * LP[i]) / distance;
        b += (Ba[i] * LP[i]) / distance;
        
        pixels[pixelIndex] = color(r, g, b);
      }
    }
  }
  updatePixels();
}
