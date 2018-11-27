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

public class zauberwald_2018 extends PApplet {

ArrayList<Data> data = new ArrayList<Data>();
Table table;

PGraphics vizMask;

float water = 0;
float wind = 0;
float solar = 0;
float t = 0;
float angle = 0;
float angleSpeed = 1.1f;
float lineSize;
int row = 0;

public void setup() {
  
  frameRate(60);
  
  noCursor();

  vizMask = createGraphics(width, height);
  vizMask.beginDraw();
  vizMask.background(0);
  vizMask.ellipse(width/2, height/2, height, height);
  vizMask.endDraw();

  load();
}

public void draw() {
  t += 1.0f / 60.0f / 15.0f;

  viz();

  PImage i = get();
  i.mask(vizMask);

  background(0);
  image(i, 0, 0, width, height);

  // reset time
  if (t > 1) {
    t = 0;
  }
}
class Data {
  float total_energy;
  float sun;
  float rain;
  float wind;
  Data(float e,float s,float r,float w) {
    total_energy = e;
    sun = s;
    rain = r;
    wind = w;
  }
}
public void load() {
  table = loadTable("data_master.csv", "header,csv");

  for (TableRow row : table.rows()) {
    float total_energy = row.getFloat("total_energy");
    float sun = row.getFloat("sun");
    float rain = row.getFloat("rain");
    float wind = row.getFloat("wind");
    Data d = new Data(total_energy,sun,rain,wind); // adding whole objects to the arraylist, why not
    data.add(d);
  }
}
public void viz() { //void viz(float t, float water, float wind, float solar)
  float data = table.getFloat(row,"total_energy");
  println(data);
  float newSize = map(data,0,2492414.623f,0,400);
  lineSize = newSize;
  strokeWeight(1.5f);
  noFill();
  stroke(80,80,80);
  pushMatrix();
    translate(width/2, height/2);
    beginShape();
    for(int i = 0; i < 100; i++) {
      float radius = 300 + random(50);
      float x = cos(radians(i * 3.6f)) * radius;
      float y = sin(radians(i * 3.6f)) * radius;
      vertex(x, y);
    }
endShape(CLOSE);
  popMatrix();
  row++;
}
  public void settings() {  size(1050, 1050, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "zauberwald_2018" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
