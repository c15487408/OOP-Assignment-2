Player player;
Pillars[] pillars = new Pillars[2]; // array for pillars
Score score;
PImage bgImage;
boolean gameOver = false;
boolean gamePlay = false;

void setup()
{
  size (500, 800);
  player = new Player(width/1.75, 0);
  pillars[0] = new Pillars(width, random(110, height-110));
  pillars[1] = new Pillars(width+300, random(110, height-110));
  score = new Score();
  bgImage = loadImage("background.png");
}

void draw()
{
  
  background(bgImage);
 
   if (gameOver)
   {
    gameOver();
  } 
  else if (!gamePlay) 
  {
    startScreen();
  } 
  else
  {
    player.draw();
    for(Pillars o : pillars) { 
    o.draw(); 
  }
  score.draw();

    
  }
  
}
void action()
{
  if (gameOver)
  {
    gameOver = false;
    player.resetPlayer();
    for(Pillars o : pillars)
  { o.resetRect(); 
}
    score.resetScore();
  }
  else if (!gamePlay)
  {
    gamePlay = true;
  }
  else 
  {
    player.fly();
  }
}

void keyPressed() {
  action();
}





void startScreen() 
{
  rectMode(CENTER);
  textSize(40);
  textAlign(CENTER);
  fill(255);
  text("SPACEMAN",width/2, height/2,width, 100);
}

void gameOver() 
{
  rectMode(CENTER);
  textSize(40);
  textAlign(CENTER);
  fill(255);

  text("GAME OVER",width/2, height/2,width, 100);

}