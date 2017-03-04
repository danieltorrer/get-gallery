import hype.*;
import hype.extended.colorist.*;

HRect d;

void setup(){
  size(600, 600);
  H.init(this).background(#202020);

  for(int i = 0; i < 100; i++) {
    d = new HRect();
    d
      .loc( (int) random(width), (int)random(height))
      .strokeWeight(3)
      .stroke(#000000)
      .fill( #333333 )
      .alpha(100)
      .size( (int) random(25, 75) )
      .rotate( (int) random(360) )
      .anchorAt(H.CENTER)
    ;
    H.add(d);
  }

  H.drawStage();
}