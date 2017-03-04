/**
 * Dibujando figuras geometricas con el mouse
 * 	 
 * MOUSE
 * mouseX          : tamaño
 * mouseY          : grosor y numero de lineas
 * drag                : dibujar
 * 
 * 
 * 1-3                 : color
 * backspace           : borrar
 * s                   : png
 */


color strokeColor = color(0, 10);


void setup(){
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
}

void draw(){
  if(mousePressed){
    pushMatrix();
    // Origen de coordenadas se mueve al centro del canvas
    translate(width/2,height/2);
    
    // 'Regla de 3' para convertir el valor del mouse a uno entre 2 y 10
    int circleResolution = (int)map(mouseY+100,0,height,2, 10);
    
    //
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;

    strokeWeight(2);
    stroke(strokeColor);

    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      //strokeWeight(20);
      //point(x,y);
      vertex(x, y);
    }
    endShape();
    
    popMatrix();
  }
}

void keyReleased(){
  if (key == BACKSPACE) background(360);
  if (key=='s' || key=='S') saveFrame("figura_##.png");

  switch(key){
  case '1':
    strokeColor = color(0, 10);
    break;
  case '2':
    strokeColor = color(192, 100, 64, 10);
    break;
  case '3':
    strokeColor = color(52, 100, 71, 10);
    break;
  }
 
}