import processing.sound.*;
SoundFile file;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm':00'");
static String URL = "http://eif-research.feit.uts.edu.au/api/csv/?rFromDate=%s&rToDate=%s&rFamily=%s&rSensor=%s+(In)";

class Sensors {  
  Table table;
  String sensorFamily;
  String sensorName;
  float xpos;
  float ypos;
  color c;
  int size;

  Sensors(String tempSensorFamily, String tempSensorName, float tempXpos, float tempYpos) {
    sensorFamily = tempSensorFamily;
    sensorName = tempSensorName;
    xpos = tempXpos;
    ypos = tempYpos;
    size = getData();
  }

  int getData() {  
    Date fromDate = getDateFrom();
    Date date = getDate(); 
    String url = String.format(URL, DATE_FORMAT.format(fromDate), DATE_FORMAT.format(date), sensorFamily, sensorName);
    println(url);
    table = loadTable(url, "header, tsv");

    if (table == null || table.getRowCount() == 0) 
      return 0;
    table.print();
    String row = table.getString(table.getRowCount() - 1, 0);
    String[] columns = row.split(",");
    if (columns.length != 2) 
      return 0;
    size = Integer.parseInt(columns[1]);
    println("return in match size:" + size);
    return size;
  }

  void playMethod() {
    if(!file.isPlaying()) {
      file.play();
      file.rate(size/10);
    }  
  }

  void checkSensor() {
    if (mouseX > xpos - 10 && mouseX < xpos + 10 && mouseY > ypos - 10 && mouseY < ypos + 10) {
      if (size > 0 && size <= 100) {
        playMethod();
      }
    }
  }

  void display() {
    if (size >= 0 & size <= 30) {
      fill(0, 128, 255, 127);        //Blue
    } else if (size >= 31 & size <= 60) {  
      fill(118, 230, 118, 127);      //Green
    } else if (size >= 61 & size <= 90) {
      fill(239, 23, 23, 127);        //Red
    } else if (size >= 91 & size <= 150) {
      fill(162, 157, 157, 127);    //Grey
    } else {
      fill(24, 20, 20, 127);        //Black
    }
    circle(xpos, ypos, size);
    fill(0);
    text(sensorName, xpos, ypos);
    text(size, xpos, ypos+15);
  }
}
