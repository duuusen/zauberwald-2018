class Rings {
  int ringCount = 0;
  float minRadius = 0.0;
  float ringDistance = 20.0;
  float amplitude = 0.4;
  color ringColor;
  float seed;

  Rings(color ringColor, float radius) {
    this.ringColor = ringColor;
    this.minRadius = radius;
    this.seed = random(0, 10000);
  }
  void addRingInside() {
    if(minRadius - ringDistance < 0) {
      return;
    }
    minRadius -= ringDistance;
    ringCount++;
  }
  void addRingOutside() {
    ringCount++;
  }
  void removeRingInside() {
    if(ringCount <= 0) {
      return;
    }
    ringCount--;
    // Kleinster Ring wurde entfernt: neuer kleinster Ring ist da wo zuvor der zweitkleinste lag (minRadius + ringDistance)
    minRadius += ringDistance;
  }
  void removeRingOutside() {
    ringCount--;
    if(ringCount < 0) {
      ringCount = 0;
    }
  }
  void paint() {
    stroke(ringColor);
    strokeWeight(3);
    noFill();
    blendMode(ADD);
    for(int i = 0; i<ringCount; i++) {
      paintRing(i);
    }
  }
  void paintRing(int i) {
    float radius = (minRadius + (i * ringDistance))/2;
    float variance = amplitude * radius;
    float min = radius - variance;
    float max = radius + variance;

    pushMatrix();
    translate(width/2, height/2);
    beginShape();
    for (float angle = 0; angle < 360; angle += 0.8) {
      float theta = radians(angle);
      float x = cos(theta);
      float y = sin(theta);
      float r1 = noise(theta, (frameCount+seed)*0.06);
      r1 = map(r1, 0, 1, min, max);
      vertex(x*r1, y*r1);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
