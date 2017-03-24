import processing.sound.*;


// Variable tipo sonido 
SoundFile sonido1;
SoundFile sonido2;

void setup() {
  size(500, 500);
  background(#10CB66);
    
  // Cargar un archivo del folder /data
  sonido1 = new SoundFile(this, "02Pearl.mp3");
  sonido2 = new SoundFile(this, "beat2.mp3");
  
}      

void draw() {  
  
}

void keyReleased(){
  
  if(key == '1'){
    stroke(#10CBBD);
    strokeWeight(2);  
    fill(#10B1CB);
    
    ellipse( random(0, width), random(0, height) , 50, 50);
    sonido1.play();
  }
  
    if(key == '2'){
    stroke(#10CBBD);
    strokeWeight(2);  
    fill(#10B1CB);
    
    ellipse( random(0, width), random(0, height) , 50, 50);
    sonido1.stop();
  }
}