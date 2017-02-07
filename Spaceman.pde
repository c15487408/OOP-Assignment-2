//Reyan Jaimon
Player player;
Pillars[] pillars = new Pillars[2]; // array for pillars
Score score;
int score2;

PImage bgImage;
boolean gameOver = false;
boolean gamePlay = false;


void setup()
{
  size (500, 800);
  player = new Player(width/1.75, 0);
  
  pillars[0] = new Pillars(width,random(110, height-110));
  pillars[1] = new Pillars(width+300,random(110, height-110));
  
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
    loadScreen();
  } 
  else
  {
    player.draw();
    for(Pillars p : pillars) 
    { 
    p.draw(); 
  }
  score.draw();
  playerCrashMain();

    
  }
  
}

void fly()
{
  if (gameOver)
  {
    gameOver = false;
    player.resetPlayer();
    for(Pillars p : pillars)
  { 
    p.resetRect(); 
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

void keyPressed()
{
  fly();
}


  
void loadScreen()
{
  if (frameCount<300)
  {

    rectMode(CENTER);
    textSize(38);
    textAlign(CENTER);
    fill(255);
    text("LOADING..",width*0.5, height *0.5); 
   

    pushMatrix();
    translate(width*0.5, height *0.5);
    rotate(frameCount / 20.0);
     
    fill(255, 0, 0);
    ellipse(200, 180, 60, 60); 
    popMatrix();
  } 
    else
  {
    background(0);
    startScreen(); 
  }
}

void startScreen() 
{
   background(bgImage);
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
  score.pillarScore();

}
//Check if player is out of the screen
void playerCrashMain() {
  
  if (player.y > height || player.y < 0) 
  {
    gameOver = true;
  }

  for(Pillars pillar : pillars) {
    
    if (player.x - player.size/2.0 > pillar.pillarx + pillar.pillarWidth) 
    {
      score.incrementScore();
    }
        
      if (pillar.pillarx + pillar.pillarWidth < 0) 
      {
      pillar.repoRect();
      score.pillarScore();
    }
    

    if (pillar.playerCrash(player))
    {
      gameOver = true;
    }
  }
}