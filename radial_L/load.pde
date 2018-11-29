// class Data {
//   int data;
//   Data(int d) {
//     data = d;
//   }
// }
void load() {
  table = loadTable("all_data_2017.csv", "header,csv");

  // for (TableRow row : table.rows()) {
  //   int data = row.getInt(0);
  //   Data d = new Data(data); // adding whole objects to the arraylist, why not
  //   data.add(d);
  // }
}