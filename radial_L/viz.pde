class Clock { //void viz(float t, float water, float wind, float solar)
  ArrayList<PVector> list;
  int counter=0;
  int counterArray= 0;
  color Fill;
  color Stroke;
  float angle = 0;
  float angleSpeed = 2.2;
  float lineSize;

  Clock(String cName, color fill, color stroke, float mapper) {
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

  void display() {
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