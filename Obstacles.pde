class Obstacles{
  ArrayList<Circles> circ_a=new ArrayList<Circles> ();
  ArrayList<Circles> circ_b=new ArrayList<Circles> ();
  ArrayList<Squares> squr_a=new ArrayList<Squares> ();
  ArrayList<Squares> squr_b=new ArrayList<Squares> ();
  float prev_a;
  float prev_b;
  int pres_a;
  int pres_b;
  float ram;
  int c_a;
  int c_b;
  Obstacles(){
    Circles xoxo=new Circles('r',200);
    circ_a.add(xoxo);
    Squares dodo=new Squares('b',200);
    squr_b.add(dodo);
    prev_a=100;
    prev_b=100;
    pres_a=0;
    pres_b=1;
    points=0;
    c_a=1;
    c_b=-1;
  }
  void chores(Cars car_a,Cars car_b){
    if(circ_a.size()+squr_a.size()<16){
      ram=random(0,1);
      
      if(pres_a==0)
        prev_a=circ_a.get(circ_a.size()-1).pos.y;
      else prev_a=squr_a.get(squr_a.size()-1).pos.y;
      
      if((ram<0.25||ram>0.75||c_a==-2)&&c_a!=2)
      {
        if(c_a==-2)
        c_a=0;
        Circles xoxo=new Circles('r',prev_a);
        circ_a.add(xoxo);
        pres_a=0;
        c_a++;
      }
      else{
        if(c_a==2)
        c_a=0;
        Squares xoxo=new Squares('r',prev_a);
        squr_a.add(xoxo);
        pres_a=1;
        c_a--;
      }    
      
    }
    if(circ_b.size()+squr_b.size()<16){
      ram=random(0,1);
      
      if(pres_b==0)
        prev_b=circ_b.get(circ_b.size()-1).pos.y;
      else prev_b=squr_b.get(squr_b.size()-1).pos.y;
      
      if((ram<0.25||ram>0.75||c_b==-2)&&c_b!=2)
      {    
        if(c_b==-2) c_b=0;
        Circles xoxo=new Circles('b',prev_b);
        circ_b.add(xoxo);
        pres_b=0;
        c_b++;
      }
      else if(ram>=0.25||ram<=0.75||c_b==2){
        if(c_b==2) c_b=0;
        Squares xoxo=new Squares('b',prev_b);
        squr_b.add(xoxo);
        pres_b=1;
        c_b--;
      } 
      
    }
    for(int i=circ_a.size()-1;i>=0;i--){
      circ_a.get(i).draw();
      if(circ_a.get(i).check(car_a.pos)==1)
      {
        circ_a.remove(circ_a.get(i));
        points++;
      }
      
      else if(circ_a.get(i).out()==1)
        running=false;
      
    }
    for(int i=circ_b.size()-1;i>=0;i--){
      circ_b.get(i).draw();
      if(circ_b.get(i).check(car_b.pos)==1)
      {
        circ_b.remove(circ_b.get(i));
        points++;
      }
      
      else if(circ_b.get(i).out()==1)
        running=false;
      
    }
    for(int i=squr_a.size()-1;i>=0;i--){
      squr_a.get(i).draw();
      if(squr_a.get(i).check(car_a.pos)==1)
        running=false;
      
      else if(squr_a.get(i).out()==1)
      squr_a.remove(squr_a.get(i));
    }
    
    for(int i=squr_b.size()-1;i>=0;i--){
      squr_b.get(i).draw();
      if(squr_b.get(i).check(car_b.pos)==1)
        running=false;
      
      else if(squr_b.get(i).out()==1)
      squr_b.remove(squr_b.get(i));
    }
  }
  
}
