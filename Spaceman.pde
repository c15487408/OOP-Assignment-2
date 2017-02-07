/*
OOP Assignment 2
SPACEMAN

Reyan Jaimon
C15487408
DT228/2
*/

//Global variables
Player player; //player class variable
Pillars[] pillars = new Pillars[2]; // array for pillars
Score score;
PImage bgImage; //Background image variable
boolean gameOver = false;
boolean gamePlay = false;


void setup()
{
  size (500, 800);
  player = new Player(width/1.75, 0);
  
  pillars[0] = new Pillars(width,random(110, height-110));
  pillars[1] = new Pillars(width+300,random(110, height-110));
  
score = new Score();


  bgImage = loadImage("background.png");//Background image
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
    loadScreen(); // call load screen function
  } 
  else
  {
    player.draw();
    for(Pillars p : pillars) 
    { 
    p.draw(); 
  }
  score.draw();
  playerCrashMain(); // Calling If player crashed function

    
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
    p.resetRect(); //check reset pillar
}
    score.resetScore(); //check reset score
  }
  else if (!gamePlay)
  {
    gamePlay = true;
  }
  else 
  {
    player.fly(); // call function from player class
  }
}
//If any key pressed player will fly
void keyPressed()
{
  fly();
}


  //Load screen
void loadScreen()
{
  if (frameCount<300)
  {

    rectMode(CENTER);
    textSize(38);
    textAlign(CENTER);
    fill(255);
    text("LOADING..",width*0.5, height *0.5); 
   
   //Rotating circle usisng push matrix and translate func.
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


//Start Screen
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