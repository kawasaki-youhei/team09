PImage playerImg;
boolean gameOver = false;
boolean moveLeft = false, moveRight = false;

//各画面
final int STATE_TITLE = 0;
final int STATE_PLAYING = 1;
final int STATE_GAME_OVER = 2;
final int STATE_COUNTDOWN = 3;

//最初はタイトル
int gameState = STATE_TITLE;

int countdownStartMillis;
int countdownDuration = 4000;

int restartButtonX = 300;
int restartButtonY = 300;
int restartButtonW = 200;
int restartButtonH = 60;

int titleButtonX = 300;
int titleButtonY = 380;
int titleButtonW = 200;
int titleButtonH = 60;

PFont titleFont;

int buttonX = 300;
int buttonY = 350;
int buttonW = 200;
int buttonH = 60;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

BackBase BB1;
RoadMarker RM1; 
RoadSide RS1;

Player player; // プレイヤーオブジェクト

Countdown countdown;

// 画像読み込み用変数
PImage coneImg, hurdleImg, puddleImg, enemyCarImg;

void setup() {
  size(800, 600);
  //
  titleFont = createFont("Arial", 60);
  //

  playerImg = loadImage("images/player1.png");
  coneImg = loadImage("images/cone.png");
  hurdleImg = loadImage("images/hurdle.png");
  puddleImg = loadImage("images/puddle.png");
  enemyCarImg = loadImage("images/enemyCar.png");

  player = new Player(playerImg, width / 2 - 20, height - 100);

  BB1 = new BackBase(224, 224, 224, 128, 192, 0);
  RM1 = new RoadMarker(255, 255, 255);
  RS1 = new RoadSide(122, 122, 122);
}

//今までのものを変更し、タイトル、ゲーム、ゲームオーバー画面の切り替えをする
void draw() {
  background(0);

  if (gameState == STATE_TITLE) {
    drawTitleScreen();
  } else if (gameState == STATE_COUNTDOWN) {
    countdown.update();
    countdown.display();
    if (countdown.isFinished()) {
      gameState = STATE_PLAYING;
    }
  } else if (gameState == STATE_PLAYING) {
    drawGame();
  } else if (gameState == STATE_GAME_OVER) {
    drawGameOverScreen();
  }
}

//タイトル描画
void drawTitleScreen() {
  background(100, 200, 255);
  
  // 草原
  fill(50, 200, 100);
  rect(0, height / 2, width, height / 2);
  
   // 木を複数描画
  drawTree(100, height / 2 + 50);
  drawTree(200, height / 2 + 70);
  drawTree(650, height / 2 + 60);
  drawTree(750, height / 2 + 40);

  // 道路
  fill(50);
  quad(width / 2 - 200, height, width / 2 + 200, height, width / 2 + 40, height / 2, width / 2 - 40, height / 2);

  // 中央線
  stroke(255);
  strokeWeight(5);
  for (int i = height / 2; i < height; i += 40) {
    line(width / 2, i, width / 2, i + 20);
  }
  
  // 道路端の白線（遠近感）
  stroke(255);
  strokeWeight(4);
  // 左側の白線
  line(width / 2 - 200, height, width / 2 - 40, height / 2);
  // 右側の白線
  line(width / 2 + 200, height, width / 2 + 40, height / 2);
  
  noStroke();

  // タイトル
  textAlign(CENTER, CENTER);
  textFont(titleFont);  // フォントを指定
  fill(255);
  text("Race Game", width / 2, 100);

  // スタートボタン
  fill(150,10,0);
  rectMode(CORNER);
  rect(buttonX, buttonY, buttonW, buttonH, 10);
  fill(255);
  textSize(30);
  text("START", buttonX + buttonW / 2, buttonY + buttonH / 2);
}

  void drawTree(float x, float y) {
  // 幹
  fill(101, 67, 33);
  rect(x - 5, y, 10, 30);

  // 葉
  fill(34, 139, 34);
  ellipse(x, y - 10, 30, 30);
  ellipse(x - 10, y, 30, 30);
  ellipse(x + 10, y, 30, 30);
}

void drawGame() {
  BB1.display();
  RM1.drawCenter(10, 100);
  RS1.base();
  RS1.display();

  player.update(moveLeft, moveRight);
  player.draw();

  if (random(1) < 1.0 / 180.0) {
    float ox = random(BB1.uppRoadL, BB1.uppRoadR - 40);
    int type = (int)random(4);
    switch (type) {
      case 0:
        obstacles.add(new Cone(ox, -80, coneImg));
        break;
      case 1:
        obstacles.add(new Hurdle(ox, -80, hurdleImg));
        break;
      case 2:
        obstacles.add(new Puddle(ox, -80, puddleImg));
        break;
      case 3:
        obstacles.add(new EnemyCar(ox, -80, enemyCarImg));
        break;
    }
  }

for (int i = obstacles.size() - 1; i >= 0; i--) {
  Obstacle ob = obstacles.get(i);
  ob.update();
  ob.display();

  if (ob.checkCollision(player.getX(), player.getY(), player.getW(), player.getH())) {
    gameState = STATE_GAME_OVER;
  }

  if (ob.isOffScreen()) {
    if (!ob.passed) {
      gameState = STATE_GAME_OVER;
    } else {
      obstacles.remove(i); // 正常に避けたら削除
    }
  }
}

}
void drawGameOverScreen() {
  background(0);
  
  fill(255, 0, 0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width / 2, 150);

// リスタートボタン
  fill(100, 0, 0);
  rect(restartButtonX, restartButtonY, restartButtonW, restartButtonH, 10);
  fill(255);
  textSize(24);
  text("Restart", restartButtonX + restartButtonW / 2, restartButtonY + restartButtonH / 2);

  // タイトルへボタン
  fill(0, 0, 100);
  rect(titleButtonX, titleButtonY, titleButtonW, titleButtonH, 10);
  fill(255);
  textSize(24);
  text("Back to Title", titleButtonX + titleButtonW / 2, titleButtonY + titleButtonH / 2);
}

void startGame() {
  gameOver = false;
  obstacles.clear();
  player.setPosition(width / 2 - 20, height - 100);

  countdown = new Countdown(4000); // 4秒カウント
  gameState = STATE_COUNTDOWN;
}

void keyPressed() {
  if (keyCode == LEFT) moveLeft = true;
  if (keyCode == RIGHT) moveRight = true;
}

void keyReleased() {
  if (keyCode == LEFT) moveLeft = false;
  if (keyCode == RIGHT) moveRight = false;
}

void mousePressed() {
  if (gameState == STATE_TITLE) {
    // スタートボタン
    if (mouseX >= buttonX && mouseX <= buttonX + buttonW &&
        mouseY >= buttonY && mouseY <= buttonY + buttonH) {
      startGame();
    }
  } else if (gameState == STATE_GAME_OVER) {
    // リスタートボタンが押された
    if (mouseX >= restartButtonX && mouseX <= restartButtonX + restartButtonW &&
        mouseY >= restartButtonY && mouseY <= restartButtonY + restartButtonH) {
      startGame();  // カウントダウンから再スタート
    }

    // タイトルへボタンが押された
    if (mouseX >= titleButtonX && mouseX <= titleButtonX + titleButtonW &&
        mouseY >= titleButtonY && mouseY <= titleButtonY + titleButtonH) {
      gameState = STATE_TITLE;
    }
  }
}
