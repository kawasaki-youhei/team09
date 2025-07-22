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

   // 左右＋上下の移動に対応
  void update(boolean moveLeft, boolean moveRight, boolean moveUp, boolean moveDown) {
    if (moveLeft) x -= speed;
    if (moveRight) x += speed;
    if (moveUp) y -= speed;
    if (moveDown) y += speed;

    // 左右の移動制限（道路の中）
    x = constrain(x, 100, width - w - 100);  // 必要に応じて100の値を調整

    // 上下の移動制限（画面の下半分）
    float topLimit = height / 2;
    float bottomLimit = height - h;
    y = constrain(y, topLimit, bottomLimit);
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
