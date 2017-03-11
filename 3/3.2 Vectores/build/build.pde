PImage miImagen;


void setup(){
  size(500, 480);
  miImagen = loadImage("a1.jpg");
}

void draw(){
  background(#ffffff);
  image( miImagen, 0, 0);

  //tint(245, mouseX, mouseY);
  //image( miImagen, 0, 0, width, height);
  
  
  //noTint();
  //image( miImagen, 250, 0, width, height, 1500, 0, 4500, 2391);
  
  

  //image( miImagen, mouseX, mouseY);
  //ellipse(mouseX, mouseY, 30, 30);
}