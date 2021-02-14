class ParticuleSystem {
  ArrayList<Particule> particules;
  PVector carte[][];
  ParticuleSystem() {
    particules = new ArrayList<Particule>();
    carte = new PVector[width][height];
    for (int x=0; x<width; x++) {
      for (int y=0; y<height; y++) {
        carte[x][y] = new PVector(random(-10, 10), random(-10, 10));
        carte[x][y].normalize();
      }
    }
  }

  void run() {
    loadPixels();

    while (particules.size()<10000) {
      particules.add(new Particule());
    }

    for (int x=0; x< width; x++) {
      for (int y=0; y< height; y++) {
        efface(x, y);
      }
    }

    for (int i=0; i<particules.size(); i++) {
      Particule particuleActu = particules.get(i);
      moveParticule(particuleActu);
      if (particuleActu.position.x<0 ||
        particuleActu.position.x>width-1||
        particuleActu.position.y<0 ||
        particuleActu.position.y>height-1) {
        particules.remove(particuleActu);
      } else {
        particuleActu.display();
      }
    }
    updatePixels();

    
  }

  void moveParticule(Particule particuleActu) {

    float coefDirection = 0.5;
    float coefCarte = 0.1;


    carte[floor(particuleActu.position.x)][floor(particuleActu.position.y)].lerp(particuleActu.direction, 0.3);
    particuleActu.direction.lerp(carte[floor(particuleActu.position.x)][floor(particuleActu.position.y)], 0.5);
    particuleActu.direction.normalize();
    particuleActu.position.add(particuleActu.direction);
  }

  void efface(int x, int y) {
    int numPixel = numPixel(x, y);
    color c = pixels[numPixel];
    pixels[numPixel] = color(red(c)*0.98, green(c)*0.91, blue(c)*0.99);
  }
}