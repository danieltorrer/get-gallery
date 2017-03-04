/* 2.1.1 Color
Exploración de colores
*/

void setup(){
  size(720, 720);
  //noCursor();
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw(){
    /* Codigo */
    rectMode(CENTER);
    background((mouseY/2), 100, 100);
    fill((mouseX/2), 100 ,100);
    rect(width/2, height/2, width/2, height/2);
}
