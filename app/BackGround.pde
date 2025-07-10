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


class BackGround extends Ground{
  color roadC;
  color BGC;
  
  BackGround(int rR, int rG, int rB, int BGR, int BGG, int BGB){
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

class RoadStyle extends Ground{
  color Marker;
  int x = 0;
  int y = 0;
  
 RoadStyle(int R,int G,int B){
   super();
   Marker = color(R,G,B);
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
        y+= dy;
   }
   if (y > height + gap){
     y = -len;
   }
 }
}
  
  
