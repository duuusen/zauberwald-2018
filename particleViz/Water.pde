class Water extends Particle {

  Water(PVector l) {
    super(l); // is really necessary.
  }
  // We inherite update() from parent class
  void display() { // Overwrites the display method
    fill(0,255,255);
    ellipse(location.x, location.y, size, size);
  }
}
