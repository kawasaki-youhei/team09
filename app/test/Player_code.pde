class Player {
  PImage img;
  float x, y;
  float speed = 5;
  float w = 160;
  float h = 90;

  Player(PImage img, float startX, float startY) {
    this.img = img;
    this.x = startX;
    this.y = startY;
  }

  void update(boolean moveLeft, boolean moveRight) {
    if (moveLeft) x -= speed;
    if (moveRight) x += speed;
    x = constrain(x, 100, width - w - 100); // 道路内で制限
  }

  void draw() {
    image(img, x, y, w, h);
  }
 
 //スタート画面を用意するときのスタート位置の初期化
  void setPosition(float x, float y) {
  this.x = x;
  this.y = y;
}

  float getX() { return x; }
  float getY() { return y; }
  float getW() { return w; }
  float getH() { return h; }
}
