
import java.util.*;

Lines_class line_1=new Lines_class(100,700,2);
Lines_class line_2=new Lines_class(200,700,3);
Lines_class line_3=new Lines_class(300,700,2);
Cars car_a,car_b;
Obstacles details;

boolean running;

int x;
float p;
int points;
PImage bg;
float amp;
float fr;
float q;
PFont font;
PFont _font;
int score;
int swich;

void setup(){
  running=true;
  swich=0;
  size(400,700);
  fr=92;
  car_a=new Cars(0);
  car_b=new Cars(1);
  details=new Obstacles();
  bg=loadImage("download.jpeg");
  bg.resize(400,700);
  points=0;
  x=2;
  p=200;
  q=1;
  font=createFont("amatic.ttf",32);
  _font=createFont("oswald.ttf",32);
}

void draw(){
  
  if(running&&swich==1)
  {
    background(60,34,90);
    fr=-72.505+13.44*sqrt(150+points);
    frameRate(fr);
    details.chores(car_a,car_b);
    
    if(running==false)
    {
      score=points;
      details=new Obstacles();
    }
    
    line_1.draw();
    line_2.draw();
    line_3.draw();
    car_a.draw();
    car_b.draw();
    
    textSize(32);
    fill(143,255,251);
    int ref=points,cnt=0;
    while(ref!=0)
    {
      ref=ref/10;
      cnt++;
    }
    textFont(_font);
    textSize(32);
    text(points,400-20*cnt,30);
  }
  
  
  else if(running==false&&swich==1){
    textFont(font);
    tint(255,10);
    image(bg,0,0);
    fill(143,255,251);
    textSize(100);
    text("GAME OVER",60,290);
    textSize(50);
    text("Score: "+score,140,370);
    textSize(35);
    fill(255,89,89);
    text("Press 'space' to play again!",72,450);
    tint(255,255,255);
    fr=92;
    x=14;
    p=200;
  }
  else if(swich==0&&running==true){
    textFont(font);
    tint(255,10);
    image(bg,0,0);
    textSize(35);
    fill(255,89,89);
    text("Press 'space' to play!",105,500);
    tint(255,255,255);
  }
}

void keyPressed(){
  if(running==true&&swich==1)
  {
    if(key==CODED)
    {
      if(keyCode==LEFT)
        car_a.move();
      
      else if(keyCode==RIGHT)
        car_b.move();
    }
  }
  else{
    if(key==' '&&swich==0)
    { 
      swich=1;
      running=true;
    }
    else if(key==' ')
    running=true;
  }
  
}
