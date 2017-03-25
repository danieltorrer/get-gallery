import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer coltrane;
AudioPlayer zappa;
FFT fftColtrane;
FFT fftZappa;

boolean onOff = false;

void setup() {
  size(700, 400);
  rectMode(CENTER);
  colorMode(HSB, 359, 99, 99);

  minim = new Minim(this);

  coltrane = minim.loadFile("coltrane.mp3", 1024);
  zappa = minim.loadFile("zappa.mp3", 1024);

  //fft
  fftColtrane = new FFT( coltrane.bufferSize(), coltrane.sampleRate() );
  fftColtrane.linAverages(64);

  fftZappa = new FFT( zappa.bufferSize(), zappa.sampleRate() );
  fftZappa.linAverages(64);

  coltrane.loop();
  zappa.loop();
  zappa.mute();
}

void draw() {
  background(203, 1, 1);
  noStroke();

  // Cuadrados coltrane
  coltrane();

  // Cuadrados zappa
  zappa();

  //

  ////// Indicador de canción
  fill(255, 0, 99);
  if ( onOff == false) {
    ellipse(208, 305, 20, 20);
  } else {
    ellipse(510, 305, 20, 20);
  }
}


void keyReleased() {

  if (key == '1') {
    // Cambiar el switch onOff
    if ( onOff == false) {
      // si es falso hay quew
      // bajar el volumen a zappa
      // subimos el volumen a coltrane
      coltrane.mute();
      zappa.unmute();
    } else {
      coltrane.unmute();
      zappa.mute();
    }
    onOff = !onOff;
  }
}

void coltrane() {
  fftColtrane.forward(coltrane.mix);

  float canal1 = fftColtrane.getAvg(0); // 0 al 25 // 250 al 172
  float canal2 = fftColtrane.getAvg(1);
  float canal3 = fftColtrane.getAvg(3);
  float canal4 = fftColtrane.getAvg(4) + fftColtrane.getAvg(5);
  int limite1 = 160;
  int limite2 = 250;
  int col =  int( map(canal4, 0, 25, limite1, 250) );
  fill( col, 99, 99);
  rect(208, 183, 200, 200); // coltrane = false
  // canal 2
  col =  int( map(canal3, 0, 25, limite1, 250) );
  fill( col, 99, 99);
  rect(208, 183, 150, 150); // coltrane = false
  // canal 3
  col =  int( map(canal2, 0, 25, limite1, 250) );
  fill( col, 99, 99);
  rect(208, 183, 100, 100);
  // canal 4
  col =  int( map(canal1, 0, 25, limite1, 250) );
  fill( col, 99, 99);
  rect(208, 183, 50, 50);
}

void zappa() {
  fftZappa.forward(zappa.mix);
  // 0 al 71
  // 330 al 359

  // 330 al 71
  // 

  float canal1 = fftZappa.getAvg(0); // 0 al 15 // 71 al 0
  float canal2 = fftZappa.getAvg(1);
  float canal3 = fftZappa.getAvg(5) + fftZappa.getAvg(6);
  float canal4 = fftZappa.getAvg(13) + fftZappa.getAvg(14);
  int limite1 = 334;
  int limite2 = 414;

   // canal 4
  int col =  int( map(canal4, 0, 15, limite1, limite2) );
  if ( col > 359) { 
    col = col - 359;
  }
  fill( col, 99, 99);
  rect(510, 183, 200, 200); // zappa
  // canal 3
  col =  int( map(canal3, 0, 15, limite1, limite2) );
  if ( col > 359) { 
    col = col  - 359;
  }

  fill( col, 99, 99);
  rect(510, 183, 150, 150); // zappa
  // canal 2
  col =  int( map(canal2, 0, 15, limite1, limite2) );
  if ( col > 359) { 
    col = col  - 359;
  }

  fill( col, 99, 99);
  rect(510, 183, 100, 100); // zappa
  // canal 1
  col =  int( map(canal1, 0, 15, limite1, limite2) );
  if ( col > 359) { 
    col = col  - 359;
  }

  fill( col, 99, 99);
  rect(510, 183, 50, 50); // zappa
}