import hype.*;
import hype.extended.colorist.*;

HRect d;
HPixelColorist colors;

void setup(){
  size(1600, 1600);
  H.init(this).background(#202020);

  //H.add( new HImage("gameboy.gif") );

  colors = new HPixelColorist("bg.jpg");
  //colors = new HPixelColorist("gameboy.gif").fillOnly();
  //colors = new HPixelColorist("gameboy.gif").strokeOnly();
  //colors = new HPixelColorist("gameboy.gif").fillAndStroke();

  for(int i = 0; i < 10000; i++) {
    d = new HRect();
    d
      .loc( (int) random(width), (int)random(height))
      .strokeWeight(3)
      //.stroke(#000000)
      //.fill( )
      //.stroke( ) 
      //.fill( colors.getColor( d.x(), d.y() ), 100 )
      //.stroke( colors.getColor( d.x(), d.y() ) )
      .alpha(200)
      .size( (int) random(25, 30) )
      .rotate( 45 )
      .anchorAt(H.CENTER)
    ;

    colors.applyColor(d);
    H.add(d);
  }

  H.drawStage();
}