void viz() { //void viz(float t, float water, float wind, float solar)
  float data = table.getFloat(row,0);
  println(data);
  float newSize = map(data,0,3428530.426154,0,650);
  lineSize = newSize;
  strokeWeight(1.5);
  noFill();
  stroke(80,80,80);
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
