class Cars{
  PImage car;
  PVector pos;
  int defx;
  float speed_val;
  PVector speed;
  float rot_speed;
  
  Cars(int x){
    if(x==0)
    defx=30;
    else defx=230;
    if(x==0)
    car=loadImage("red.png");
    else car=loadImage("blue.png");
    car.resize(40,70);
    if(x==0)
    pos=new PVector(defx,550);
    else
    pos=new PVector(defx,550);
    speed=new PVector(0,0);
    rot_speed=0;
    speed_val=4;
    ;
  }
  
  void draw(){
    if(280/fr<1)
    speed_val=1;
    else
    speed_val=280/fr;
    if(pos.x<defx||pos.x>defx+100)
    {
      speed.x=0;
      if(pos.x<defx)
      pos.x=defx;
      else pos.x=defx+100;
    }
    pos.x+=speed.x;
    if(speed.x>0)
    rot_speed=0.15*PI;
    else if(speed.x<0)
    rot_speed=-0.15*PI;
    else rot_speed=0;
    pushMatrix();
    translate(pos.x+20,pos.y+35);
    rotate(rot_speed);
    translate(-20,-35);
    image(car,0,0);
    popMatrix();
  }
  void move(){
      if(pos.x==defx||speed.x==-speed_val)
      speed.x=speed_val;
      else speed.x=-speed_val;
  }
  
}
