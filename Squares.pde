class Squares{
  PVector pos;
  PImage sq;
  float speed;
  float ram;
  Squares(char col,float prev){
    pos=new PVector();
    if(col=='r')
    {
      sq=loadImage("red_square.png");
      ram=random(0,1);
      if(ram<0.5) pos.x=30;
      else pos.x=130;
    }
    
    else 
    {
      sq=loadImage("blue_square.png");
      ram=random(0,1);
      if(ram<0.5) pos.x=230;
      else pos.x=330;
    }
    ram=random(-30,30);
    pos.y=prev-250+ram;
    
    sq.resize(40,40);
    speed=3;
  }
  void draw(){
    pos.y+=speed;
    image(sq,pos.x,pos.y);
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
