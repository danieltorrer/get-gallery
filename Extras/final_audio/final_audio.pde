import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer coltrane;
AudioPlayer clasica;
FFT         fftColtrane, fftClasica;
boolean control;
void setup() {

  control = false;
  size(512, 200);
  colorMode(HSB, 359, 99, 99);
  minim = new Minim(this);
  coltrane = minim.loadFile("diebed.mp3", 1024);
  clasica = minim.loadFile("weesmall.mp3", 1024);

  coltrane.loop();
  clasica.loop();
  clasica.mute();

  fftColtrane = new FFT( coltrane.bufferSize(), coltrane.sampleRate() );
  fftColtrane.linAverages(12);
  fftColtrane.window(FFT.GAUSS);

  fftClasica = new FFT( clasica.bufferSize(), clasica.sampleRate() );
  fftClasica.linAverages(12);
  fftClasica.window(FFT.GAUSS);

  rectMode(CENTER);
}

void draw() {

  fftColtrane.forward(coltrane.mix);
  fftClasica.forward(clasica.mix);
  background(50);
  // clasica = true
  generarColor(1, 
    fftClasica.getAvg(0), 
    fftClasica.getAvg(1), 
    fftClasica.getAvg(4));

  // coltrane = false
  generarColor(2, 
    fftColtrane.getAvg(0), 
    fftColtrane.getAvg(1), 
    fftColtrane.getAvg(4)); 



  fill(100, 0, 100);
  if (control) {
    ellipse( 170, 180, 15, 15 );
  } else {
    ellipse( 340, 180, 15, 15 );
  }
}

void generarColor(int pos, float bajos, float medios, float agudos) {
  println(medios);
  println(pos);
  float col = map(bajos, 0, 9, 0, 359);
  fill(col, 90, 100);
  noStroke();
  rect(170 * pos, height/2, 130, 130);
}

void keyReleased() {
  if (key == 's') {
    if (control) {
      coltrane.unmute();
      clasica.mute();
    } else {
      coltrane.mute();
      clasica.unmute();
    }

    control = !control;
  }
}