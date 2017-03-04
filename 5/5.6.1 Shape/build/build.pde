import hype.*;
import hype.extended.layout.*;
import hype.extended.colorist.*;
import processing.pdf.*;


HDrawablePool pool;
HColorPool colors;

void setup(){
  size(800, 600);
  
  H.init(this).background(#625182);

  colors = new HColorPool(#6D8E9E,#9AA5A2,#A5B6B6);
  
  pool = new HDrawablePool(500);
  
  pool.autoAddToStage()
    .add(new HShape("svg7.svg"))

    .layout(
      new HShapeLayout()
      .target(
        new HImage("daniel.png")
      )
    )

    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HShape d = (HShape) obj;
          d
            .enableStyle(false)
            .noStroke()
            .anchorAt(H.CENTER)
            .rotate( 0 )
            .size( (int)random(0, 20) )
          ;
          d.randomColors(colors.fillAndStroke());
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
    saveFrame("frames/####_d4.jpg");
  }

  if(key == 'v' || key == 'V'){
    saveVector();
  }
}

void saveVector() {
  PGraphics tmp = null;
  tmp = beginRecord(PDF, "frames/render##.pdf");

  if (tmp == null) {
    H.drawStage();
  } else {
    H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
  }

  endRecord();
}