import java.util.Iterator;
// ArrayList<Data> data = new ArrayList<Data>();
ParticleSystem ps = new ParticleSystem();
Table table;

float t = 0;
float gravity = -0.1;
boolean motionBlur = true;

PGraphics vizMask;

void setup() {
  background(0);
  size(1050, 1050, P3D);
  smooth();
  noCursor();

  vizMask = createGraphics(width, height);
  vizMask.beginDraw();
  vizMask.background(0);
  vizMask.ellipse(width/2, height/2, height, height);
  vizMask.endDraw();
}
void draw() {
  t += 1.0 / 60.0 / 15.0;
  viz();
  PImage i = get();
  i.mask(vizMask);
  background(0);
  image(i, 0, 0, width, height);
  if (t > 1) {
    t = 0;
  }
}
