import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

void setup()
{
  size(512, 200);
  colorMode(HSB, 359, 99 , 99);
  minim = new Minim(this);
  jingle = minim.loadFile("arcade.mp3", 1024);

  jingle.loop();

  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  fft.linAverages(12);
}

void draw()
{
  background(0, 0, 0);
  stroke(0, 0, 21);

  fft.forward( jingle.mix );

  for (int i = 0; i < fft.avgSize(); i++)
  {

    
    int w = int( width/fft.avgSize() );
    //fill(fft.getAvg(i) * 90, 100, 100);
    rect( w * i, 0, w * (i+1), height - (fft.getAvg(i) * 5) );
    
  }
}