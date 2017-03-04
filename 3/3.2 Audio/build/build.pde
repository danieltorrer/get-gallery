// Importar la libreria de sonido
import processing.sound.*;
// Variable tipo sonido 
SoundFile beat1;

void setup() {
  size(720, 720);
  background(255);
    
  // Cargar un archivo del folder /data
  beat1 = new SoundFile(this, "beat1.mp3");
  
}      

void draw() {  
}

void keyReleased(){
  // 
  if(key == '1'){
    beat1.play();
  }
  
}