// ArrayList<Data> data = new ArrayList<Data>();
Table table;
Rings rwind = new Rings(color(142, 250, 0), 130);
Rings rwater = new Rings(color(0, 150, 255), 130);
Rings rsolar = new Rings(color(252, 241, 30), 130);

PGraphics vizMask;
PGraphics ellipseMask;
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
  ellipseMask = createGraphics(200,200);
  ellipseMask.beginDraw();
  ellipseMask.background(255,0,255);
  ellipseMask.ellipse(width/2,height/2,400,400);
  ellipseMask.endDraw();

  load();

  cConsumption=new Clock("consumption", color(255), color(200), 2500000); //eigentlich 3000000
  cWind=new Clock("wind", color(255, 0, 255, 200), color(255, 0, 255), 36);
  cSun=new Clock("sun", color(255, 255, 0, 200), color(255, 255, 0), 80);
  cRain=new Clock("rainfall", color(0, 255, 255, 200), color(0, 255, 255), 2);

  rwind.addRingOutside();
  rwater.addRingOutside();
  rsolar.addRingOutside();
  fill(0);
  ellipse(width/2,height/2,100,100);
}

void draw() {
  t += 0.2 / 60.0 / 5.0;
  background(0);
  cConsumption.display();
  // cSun.display();
  // cWind.display();
  // cRain.display();

  rsolar.paint();
  rwind.paint();
  rwater.paint();
  PImage i = get();
  i.mask(vizMask);

  background(0);
  image(i, 0, 0, width, height);

  // reset time
  if (t > 1) {
    t = 0;
  }
}
