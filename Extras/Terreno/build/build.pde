import ddf.minim.*;
import ddf.minim.analysis.*;

int cols, rows;
int scl = 30;
int w = 1200;
int h = 600;
float offset = 0.2;

float flying = 0;

float[][] terrain;

float bajo, medio, agudo;
float altura = 0;

Minim minim;
AudioPlayer cancion;
FFT fft;

void setup() {
  size(600, 600, P3D);
  cols = w  / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  //frameRate(30);

  minim = new Minim(this);
  cancion = minim.loadFile( "skin.mp3", 1024);

  cancion.play();

  fft = new FFT( cancion.bufferSize(), cancion.sampleRate() );
  fft.linAverages(12);
}


void draw() {

  fft.forward( cancion.mix);
  //for (int i = 0; i < fft.avgSize(); i++) {
  bajo = fft.getAvg(0);
  medio = fft.getAvg(3);
  agudo = fft.getAvg(4);
  //}
  //daniel.torrer@gmail.com
  println("bajo " + bajo);
  println("medio " + medio);

  println("agudo " + agudo);
  
  if( bajo > 10){
    altura = map(bajo, 0, 15, 0, 200);
  } else {
    altura = altura * 0.9;
  }
  
  //float altura = map(bajo, 10, 20, 0, 200);




  dibujarTerreno();
}