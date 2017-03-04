import hype.*;
import hype.extended.colorist.*;

HRect d;
HColorPool colors;

void setup() {
  size(600, 600);

  colors = new HColorPool(#625182,#6D8E9E,#9AA5A2,#A5B6B6,#C1CDCA,#DFE9E3,#FE5B7B,#FF738D,#FF8297,#FF899D);

  // colors = new HColorPool()
  //   .add(#625182, 10)
  //   .add(#6D8E9E, 40)
  //   .add(#9AA5A2, 20)
  //   .add(#A5B6B6, 10)
  //   .add(#C1CDCA, 10)
  //   .add(#DFE9E3, 1)
  //   .add(#FE5B7B, 10)
  // ;

  //Lienzo
  H.init(this).background(#202020);

  for (int i= 0; i < 100; i++) {
    d = new HRect();

    d
      .strokeWeight(1)
      .stroke(#000000)
      .fill( colors.getColor() )
      .size( (int) random(25, 125) )
      .rotate( (int) random(360) )
      .loc( (int) random(width), (int) random(height) )
      .anchorAt( H.CENTER );

    H.add(d);

  }

  H.drawStage();

}
