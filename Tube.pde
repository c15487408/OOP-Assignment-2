
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

  boolean playerCrash(Player bryan)
  {
    
    boolean result = false;

    if (pillarCrash(bryan.x, bryan.y, bryan.size, bryan.size, pillarx, pillary, pillarx+pillarWidth, height-1) ||  pillarCrash(bryan.x, bryan.y, bryan.size, bryan.size, pillarx, 0, pillarx+pillarWidth, pillary - 100)) 
    {
      result = true;
    }

    return result;
  }

  boolean pillarCrash(float pillarX1, float pillarY1, float firstWidth, float firstHeight, float playerPosX2, float playerPosY2, float xRect2, float yRect2)
  {
    float halfHeight = firstHeight/2;
    float halfWidth = firstWidth/2;
    return playerPos(pillarX1 + halfWidth, pillarY1 + halfHeight, playerPosX2, playerPosY2, xRect2, yRect2) ||playerPos(pillarX1 - halfWidth, pillarY1 - halfHeight, playerPosX2, playerPosY2, xRect2, yRect2) ||playerPos(pillarX1 + halfWidth, pillarY1 - halfHeight, playerPosX2, playerPosY2, xRect2, yRect2)|| playerPos(pillarX1 - halfWidth, pillarY1 + halfHeight, playerPosX2, playerPosY2, xRect2, yRect2);
  }

  boolean playerPos(float x, float y, float playerPosX, float playerPosY, float xRect, float yRect)
  {
    return (x >= playerPosX && x <= xRect && y >= playerPosY && y <= yRect);
  }

}