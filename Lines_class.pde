class Lines_class{
  int x;
  int weight;
  int y;
  Lines_class (int ix,int iy,int it)
  {
      x=ix;
      y=iy;
      weight=it;
    
  }
  void draw() {
    stroke(100,75,255);
    strokeWeight(weight);
    line(x,0,x,y);
  }
}
