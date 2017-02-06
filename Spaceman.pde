Player player;
Pillars[] pillars = new Pillars[2]; // array for pillars
PImage bgImage;
void setup()
{
  size (500, 800);
  bgImage = loadImage("background.png");
}

void draw()
{
  
  background(bgImage);
  startScreen();
  
}

void startScreen() {
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(255);
  text("SPACEMAN",
       width/2, height/2,
       width, 100);
}