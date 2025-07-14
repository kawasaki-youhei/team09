PImage playerImg;
boolean gameOver = false;
boolean moveLeft = false, moveRight = false;

ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

BackBase BB1;
RoadMarker RM1; 
RoadSide RS1;

Player player; // プレイヤーオブジェクト

// 画像読み込み用変数
PImage coneImg, hurdleImg, puddleImg, enemyCarImg;

void setup() {
  size(800, 600);

  playerImg = loadImage("player1.png");
  coneImg = loadImage("cone.png");
  hurdleImg = loadImage("hurdle.png");
  puddleImg = loadImage("puddle.png");
  enemyCarImg = loadImage("enemyCar.png");

  player = new Player(playerImg, width / 2 - 20, height - 100);

  BB1 = new BackBase(224, 224, 224, 128, 192, 0);
  RM1 = new RoadMarker(255, 255, 255);
  RS1 = new RoadSide(122, 122, 122);
}

void draw() {
  if (gameOver) {
    background(0);
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width / 2, height / 2);
    return;
  }

  // 背景や道路描画
  BB1.display();
  RM1.drawCenter(10, 100);
  RS1.base();
  RS1.display();

  // プレイヤー更新と描画
  player.update(moveLeft, moveRight);
  player.draw();

  // 障害物生成
  if (random(1) < 1.0 / 60.0) {
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

  // 障害物の更新・描画・衝突判定・削除
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle ob = obstacles.get(i);
    ob.update();
    ob.display();

    if (ob.checkCollision(player.getX(), player.getY(), player.getW(), player.getH())) {
      gameOver = true;
    }

    if (ob.isOffScreen()) {
      obstacles.remove(i);
    }
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
