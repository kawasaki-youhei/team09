- Ground
　道路描写に使う座標情報のみを保持　親クラス
  (変数)
  * int btmRoadL 画面に映っている道路の左下 
  * int btmRoadR                     右下 
  * int uppRoadR                     右上
  * int uppRoadL                     左上
  今回は変更する予定がないため、クラス中で定義

    - BackBase ex.Ground
      背景の基本配色機能を保持
      (変数)
      * color roadC 道の色
      * color BGC   道以外の色
      ２値（=int６値）はコンストラクタで取得
      (関数)
      * void display BGC色で全体塗ってから、道の色を塗る


    - RoadMarker ex.Ground
     背景の装飾のうち、中央線の点線を描く
     (変数)
     * color Marker 中央線の色 コンストラクタで取得
     それ以外は関数管理用の仮変数
     (関数)
     *void drawCenter(int wid int len)
     中央線を引く

     -RoadSide ex.Ground
     背景の装飾のうち,道路サイドを描く
     （変数）
     float w ,h　サイド、サイド上を動く四角の幅、しかくの高さ
     color side  サイドの色。コンストラクタで取得
     それ以外はサイド上を流れる白い平行四辺形の情報。

     (関数)
     void base   サイドの色を配置
     void display サイドの上に白い平行四辺形を一定時間間隔で流すことで点線を再現
     

