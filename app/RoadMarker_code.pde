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
