class Score {
   int score = 0;
   boolean addScore = false;

  void incrementScore() 
  {
    if (!addScore)
    {
      score += 1;
      addScore = true;
    }
  }


}