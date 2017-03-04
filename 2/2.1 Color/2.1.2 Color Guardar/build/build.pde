/* 2.1 Color

*/

void setup(){
  size(720, 720);
  noCursor();
  //frameRate(10);
}

void draw(){
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
  background(mouseY/2, 100, 100);
  fill(360 - mouseY/2, 100, 100);
  rect( 360, 360, mouseX+1, mouseX+1);
  fill(360 - mouseY /4, 50, 50);
  rect(360, 360, (mouseX/2)+1, (mouseX/2)+1);
   
  if (frameCount < 100) saveFrame("#####.png");
}