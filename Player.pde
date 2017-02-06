class Player {
  float x;
  float y;
  
  float size = 38;
  
  float vy = 0;
  float ay = 0.2;
  
  PImage player;

  Player(float x1, float y1) {
    x = x1;
    y = y1;
    
    player = loadImage("player.png");
}
  void draw() {
    pushStyle();

    imageMode(CENTER);
    image(player, x, y, size, size);

    popStyle();

    y += vy;
    vy += ay;
  }

  void reset() {
    y = 0;
    vy = 0;
  }

  void jump() {
    vy = -3;
  }
}