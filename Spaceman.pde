Player player;
Pillars[] pillars = new Pillars[2]; // array for pillars
Score score;
PImage bgImage;
boolean gamePlay = false;
boolean gameOver = false;
void setup()
{
  size (500, 800);
  player = new Player(width/2, 0);
  pillars[0] = new Pillars(width, random(110, height-110));
  pillars[1] = new Pillars(width*1.5+25, random(110, height-110));
  score = new Score();
  bgImage = loadImage("background.png");
}

void draw()
{
  
  background(bgImage);
 
   if (gameOver) {
    gameOver();
  } else if (!gamePlay) {
    startScreen();
  } else {
    player.draw();
    for(Pillars o : pillars) { o.draw(); }
    
    
  }
  
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