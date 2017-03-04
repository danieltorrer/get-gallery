import processing.pdf.*;

import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.colorist.*;



HDrawablePool pool;
HColorPool colors;

void setup(){
   
  size(600,600);
  H.init(this).background(#202020);

  colors = new HColorPool(#0B9687, #479E7F, #ABF2BC, #A8D2A7, #5BCBC1);


  pool = new HDrawablePool(1050);
  pool.autoAddToStage()
    .add(new HShape("svg7.svg"))

    .layout(
      new HGridLayout()
      .startX(30)
      .startY(30)
      .spacing(140,140)
      .cols(30)
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .anchorAt(H.CENTER)
            //.//fill(#479E7F)
            .stroke(#479E7F)
            .rotate( 45 )
            .scale( 0.5 )
          ;
          d.randomColors(colors.fillOnly());
        }
      }
    )
    .requestAll()
  ;
  
}

void draw(){
  H.drawStage();
}

void keyReleased(){
  if(key == 's' || key == 'S'){
    saveFrame("frames/###.jpg");
  }
  
  if(key == 'p'){
    saveVector();
  }
 
}

void saveVector() {
  PGraphics tmp = null;
  tmp = beginRecord(PDF, "frames/render##.pdf");
  textMode(MODEL);
  if (tmp == null) {
    H.drawStage();
  } else {
    H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
  }

  endRecord();
}