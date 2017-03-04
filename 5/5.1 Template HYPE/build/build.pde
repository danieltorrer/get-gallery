import hype.*;
// red: newmedia
// pass: nomelase
// Rectangulo de HYPE
HRect d;

void setup() {
  size(600, 600);
  //Lienzo
  H.init(this).background(#202020);
  
  for(int i = 0; i < 100; i++ ){
    d = new HRect();
    d.strokeWeight(2)
      .fill(#333333)
      .stroke(#ff3300)
      .size( (int) random(25, 225) )
      //.rotate( (int) random(360) )
      .anchorAt( H.CENTER )
      .loc( (int) random(width), (int) random(height) );
    
    H.add(d);
   }
  
  H.drawStage();

}