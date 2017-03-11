import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  jingle = minim.loadFile("jingle.mp3", 1024);
  
  jingle.loop();
  
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  fft.linAverages(9);
  
}

void draw()
{
  background(0);
  stroke(255);
  
  fft.forward( jingle.mix );
  
  for(int i = 0; i < fft.avgSize(); i++)
  {
    
    int w = int( width/fft.avgSize() );
    rect( w * i, 0, w * (i+1), height - (fft.getAvg(i) * 15) );
    
  }
}