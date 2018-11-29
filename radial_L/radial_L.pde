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

void setup() {
  size(800, 800,P3D);
  //size(1050, 1050, P3D);
  frameRate(60);
  smooth();
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

void draw() {
  t += 0.2 / 60.0 / 5.0;
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
