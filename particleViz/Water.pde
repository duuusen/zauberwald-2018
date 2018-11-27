class Water extends Particle {

  Water(PVector l) {
    super(l); // is really necessary.
  }
  // We inherite update() from parent class
  void display() { // Overwrites the display method
    fill(0,255,255);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }
}
