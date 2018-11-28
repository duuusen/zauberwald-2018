ArrayList<Data> data = new ArrayList<Data>();
Table table;

PGraphics vizMask;

float water = 0;
float wind = 0;
float solar = 0;
float t = 0;
float angle = 0;
float angleSpeed = 1.1;
float lineSize;
int row = 0;

void setup() {
  size(1050, 1050, P3D);
  frameRate(60);
  smooth();
  noCursor();

  vizMask = createGraphics(width, height);
  vizMask.beginDraw();
  vizMask.background(0);
  vizMask.ellipse(width/2, height/2, height, height);
  vizMask.endDraw();

  load();
}

void draw() {
  t += 1.0 / 60.0 / 15.0;

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
