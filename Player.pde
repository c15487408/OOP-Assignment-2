  class Player {
  float x;
  float y;
  float size = 40;
  float vy = 0;
  float ay = 0.2;
  PImage player;

  Player(float initialX, float initialY) {
    x = initialX;
    y = initialY;
    player = loadImage("player.png");
  }

  /**

Method line "bird" and refreshes
   its position on the screen.
   - No parameters
   - No return value
  */
  void draw() {
    pushStyle();

    imageMode(CENTER);
    image(player, x, y, size, size);

    popStyle();

    y += vy;
    vy += ay;
  }

  void resetPlayer() {
    y = 0;
    vy = 0;
  }

  void fly() {
    vy = -3;
  }
}