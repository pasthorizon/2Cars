  class Circles{
  PVector pos;
  PImage cir;
  float speed;
  float ram;
  Circles(char col,float prev){
    pos=new PVector();
    if(col=='r')
    {
      cir=loadImage("red_circle.png");
      ram=random(0,1);
      if(ram<0.5) pos.x=30;
      else pos.x=130;
    }
    
    else 
    {
      cir=loadImage("blue_circle.png");
      ram=random(0,1);
      if(ram<0.5) pos.x=230;
      else pos.x=330;
    }
    pos.y=prev-250+random(-30,30);
    
    cir.resize(40,40);
    speed=3;
  }
  void draw(){
    pos.y+=speed;
    image(cir,pos.x,pos.y);
  }
  
  int check(PVector pos_c){
    float x=pos_c.x;
    float y=pos_c.y;
    if(x>=pos.x&&x<=pos.x+40&&y>=pos.y&&y<=pos.y+40)
    return 1;
    x=pos_c.x+40;
    if(x>=pos.x&&x<=pos.x+40&&y>=pos.y&&y<=pos.y+40)
    return 1;
    y=pos_c.y+40;
    if(x>=pos.x&&x<=pos.x+40&&y>=pos.y&&y<=pos.y+40)
    return 1;
    x=pos_c.x;
    if(x>=pos.x&&x<=pos.x+40&&y>=pos.y&&y<=pos.y+40)
    return 1;
    return 0;
  }
  int out(){
    if(pos.y>650)
    return 1;
    else return 0;
  }
}
