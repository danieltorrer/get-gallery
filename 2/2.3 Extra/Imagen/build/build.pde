/**
 * Load and Display 
 */

PImage img;  // Declara variable "a" de tipe PImage

void setup() {
  size(640, 360);
  // La imagen debe estar en el folder "data" para que se pueda cargar 
  img = loadImage("moonwalk.jpg");  // Cargar la imagen en el programa 
}

void draw() {
  // Despliega la imagen en el punto (0,0)
  image(img, 0, 0);
  // Despliega la imagen en el punto (0, height/2) a la mitad de su tamaño 
  image(img, 0, height/2, img.width/2, img.height/2);
}