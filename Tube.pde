
class Pillars 
{
  float pillarx;
  float pillary;
  float pillarWidth = 58;
  float pillarx2;

  Pillars(float pillarx3, float pillary3)
  {
    pillarx = pillarx3;
    pillary = pillary3;
    pillarx2 = pillarx3;
  }

  /**

Method line "tube" and refreshes
     its position on the screen. When the tube disappears
     the screen, go back to the beginning.
     - nema parameters
     - no return value
  */
  void draw() 
  {
    pushStyle();

    // CORNERS is convenient to draw pipes
    // because we can directly determine to what
    // coordinates pipe begins and where it ends.
    rectMode(CORNERS);
    fill(128,0,0);
    rect(pillarx, pillary, pillarx+pillarWidth, height-1);
    rect(pillarx, 0, pillarx+pillarWidth, pillary - 110);

    popStyle();

    pillarx -= 1;
  }

  void resetRect() 
  {
    pillarx = pillarx2;
    pillary = random(110, height-110);
  }

  void repoRect() 
  {
    pillarx = width;
    pillary = random(110, height-110);
  }



}