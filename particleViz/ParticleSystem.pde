class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();

  void update() {
    Iterator<Particle> i = particles.iterator();
    while (i.hasNext()) {
      Particle p = i.next();
      if (p.location.x > width || p.location.x < 0) {
        i.remove();
        continue;
      } else if (p.location.y > height || p.location.y < 0) {
        i.remove();
        continue;
      }
      // Apply Force
      p.applyForce(PVector.random2D());
      p.move();
      // Remove dead particles
      if (p.isDead()) {
        i.remove();
      } else {
        p.display();
      }
    }
  }
}
