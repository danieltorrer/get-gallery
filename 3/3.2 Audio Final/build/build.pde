// Importar la libreria de sonido
import processing.sound.*;
// Variable tipo sonido 
SoundFile file;
SoundFile beat2;

void setup() {
  size(720, 720);
  background(255);
    
  // Cargar un archivo del folder /data
  file = new SoundFile(this, "beat1.mp3");
  beat2 = new SoundFile(this, "beat2.mp3");
  frameRate(5); //<>//
  
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  
}      

void draw() {
  background( mouseY/2, 100, 100);
  
  fill(mouseX/2, 100, 100, 100);
  rect(width/2, height/2, width/2, height/2);
  
  
}

void keyReleased(){
  // 
  if(key == '1'){
    file.play();
    // Dibujar el cuadrado con color aleatorio;
    stroke(3);
    fill(0, random(100,255), random(100, 255) );
    rect(30,30,80,80);
  }
  if( key == '2'){
    beat2.play();
    // Dibujar el cuadrado con color aleatorio;
   
  }
  
}