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
