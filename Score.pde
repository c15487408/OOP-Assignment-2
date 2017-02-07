class Score {
   int score = 0;
   boolean addScore = false;
   int score2;
   
   //Function to increment score
  void incrementScore() 
  {
    if (!addScore)
    {
      score += 1;
      addScore = true;
    }
  }
  
  //Function to reset score
  void resetScore() 
  {
    score = 0;
    addScore = false;
  }
  
  //Function to stop adding score and display score when game is over
  void pillarScore() 
  {
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
    
    //Display score while playing game
    rectMode(CORNER);
    textAlign(LEFT);
    fill(255);
    textSize(30);
    text("Score: " + score, 15, 15, width,45);
    

    popStyle();
  }
}