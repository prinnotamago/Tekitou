ellipse(50,50,100,100);
fill(255,255,255);
ellipse(30,40,20,20);
ellipse(70,40,20,20);
fill(0,0,0);
ellipse(30,40,10,20);
ellipse(70,40,10,20);
line(30,70,50,80);
line(50,80,70,70);
line(40,75,30,80);
line(30,80,30,70);
line(60,75,70,80);
line(70,80,70,70);
fill(255,0,0);
ellipse(50,50,15,15);
fill(0,0,0);
int i;
int t;
int col;
for(col = 0; col < 255; col+=10){
 fill(col,0,0);
} 
for( i = 0; i < 500; i++){
 line(i,30,i,15);
} 
for( t = 15; t < 85; t++){
 line(t,0,t,20);
} 


