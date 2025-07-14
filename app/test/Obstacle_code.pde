class Obstacle {
  PImage img;
  float x, y;
  float speedY;
  float width, height;

  Obstacle(float x, float y, PImage img) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.speedY = 4;
    this.width = 40;
    this.height = 40;
  }

  void update() {
    y += speedY;
    // 画面外に出たら再利用用にオフスクリーン判定
  }

  void display() {
    image(img, x, y, width, height);
  }

  boolean isOffScreen() {
    return y > height + height;  // 画面下に完全に出たか
  }

  boolean checkCollision(float px, float py, float pwidth, float pheight) {
    return !(px + pwidth < x || px > x + width || py + pheight < y || py > y + height);
  }

  void constrainPosition() {
    // 道路内に収まるようにする
    x = constrain(x, BB1.uppRoadL, BB1.uppRoadR - width);
  }
}
