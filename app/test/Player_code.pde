class Player {
  PImage img;
  float x, y;
  float speed = 5;

  Player(PImage img, float startX, float startY) {
    this.img = img;
    this.x = startX;
    this.y = startY;
  }

  void update(boolean moveLeft, boolean moveRight) {
    if (moveLeft) x -= speed;
    if (moveRight) x += speed;
    x = constrain(x, 100, width - 140); // 道路内で制限
  }

  void draw() {
    image(img, x, y, 80, 100);
  }

  float getX() { return x; }
  float getY() { return y; }
  float getW() { return 40; }
  float getH() { return 80; }
}
