import hype.*;
import hype.extended.colorist.*;
import hype.extended.layout.HGridLayout;

HDrawablePool pool;

void setup() {
  size(600, 600);
  H.init(this).background(#202020);

  // cuantos elementos queremos
  pool = new HDrawablePool(100);
  pool.autoAddToStage()
    .add(new HRect())
    .onCreate(
      new HCallback() {
        public void run(Object obj) {
          HDrawable d = (HDrawable) obj;
          d
            .strokeWeight(1)
            .stroke(#ff3300)
            .fill(#111111)
            .size( (int) random(25, 125) )
            .rotate( (int) random(360) )
            .loc( (int) random(width), (int) random(height) )
            .anchorAt( H.CENTER )
          ;
        }
      }
    )
    .requestAll()
  ;

  H.drawStage();

}