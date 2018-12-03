// ArrayList<Data> data = new ArrayList<Data>();
Table table;
Rings ringWind;
Rings ringRain;
Rings ringSun;
Clock cConsumption;
Clock cSun;
Clock cWind;
Clock cRain;

float water = 0;
float wind = 0;
float solar = 0;
float t = 0;

float maxValWind = 3565;
float maxValRain = 6.6;
float maxValSun = 59.5;
boolean animate=false;
void setup() {
  size(800, 800, P3D);
  smooth();
  noCursor();
  load();
  cConsumption=new Clock("consumption", color(255), color(200), 2500000); //eigentlich 3000000
  cWind=new Clock("wind", color(255, 0, 255, 200), color(255, 0, 255), 45);
  cSun=new Clock("sun", color(255, 255, 0, 200), color(255, 255, 0), 150);
  cRain=new Clock("rainfall", color(0, 255, 255, 200), color(0, 255, 255), 60);
  ringWind = new Rings("wind", color(255, 0, 255), 160, 3565);
  ringRain = new Rings("rainfall", color(0, 255, 255), 160, 59.5);
  ringSun = new Rings("sun", color(255, 255, 0), 160, 6.6);

  ringWind.addRingOutside();
  ringRain.addRingOutside();
  ringSun.addRingOutside();
}

void draw() {
  t += 0.2 / 60.0 / 5.0;
  background(0);
  cConsumption.display();
  cSun.display();
  cWind.display();
  cRain.display();

  ringWind.paint();
  ringRain.paint();
  ringSun.paint();
  fill(0);
  noStroke();
  ellipse(width/2, height/2, 250, 250);
  if (t > 1) {
    t = 0;
  }
  if (keyPressed) {
    animate=true;
  } else {
    animate=false;
  }
}