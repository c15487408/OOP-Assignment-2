class Pillars 
{
  float X, Y, X2;
  float wid = 70;
  
  Pillars(float X1, float Y1) {
   X2 = X1;
   X = X1;
   Y = Y1;
  }
  void draw()
  {
    pushStyle();
    rectMode(CORNERS);
    fill(128,0,0);
    rect(X, Y, X+wid, height-1);
    rect(X, 0, X+wid, Y-100);

    popStyle();

    X -= 1;
  }
  
}