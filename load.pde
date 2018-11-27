class Data {
  float total_energy;
  float sun;
  float rain;
  float wind;
  Data(float e,float s,float r,float w) {
    total_energy = e;
    sun = s;
    rain = r;
    wind = w;
  }
}
void load() {
  table = loadTable("data_master.csv", "header,csv");

  for (TableRow row : table.rows()) {
    float total_energy = row.getFloat("total_energy");
    float sun = row.getFloat("sun");
    float rain = row.getFloat("rain");
    float wind = row.getFloat("wind");
    Data d = new Data(total_energy,sun,rain,wind); // adding whole objects to the arraylist, why not
    data.add(d);
  }
}
