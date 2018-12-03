class WeatherData {
  float sun;
  float rain;
  float wind;

  WeatherData(float sun, float rain, float wind) {
    this.rain = rain;
    this.sun = sun;
    this.wind = wind;
  }
}
ArrayList<WeatherData> weatherData;
void load() {
  table = loadTable("all_data_2017.csv", "header,csv");
  weatherData = new ArrayList<WeatherData>();
    for (TableRow row : table.rows()) {
      float rain = row.getFloat("rainfall");
      float sun = row.getFloat("sun");
      float wind = row.getFloat("wind");
      WeatherData wd = new WeatherData(rain,sun,wind);
      weatherData.add(wd);
    }
}