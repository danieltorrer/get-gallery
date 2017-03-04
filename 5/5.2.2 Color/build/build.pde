import hype.*;
import hype.extended.colorist.*;

HRect d;
HColorPool colors;

void setup() {
  size(600, 600);
  
  //colors = new HColorPool(#D4DFC0,#5A7B46);
  colors = new HColorPool()
              .add(#D4DFC0, 8)
              .add(#5A7B46, 2);

  //Lienzo
  H.init(this).background(#aaaaaa);

  for (int i= 0; i < 100; i++) {
    d = new HRect();

    d
      .strokeWeight(2)
      .stroke( #000000 )
      .fill( colors.getColor() )
      .size( (int) random(25, 125) )
      .rotate(45 )
      .loc( (int) random(width), (int) random(height) )
      .anchorAt( H.CENTER );

    H.add(d);

  }

}

void draw(){
  H.drawStage();
}

void keyReleased(){
  if(key == 's' || key == 'S'){
    saveFrame("frames/###.jpg");
  }
}