import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Iterator; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class particle_test_1 extends PApplet {


// ArrayList<Data> data = new ArrayList<Data>();
ParticleSystem ps = new ParticleSystem();
Table table;

float t = 0;
float gravity = -0.1f;
boolean motionBlur = true;

PGraphics vizMask;

public void setup() {
  background(0);
  
  
  noCursor();

  vizMask = createGraphics(width, height);
  vizMask.beginDraw();
  vizMask.background(0);
  vizMask.ellipse(width/2, height/2, height, height);
  vizMask.endDraw();
}
public void draw() {
  t += 1.0f / 60.0f / 15.0f;
  viz();
  PImage i = get();
  i.mask(vizMask);
  background(0);
  image(i, 0, 0, width, height);
  if (t > 1) {
    t = 0;
  }
}
class Particle {
  final static float BOUNCE = -0.5f;
  final static float MAX_SPEED = 0.1f;

  PVector vel = new PVector(random(-MAX_SPEED, MAX_SPEED), random(-MAX_SPEED, MAX_SPEED));
  PVector acc = new PVector(0, 0);
  PVector pos;

  float mass = random(2, 2.5f);
  float size = random(0.1f, 2.0f);
  float r, g, b;
  int lifespan = 300;

  Particle(PVector p) {
    pos = new PVector (p.x, p.y);
    acc = new PVector (random(0.1f, 1.5f), 0);
    r = random (100, 255);
    g = random (0, 50);
    b = 0;
  }

  public void move() {
    vel.add(acc); // Apply acceleration
    pos.add(vel); // Apply our speed vector
    acc.mult(0);

    size += 0.01f; //0.015
    lifespan--;
  }
  public void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  public void display() {
    // Colour based on x and y velocity
    fill(255,255,255);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }

  public boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();

  public void update() {
    Iterator<Particle> i = particles.iterator();
    while (i.hasNext()) {
      Particle p = i.next();
      // remove particles
      if (p.pos.x > width || p.pos.x < 0) {
        i.remove();
        continue;
      } else if (p.pos.y > height || p.pos.y < 0) {
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
class Solar extends Particle {

  Solar(PVector l) {
    super(l); // is really necessary.
  }
  // We inherite update() from parent class
  public void display() { // Overwrites the display method
    fill(255,0,255);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }
}
public void viz() {
  // updates opaque background for motion blur
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  addParticles();
}
public void addParticles() {
  ps.particles.add(new Particle(new PVector(width/2,height/2)));
  ps.update();
  keyPressed();
}
public void keyPressed() {
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
class Water extends Particle {

  Water(PVector l) {
    super(l); // is really necessary.
  }
  // We inherite update() from parent class
  public void display() { // Overwrites the display method
    fill(0,255,255);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }
}
class Wind extends Particle {

  Wind(PVector l) {
    super(l); // is really necessary.
  }
  // We inherite update() from parent class
  public void display() { // Overwrites the display method
    fill(255,255,0);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }
}
  public void settings() {  size(1050, 1050, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "particle_test_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
