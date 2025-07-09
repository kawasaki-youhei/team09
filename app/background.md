##景色(ground)
   ###変数
   -int "load_left"(道と道の左側の境界線)
   -int "load_right"(道と道の右側の境界線)
   -int "sky_line"(水平線のy座標を保存。)
   
   ###派生オブジェクト
     -背景(background)
       道の基本スタイル、背景色を描画する
　　　  いろんな背景でプレイできるように、背景ごとにこの派生クラスで定義する

       ####変数
       -color "sky_color"　　　　　　　　　　　　 空の色
       -color "load_color"                         道の色
       -color "load_lcolor"                        道の左側の色
       -color "load_rcolor"                        道の右側の色
       -int    obj_max                             配置オブジェクトの上限
       -class"bg○○(オブジェクト名)"             配置するオブジェクト
                                                   (オブジェクトごとに用意)

        ####関数
       -makeload　　　　　　　　　　　　　　　　　それぞれの位置に色を配置
       -setload            　　　　　　　　　　　  道に柄をつける
       -setobject                                  道の左右にオブジェクトを配置
