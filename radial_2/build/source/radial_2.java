import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class radial_2 extends PApplet {

Rings wind = new Rings(color(142, 250, 0), 130);
Rings water = new Rings(color(0, 150, 255), 130);
Rings solar = new Rings(color(252, 241, 30), 130);

public void setup() {
  
  wind.addRingOutside();
  water.addRingOutside();
  solar.addRingOutside();
}

public void draw() {
  background(0);
  solar.paint();
  wind.paint();
  water.paint();
}
public void keyPressed() {
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
    wind.amplitude -= 0.05f;
    if(wind.amplitude < 0) {
      wind.amplitude = 0;
    }
  }
    if(key == 'a'){
    wind.amplitude += 0.05f;
    if(wind.amplitude > 1) {
      wind.amplitude = 1;
    }
  }
    if(key == 'B'){
    water.amplitude -= 0.05f;
    if(water.amplitude < 0) {
      water.amplitude = 0;
    }
  }
    if(key == 'b'){
    water.amplitude += 0.05f;
    if(water.amplitude > 1) {
      water.amplitude = 1;
    }
  }

     if(key == 'C'){
    solar.amplitude -= 0.05f;
    if(solar.amplitude < 0) {
      solar.amplitude = 0;
    }
  }
    if(key == 'c'){
    solar.amplitude += 0.05f;
    if(solar.amplitude > 1) {
      solar.amplitude = 1;
    }
  }
}
class Rings {
  int ringCount = 0;
  float minRadius = 0.0f;
  float ringDistance = 20.0f;
  float amplitude = 0.4f;
  int ringColor;
  float seed;

  Rings(int ringColor, float radius) {
    this.ringColor = ringColor;
    this.minRadius = radius;
    this.seed = random(0, 10000);
  }
  public void addRingInside() {
    if(minRadius - ringDistance < 0) {
      return;
    }
    minRadius -= ringDistance;
    ringCount++;
  }
  public void addRingOutside() {
    ringCount++;
  }
  public void removeRingInside() {
    if(ringCount <= 0) {
      return;
    }
    ringCount--;
    // Kleinster Ring wurde entfernt: neuer kleinster Ring ist da wo zuvor der zweitkleinste lag (minRadius + ringDistance)
    minRadius += ringDistance;
  }
  public void removeRingOutside() {
    ringCount--;
    if(ringCount < 0) {
      ringCount = 0;
    }
  }
  public void paint() {
    stroke(ringColor);
    strokeWeight(3);
    noFill();
    blendMode(ADD);
    for(int i = 0; i<ringCount; i++) {
      paintRing(i);
    }
  }
  public void paintRing(int i) {
    float radius = (minRadius + (i * ringDistance))/2;
    float variance = amplitude * radius;
    float min = radius - variance;
    float max = radius + variance;

    pushMatrix();
    translate(width/2, height/2);
    beginShape();
    for (float angle = 0; angle < 360; angle += 0.8f) {
      float theta = radians(angle);
      float x = cos(theta);
      float y = sin(theta);
      float r1 = noise(theta, (frameCount+seed)*0.06f);
      r1 = map(r1, 0, 1, min, max);
      vertex(x*r1, y*r1);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
  public void settings() {  size(1200,700, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "radial_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
