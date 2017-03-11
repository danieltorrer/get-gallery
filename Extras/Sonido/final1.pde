import com.hamoid.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

VideoExport miVideo;

Minim minim;
AudioOutput out;
LiveInput in;

final float g = 0.1;
Body bs[];

float maxX = 0;
float maxY = 0;

float minX = 0;
float minY = 0;

void setup() {
  size(1000, 600);
  
  miVideo = new VideoExport(this, "animacion.mp4");
  
  
  //colorMode(RGB);
  background(#4B4B4B);
  fill(#4B4B4B, 100);

  cursor(CROSS);

  bs = new Body[1000];
  for (int i = 0; i < bs.length; i++) {
    bs[i] = new Body(1, new PVector(random(width), random(height)));
  }

  // initialize the minim and out objects
  minim = new Minim(this);
  out = minim.getLineOut();

  // we ask for an input with the same audio properties as the output.
  AudioStream inputStream = minim.getInputStream( out.getFormat().getChannels(), 
    out.bufferSize(), 
    out.sampleRate(), 
    out.getFormat().getSampleSizeInBits());

  // construct a LiveInput by giving it an InputStream from minim.                                                  
  in = new LiveInput( inputStream );

  // create granulate UGen so we can hear the input being modfied before it goes to the output
  GranulateSteady grain = new GranulateSteady();

  // patch the input through the grain effect to the output
  in.patch(grain).patch(out);
}

void draw() {
  noStroke();
  rect(0, 0, width, height);
  
  //float volumen = 50 + out.left.level() * height * 2;
  float volumen = map(out.left.level(), 0, 10, 0, height );
  float volumenFinal = height - (volumen * height) - 100;
  float ancho = constrain( volumenFinal, 0, height);
  stroke(#2CF2A1);
  for (Body b : bs) {
    b.show();
    b.attract(new Body(500, new PVector(mouseX, ancho )) );
    b.update();
  }
  //stroke(#2CF2A1);
  /*for (Body b : bs2) {
   b.show();
   b.attract(new Body(1000, new PVector(maxX, maxY)));
   b.update();
   }*/
   miVideo.saveFrame();
}

class Body {
  float m;
  PVector p, q, s;

  Body(float m, PVector p) {
    this.m = m;
    this.p = p;
    q = p;
    this.s = new PVector(0, 0);
  }

  void update() {
    s.mult(0.98);
    p = PVector.add(p, s);
  }

  void attract(Body b) {
    float d = constrain(PVector.dist(p, b.p), 10, 100);
    PVector f = PVector.mult(PVector.sub(b.p, p), b.m * m * g / (d * d));
    PVector a = PVector.div(f, m);
    s.add(a);
  }

  void show() {
    line(p.x, p.y, q.x, q.y);
    q = p;
  }
}