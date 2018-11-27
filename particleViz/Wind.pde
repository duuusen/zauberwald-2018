class Wind extends Particle {

  Wind(PVector l) {
    super(l); // is really necessary.
  }
  // We inherite update() from parent class
  void display() { // Overwrites the display method
    fill(255,255,0);
    ellipse(location.x, location.y, size, size);
  }
}
