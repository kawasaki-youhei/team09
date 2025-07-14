class RoadSide extends Ground{
  float y = 0; 
  float w = 30;
  float h = 50;
  color side;
  ArrayList<Float> sideYs = new ArrayList<Float>(); 
  int spawnInterval = 15; 
  int speed = 10;


  RoadSide(int sR, int sG, int sB){
    side = color(sR,sG,sB);    
  }
  
  void base(){
     fill(side);
     noStroke();
     quad(btmRoadL, 600, btmRoadL - w, 600, uppRoadL - w, 0, uppRoadL,0);
     quad(btmRoadR, 600, btmRoadR + w, 600, uppRoadR + w, 0, uppRoadR,0);
  }

  void display() {
    if (frameCount % spawnInterval == 0) {  //白い平行四辺形を定期的にサイドの上に流し続けることでラインの縞々を表現
     sideYs.add(-h); 
    }

    fill(255);
    noStroke();

    for (int i = sideYs.size() - 1; i >= 0; i--) {
      float y = sideYs.get(i);

      // 左ライン
      quad(
        uppRoadL - w - ((uppRoadL - btmRoadL) * y / height), y,
        uppRoadL - ((uppRoadL - btmRoadL) * y / height), y,
        uppRoadL - ((uppRoadL - btmRoadL) * (y + h) / height), y + h,
        uppRoadL - w - ((uppRoadL - btmRoadL) * (y + h) / height), y + h
      );

      // 右ライン
      quad(
        uppRoadR + ((btmRoadR - uppRoadR) * y / height), y,
        uppRoadR + w + ((btmRoadR - uppRoadR) * y / height), y,
        uppRoadR + w + ((btmRoadR - uppRoadR) * (y + h) / height), y + h,
        uppRoadR + ((btmRoadR - uppRoadR) * (y + h) / height), y + h
      );

      // 移動
      y += speed;
      sideYs.set(i, y);

      // 画面外に出たら削除
      if (y > height + h) {
        sideYs.remove(i);
      }
    }
  }
}
