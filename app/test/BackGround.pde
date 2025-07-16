class Ground{
  int btmRoadL;           
  int btmRoadR;
  int uppRoadR;
  int uppRoadL;
  
  Ground(){
    btmRoadL = 100;
    btmRoadR = width - 100;
    uppRoadL = 250;
    uppRoadR = width - 250;
 }
}


class BackBase extends Ground{
  color roadC; //道の色
  color BGC;   //背景（道サイド）の色
  
  BackBase(int rR, int rG, int rB, int BGR, int BGG, int BGB){
    super();
   roadC = color(rR, rG, rB);
   BGC = color(BGR, BGG, BGB);
  }
 void display(){
   background(BGC);
   fill(roadC);
   quad(btmRoadL, height, btmRoadR, height, uppRoadR, 0, uppRoadL,0);
 }
 
}

class RoadMarker extends Ground{
  color Marker;
  int x = 0;
  int y = 0;
  int sideY = 0;
  
  RoadMarker(int mR,int mG,int mB){
   super();
   Marker = color(mR,mG,mB);
  }
 
  void drawCenter(int wid, int len){
   int dx = 4;
   int dy = 10;
   int gap = 40;
   int box = 3;
   
   fill(Marker);
   noStroke();
   
   for(int i = 0; i < box; i++){
     int yi = y - i * gap;
     
     quad(width/2 - wid + x,yi,
          width/2 + wid + x,yi, 
          width/2 + wid + x + dx,yi + len,
          width/2 - wid - x - dx, yi + len);
     }
     y += dy;
     if (y > height + gap){
       y = -len;
     }
   }
}

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
  
  
