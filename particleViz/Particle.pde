class Particle {
  final static float maxSpeed = 0.1;

  PVector velocity = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));
  PVector acceleration = new PVector(0, 0);
  PVector location;

  float mass = random(1, 3);
  float size = random(5, 15);
  int lifespan = 300;

  Particle(PVector p) {
    location = new PVector (p.x, p.y);
    acceleration = new PVector (random(0.1, 1.5), 0);
    // r = random (100, 255);
    // g = random (0, 50);
    // b = 0;
  }

  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0); // resettting the acceleration, because otherwise it would add up. Does also work with set(0,0,0);
    lifespan -= 1.0; // countdown, has to be a float because the lifespan is also a float
    size += 0.01; //0.015
  }
  void applyForce(PVector force) {
    PVector f = force.get(); // we have to make a copy of the PVector before altering it by division or ellipse
    f.div(mass); // this gives us A
    acceleration.add(f); // A is then added to the vector to calculate the acceleration
  }
  void display() {
    // Colour based on x and y velocityocity
    fill(255,255,255);
    ellipse(location.x, location.y, size, size);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
