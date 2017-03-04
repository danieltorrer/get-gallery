import processing.pdf.*;

import hype.*;
import hype.extended.layout.HGridLayout;
import hype.extended.colorist.*;

HDrawablePool pool;
HColorPool colors;

void setup() {
  size(600, 600);
  H.init(this).background(#202020);

  //colors = new HColorPool(#73506A,#D590CC,#F19EE7,#EC94CD,#4F7190,#5C93A9,#87C3D3,#8BA7C3);
  colors = new HColorPool(#EDADD9, #F19EE7, #EC94CD, #D585B1, #B76998, #984B6E, #464241, #8BA7C3, #5C93A9, #3D8186, #87C3D3);

  pool = new HDrawablePool(323);
  pool.autoAddToStage()

    //.add(new HShape("monkey.svg"), 10)
    //.add(new HShape("svg7.svg"), 1)
    .add(new HShape("svg6.svg"), 100)


    .layout(
    new HGridLayout()
    .startX(50)
    .startY(50)
    .spacing(30, 30)
    .cols(18)
    )

    .onCreate( // Cuando se crea el SVG
    new HCallback() { // Llamar a
    public void run(Object obj) { // esta funcion
      HShape d = (HShape) obj;
      d
        .enableStyle(true)
        .strokeJoin(ROUND)
        .strokeCap(ROUND)
        .strokeWeight(1)
        //.stroke(#ff3300)
        .scale(0.5)
        //.fill(#111111)
        //.size( (int) random(25, 125))
        .anchorAt(H.CENTER)
        .rotate( 90 * (int) random(0, 4) ) // rotacion
        //.loc( (int) random(width), (int) random(height))
        ;

      d.randomColors( colors.fillOnly() );
    }
  }
  )
  .requestAll()
    ;
}

void draw() {
  H.drawStage();
}

void keyReleased() {
  if (key == 's' || key == 'S') {
    saveFrame("frames/###.jpg");
  }

  if ( key == 'p') {
    saveVector();
  }
}

void saveVector() {

  //println("Hola");

  PGraphics tmp = null;
  tmp = beginRecord(PDF, "frames/poster###.pdf");
  if ( tmp == null) {
    H.drawStage();
  } else {
    H.stage().paintAll(tmp, false, 1);
  }

  endRecord();
}