Rings wind = new Rings(color(142, 250, 0), 130);
Rings water = new Rings(color(0, 150, 255), 130);
Rings solar = new Rings(color(252, 241, 30), 130);

void setup() {
  size(1200,700, P3D);
  wind.addRingOutside();
  water.addRingOutside();
  solar.addRingOutside();
}

void draw() {
  background(0);
  solar.paint();
  wind.paint();
  water.paint();
}
void keyPressed() {
  if(keyCode == UP) {
    wind.addRingOutside();
  }
  if(keyCode == DOWN) {
    wind.removeRingInside();
  }

  if(keyCode == LEFT) {
    wind.removeRingOutside();
  }

  if(keyCode == RIGHT) {
    wind.addRingInside();
  }
     if(key == 'q') {
    water.addRingOutside();
  }
    if(key == 'Q') {
    water.removeRingOutside();
  }
       if(key == 's') {
    solar.addRingOutside();
  }
    if(key == 'S') {
    solar.removeRingOutside();
  }

  if(key == 'A'){
    wind.amplitude -= 0.05;
    if(wind.amplitude < 0) {
      wind.amplitude = 0;
    }
  }
    if(key == 'a'){
    wind.amplitude += 0.05;
    if(wind.amplitude > 1) {
      wind.amplitude = 1;
    }
  }
    if(key == 'B'){
    water.amplitude -= 0.05;
    if(water.amplitude < 0) {
      water.amplitude = 0;
    }
  }
    if(key == 'b'){
    water.amplitude += 0.05;
    if(water.amplitude > 1) {
      water.amplitude = 1;
    }
  }

     if(key == 'C'){
    solar.amplitude -= 0.05;
    if(solar.amplitude < 0) {
      solar.amplitude = 0;
    }
  }
    if(key == 'c'){
    solar.amplitude += 0.05;
    if(solar.amplitude > 1) {
      solar.amplitude = 1;
    }
  }
}
