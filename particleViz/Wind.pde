class Wind extends Particle {

  Wind(PVector l) {
    super(l); // is really necessary.
  }
  // We inherite update() from parent class
  void display() { // Overwrites the display method
    fill(255,255,0);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }
}
