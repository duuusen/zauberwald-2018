void viz() { //void viz(float t, float water, float wind, float solar)
  float data = table.getFloat(row,"total_energy");
  println(data);
  float newSize = map(data,0,2492414.623,0,400);
  lineSize = newSize;
  strokeWeight(1.5);
  noFill();
  stroke(80,80,80);
  pushMatrix();
    translate(width/2, height/2);
    beginShape();
    for(int i = 0; i < 100; i++) {
      float radius = 300 + random(50);
      float x = cos(radians(i * 3.6)) * radius;
      float y = sin(radians(i * 3.6)) * radius;
      vertex(x, y);
    }
endShape(CLOSE);
  popMatrix();
  row++;
}
