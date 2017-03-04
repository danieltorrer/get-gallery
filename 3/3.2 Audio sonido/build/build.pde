import processing.sound.*;
// Variable tipo sonido 
SoundFile sonido1;
SoundFile sonido2;
SoundFile sonido3;
SoundFile sonido4;

PImage imagen;

void setup() {
  size(600, 600);
  background(#164EF0);
  //background( 255, 255, 255 );
  frameRate(10);
  
  // Cargar un archivo del folder /data
  sonido1 = new SoundFile(this, "beat1.mp3");
  sonido2 = new SoundFile(this, "beat2.mp3");
  sonido3 = new SoundFile(this, "beat3.mp3");
  sonido4 = new SoundFile(this, "beat4.mp3");
  imagen = loadImage("logo.png");  
}      

void draw() {   
  //background(#164EF0);
}

void keyReleased(){
  
  if(key == '1'){
    background(random(255), random(255), random(255));
    tint( random(255), random(255), random(255) );    
    image( imagen, random( width ), random( height) );
    sonido1.play();
  }
  
  if(key == '2'){
    fill(#BC16F0);
    rect( random(400), random(400), 50, 50);
    
    sonido2.play();
  }
  
  if(key == '3'){
    sonido3.play();
  }
}