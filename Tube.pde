
class Pillars 
{
  //Pillar variables
  float pillarx;
  float pillary;
  float pillarWidth = 58;
  float pillarx2; //Inital x cordinate

  Pillars(float pillarx3, float pillary3)
  {
    pillarx = pillarx3;
    pillary = pillary3;
    pillarx2 = pillarx3;
  }
 
  void draw() 
  {
    pushStyle();
    
    //draw pillars from corner
    //Pillars/ Rects move using push and pop matrix
    //Two rects created for top and bottam  pillars
    rectMode(CORNERS);
    fill(128,0,0);
    rect(pillarx, pillary, pillarx+pillarWidth, height-1);
    rect(pillarx, 0, pillarx+pillarWidth, pillary - 110);

    popStyle();
    

    pillarx -= 1;
    
    
  }
  
  //function to reset pillars
  void resetRect() 
  {
    pillarx = pillarx2;
    pillary = random(110, height-110);
  }
  
  //function to reposition pillars
  void repoRect() 
  {
    pillarx = width;
    pillary = random(110, height-110);
  }
  
  //Functions to see if the player crashed

  boolean playerCrash(Player bryan) //Player name
  {
    
    boolean result = false; //variable to define if it has crashed

    if (pillarCrash(bryan.x, bryan.y, bryan.size, bryan.size, pillarx, pillary, pillarx+pillarWidth, height-1) ||  pillarCrash(bryan.x, bryan.y, bryan.size, bryan.size, pillarx, 0, pillarx+pillarWidth, pillary - 100)) 
    {
      result = true;
    }

    return result;
  }
  
  //Pillar Collision
  boolean pillarCrash(float pillarX1, float pillarY1, float firstWidth, float firstHeight, float playerPosX2, float playerPosY2, float xRect2, float yRect2)
  {
    float halfHeight = firstHeight/2;
    float halfWidth = firstWidth/2;
    return playerPos(pillarX1 + halfWidth, pillarY1 + halfHeight, playerPosX2, playerPosY2, xRect2, yRect2) ||playerPos(pillarX1 - halfWidth, pillarY1 - halfHeight, playerPosX2, playerPosY2, xRect2, yRect2) ||playerPos(pillarX1 + halfWidth, pillarY1 - halfHeight, playerPosX2, playerPosY2, xRect2, yRect2)|| playerPos(pillarX1 - halfWidth, pillarY1 + halfHeight, playerPosX2, playerPosY2, xRect2, yRect2);
  }
  
  //Is player inside
  boolean playerPos(float x, float y, float playerPosX, float playerPosY, float xRect, float yRect)
  {
    return (x >= playerPosX && x <= xRect && y >= playerPosY && y <= yRect);
  }

}