class Particle {
  final static float BOUNCE = -0.5;
  final static float MAX_SPEED = 0.1;

  PVector vel = new PVector(random(-MAX_SPEED, MAX_SPEED), random(-MAX_SPEED, MAX_SPEED));
  PVector acc = new PVector(0, 0);
  PVector pos;

  float mass = random(2, 2.5);
  float size = random(0.1, 2.0);
  float r, g, b;
  int lifespan = 300;

  Particle(PVector p) {
    pos = new PVector (p.x, p.y);
    acc = new PVector (random(0.1, 1.5), 0);
    r = random (100, 255);
    g = random (0, 50);
    b = 0;
  }

  void move() {
    vel.add(acc); // Apply acceleration
    pos.add(vel); // Apply our speed vector
    acc.mult(0);

    size += 0.01; //0.015
    lifespan--;
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  void display() {
    // Colour based on x and y velocity
    fill(255,255,255);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
