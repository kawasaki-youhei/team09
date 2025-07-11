
PImage player1Img;
float player1x, player1y;
float playerSpeed = 5;

boolean gameOver = false;
boolean moveLeft = false, moveRight = false;

ArrayList<Coin> coins = new ArrayList<Coin>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ScoreManager scoreManager = new ScoreManager();

int roadLeft = 100;
int roadRight = 700;  // width - 100（幅800前提）

void setup() {
  size(800, 600);
  player1Img = loadImage("player1.png");
  player1x = width / 2 - 20;
  player1y = height - 100;
}

void draw() {
  if (!gameOver) {
    background(180, 220, 255);  // 空の色
    fill(80);
    rect(roadLeft, 0, roadRight - roadLeft, height);  // 道路

    // プレイヤー操作
    if (moveLeft) player1x -= playerSpeed;
    if (moveRight) player1x += playerSpeed;

    image(player1Img, player1x, player1y, 40, 80);

    // ランダム生成
    if (random(1) < 1.0 / 60.0) {
      float ox = random(roadLeft, roadRight - 40);
      obstacles.add(new Obstacle(ox, -80));
    }
    if (random(1) < 1.0 / 120.0) {
      float cx = random(roadLeft, roadRight - 30);
      coins.add(new Coin(cx, -30));
    }

    // 障害物処理
    for (int i = obstacles.size() - 1; i >= 0; i--) {
      Obstacle ob = obstacles.get(i);
      ob.update();
      ob.draw();
      if (ob.checkCollision(player1x, player1y, 40, 80)) {
        gameOver = true;
      }
      if (ob.isOffScreen()) obstacles.remove(i);
    }

    // コイン処理
    for (int i = coins.size() - 1; i >= 0; i--) {
      Coin c = coins.get(i);
      c.update();
      c.draw();
      if (c.checkCollision(player1x, player1y, 40, 80)) {
        scoreManager.addCoin();
      }
      if (c.isOffScreen()) coins.remove(i);
    }

    // スコア表示
    scoreManager.update();
    scoreManager.draw();
  } else {
    background(0);
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height / 2);
  }
}

void keyPressed() {
  if (keyCode == LEFT) moveLeft = true;
  if (keyCode == RIGHT) moveRight = true;
}
void keyReleased() {
  if (keyCode == LEFT) moveLeft = false;
  if (keyCode == RIGHT) moveRight = false;
}
