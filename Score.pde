class Score {
   int score = 0;
   boolean addScore = false;
   int score2;
   

  void incrementScore() 
  {
    if (!addScore)
    {
      score += 1;
      addScore = true;
    }
  }

  void resetScore() 
  {
    score = 0;
    addScore = false;
  }
  void pillarScore() {
    addScore = false;
        rectMode(CORNER);
    textAlign(LEFT);
    fill(255);
    textSize(30);
    text("Score: " + score, 15, 15, width,45);
    
  }

  void draw()
  {
    pushStyle();

    rectMode(CORNER);
    textAlign(LEFT);
    fill(255);
    textSize(30);
    text("Score: " + score, 15, 15, width,45);
    

    popStyle();
  }
}