void dibujarTerreno() {

  flying -= 0.007;

  float yoff = flying;
  //float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -200, 200) + altura;
      xoff += offset;
    }
    yoff += offset;
  }


  //daniel.torrer@gmail.com


  background(#2fccb8);
  stroke(#001b81);
  fill(#ff00d8, 50);
  //noFill();

  translate(width/2 + -106, height/2 + 119);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y] );
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}