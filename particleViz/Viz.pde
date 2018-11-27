void viz() {
  // updates opaque background for motion blur
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  addParticles();
}
void addParticles() {
  ps.particles.add(new Particle(new PVector(width/2,height/2)));
  ps.update();
  keyPressed();
}
void keyPressed() {
  switch(key) {
  case 'q':
    ps.particles.add(new Wind(new PVector(width/2,height/2)));
    break;
  case 'w':
    ps.particles.add(new Water(new PVector(width/2,height/2)));
    break;
  case 'e':
    ps.particles.add(new Solar(new PVector(width/2,height/2)));
    break;
  }
}
