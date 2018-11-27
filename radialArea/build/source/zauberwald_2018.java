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

// ArrayList<Data> data = new ArrayList<Data>();
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
// class Data {
//   int data;
//   Data(int d) {
//     data = d;
//   }
// }
public void load() {
  table = loadTable("productionTable.csv", "header,csv");

  // for (TableRow row : table.rows()) {
  //   int data = row.getInt(0);
  //   Data d = new Data(data); // adding whole objects to the arraylist, why not
  //   data.add(d);
  // }
}
public void viz() { //void viz(float t, float water, float wind, float solar)
  float data = table.getFloat(row,0);
  println(data);
  float newSize = map(data,0,3428530.426154f,0,650);
  lineSize = newSize;
  strokeWeight(1.5f);
  noFill();
  stroke(80,80,80, 50);
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(angle));
    line(0, 0, lineSize, lineSize);
    // if(blasen) {
    //   stroke(255, 255, 0,random(80,150));
    //   float blasenData = random(90,150);
    //   line(0,0,blasenData,blasenData);
    // }
    // if(wasser) {
    //   stroke(0, 255, 255,random(80,150));
    //   float blasenData = random(90,150);
    //   line(0,0,blasenData,blasenData);
    // }
    // if(solar) {
    //   stroke(255, 0, 255,random(80,150));
    //   float blasenData = random(90,150);
    //   line(0,0,blasenData,blasenData);
    // }
    // if (lineModule != null) {
    //   shape(lineModule, 0, 0, lineSize, lineSize);
    // }
    // else {
    //   line(0, 0, lineSize, lineSize);
    // }
    angle = angle + angleSpeed;
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
