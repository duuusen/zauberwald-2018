// ArrayList<Data> data = new ArrayList<Data>();
Table table;

PGraphics vizMask;
Clock cConsumption;
Clock cSun;
Clock cWind;
Clock cRain;
float water = 0;
float wind = 0;
float solar = 0;
float t = 0;

int row = 0;

void setup() {
  size(800, 800, P3D);
  //size(1050, 1050, P3D);
  frameRate(60);
  smooth();
  noCursor();

  vizMask = createGraphics(width, height);
  vizMask.beginDraw();
  vizMask.background(0);
  vizMask.ellipse(width/2, height/2, height, height);
  vizMask.endDraw();

  load();
  
  cConsumption=new Clock("consumption", color(255), color(200), 2500000); //eigentlich 3000000
  cWind=new Clock("wind", color(255, 0, 255, 200), color(255, 0, 255), 36);
  cSun=new Clock("sun", color(255, 255, 0, 200), color(255, 255, 0), 80);
  cRain=new Clock("rainfall", color(0, 255, 255, 200), color(0, 255, 255), 2);
}

void draw() {
  t += 0.2 / 60.0 / 5.0;
  background(0);
  cConsumption.display();
  cSun.display();
  cWind.display();
  cRain.display();
  PImage i = get();
  i.mask(vizMask);

  background(0);
  image(i, 0, 0, width, height);

  // reset time
  if (t > 1) {
    t = 0;
  }
}