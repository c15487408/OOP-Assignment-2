  class Player {
  float x;
  float y;
  float size = 38;
  float yv = 0;
  float ya = 0.25;
  PImage player;

  Player(float x3, float y3) 
  {
    x = x3;
    y = y3;
    player = loadImage("player.png"); //Variable player is an image
  }

  void draw() {
    pushStyle();

    imageMode(CENTER);
    image(player, x, y, size, size); //img player

    popStyle();
    
    //Player Movement
    y += yv;
    yv += ya;
  }

  void resetPlayer() //Reset player Position
  {
    y = 0;
    yv = 0;
  }

  void fly() 
  {
    yv = -3; //function used to make player fly
  }
}