// attraction
// sandorlevi, 2016

import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.spi.*; // for AudioStream

Minim minim;
AudioOutput out;
LiveInput in;

final float g = 0.1;
Body bs[];

void setup() {
  size(700, 700);
  
  colorMode(RGB,1);
  background(1);
  fill(0.5, 0.1);
  cursor(CROSS);
  
  minim = new Minim(this);
  out = minim.getLineOut();
  
  AudioStream inputStream = minim.getInputStream( out.getFormat().getChannels(),
    out.bufferSize(),
    out.sampleRate(),
    out.getFormat().getSampleSizeInBits());
  
  in = new LiveInput( inputStream );
  
  GranulateSteady grain = new GranulateSteady();
  
  in.patch(grain).patch(out);
  
  bs = new Body[1000];
  for (int i = 0; i < bs.length; i++) {
    bs[i] = new Body(1, new PVector(random(width), random(height)));
  }
}

void draw() {
  noStroke();
  rect(0, 0, width, height);
  
  stroke(0);
  
  
  for (Body b: bs) {
    b.show();
    b.attract(new Body(1000, new PVector(mouseX, mouseY)));
    b.update();
  }
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
    s.mult(0.97);
    p = PVector.add(p, s);
  }
  
  void attract(Body b) {
    // Distancia 
    // separación
    // Tiempo de respuesta
    float d = constrain(PVector.dist(p, b.p), 20, 150);
    PVector f = PVector.mult(PVector.sub(b.p, p), b.m * m * g / (d * d));
    PVector a = PVector.div(f, m);
    s.add(a);
  }
  
  void show() {
    line(p.x, p.y, q.x, q.y);
    q = p;
  }
}