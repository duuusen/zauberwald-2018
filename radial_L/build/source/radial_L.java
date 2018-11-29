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

public class radial_L extends PApplet {

// ArrayList<Data> data = new ArrayList<Data>();
Table table;
Rings rwind = new Rings(color(255, 0, 255), 130);
Rings rwater = new Rings(color(0, 255, 255), 130);
Rings rsolar = new Rings(color(255, 255, 0), 130);

Clock cConsumption;
Clock cSun;
Clock cWind;
Clock cRain;
float water = 0;
float wind = 0;
float solar = 0;
float t = 0;
int row = 0;

public void setup() {
  
  //size(1050, 1050, P3D);
  frameRate(60);
  
  noCursor();

  load();

  cConsumption=new Clock("consumption", color(255), color(200), 2500000); //eigentlich 3000000
  cWind=new Clock("wind", color(255, 0, 255, 200), color(255, 0, 255), 36);
  cSun=new Clock("sun", color(255, 255, 0, 200), color(255, 255, 0), 120);
  cRain=new Clock("rainfall", color(0, 255, 255, 200), color(0, 255, 255), 2);

  rwind.addRingOutside();
  rwater.addRingOutside();
  rsolar.addRingOutside();
}

public void draw() {
  t += 0.2f / 60.0f / 5.0f;
  background(0);
  cConsumption.display();
  cSun.display();
   cWind.display();
  cRain.display();
  rsolar.paint();
  rwind.paint();
  rwater.paint();
  fill(0);
  noStroke();
  ellipse(width/2,height/2,250,250);
  if (t > 1) {
    t = 0;
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
    this.seed = random(0, 1000000);
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
// class Data {
//   int data;
//   Data(int d) {
//     data = d;
//   }
// }
public void load() {
  table = loadTable("all_data_2017.csv", "header,csv");

  // for (TableRow row : table.rows()) {
  //   int data = row.getInt(0);
  //   Data d = new Data(data); // adding whole objects to the arraylist, why not
  //   data.add(d);
  // }
}
class Clock { //void viz(float t, float water, float wind, float solar)
  ArrayList<PVector> list;
  float data = table.getFloat(row, 0);
  int counter=0;
  int counterArray= 0;
  int Fill;
  int Stroke;
  float angle = 0;
  float angleSpeed = 2.2f;
  float lineSize;

  Clock(String cName, int fill, int stroke, float mapper) {
    list = new ArrayList<PVector>();
    for (int i=0; i<table.getRowCount(); i++) {
      float data = table.getFloat(i, cName);
      float newSize = map(data, 0, mapper, 0, height/2);
      lineSize = newSize;
      float x= cos(radians(angle))*lineSize+width/2;
      float y= sin(radians(angle))*lineSize+height/2;
      angle = angle + angleSpeed;
      list.add(new PVector(x, y));
    }
    Fill=fill;
    Stroke=stroke;
  }

  public void display() {
    beginShape();
    noStroke();
    curveVertex(width/2, height/2);
    curveVertex(width/2, height/2);
    for (int i= counterArray; i<counter; i++) {
      //stroke(255);
      fill(Fill);
      curveVertex(list.get(i).x, list.get(i).y);
    }
    endShape();

    if (counter>165&&counter<list.size()-1&&frameCount%1==0) {
      counterArray++;
    }

    if (counter<list.size()&&frameCount%1==0) {
      counter++;
    }
  }
}
  public void settings() {  size(800, 800,P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "radial_L" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
