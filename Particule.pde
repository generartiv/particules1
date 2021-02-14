class Particule {
  PVector position;
  PVector direction;
  Particule() {
    position = new PVector(random(width), random(height));
    direction = new PVector(random(-10, 10), random(-10, 10));
    direction.normalize();
  }



  void display() {
    int numPixel = numPixel(floor(position.x), floor(position.y));
    color c = pixels[numPixel];
    float r = red(c) + 90;
    float g = green(c) + 80;
    float b = blue(c) + 150;

    if (r>255) {
      r = 255;
    }
    if (g>255) {
      g = 255;
    }
    if (b>255) {
      b = 255;
    }
    pixels[numPixel] = color(r, g, b);
  }
}