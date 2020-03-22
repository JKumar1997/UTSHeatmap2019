PImage bg;
Sensors pc35;
Sensors pc36;
Sensors pc37;
Sensors pc38;
Sensors pc39;
Sensors pc40;
Sensors pc41;
Sensors pc42;
Sensors pc43;
Sensors pc44;
Sensors pc45;
Sensors pc46;
Sensors pc47;
Sensors pc48;
Sensors pc49;
Sensors pc50;
Sensors pc51;
Sensors pc52;

Date lastFetch; 

void settings() {
  size(1600, 900);
  bg = loadImage("http://i.imgur.com/C003l4P.jpg");
  
  //Level 00
  pc35 = new Sensors("people", "+PC00.05", 104, 197);
  pc36 = new Sensors("people", "+PC00.06", 276, 303);
  pc37 = new Sensors("people", "+PC00.07", 374, 80);
  pc38 = new Sensors("people", "+PC00.08", 365, 227);
  pc39 = new Sensors("people", "+PC00.09", 368, 313);
  //Level 2/3
  pc40 = new Sensors("people", "+PC03.17", 856, 301);
  pc41 = new Sensors("people", "+PC02.16", 1117, 269);
  pc42 = new Sensors("people", "+PC02.15", 1351, 180);
  pc43 = new Sensors("people", "+PC02.14", 1454, 330);
  //Level 4
  pc44 = new Sensors("people", "+PC04.20", 359, 681);
  pc45 = new Sensors("people", "+PC05.21", 741, 765);
  pc46 = new Sensors("people", "+PC05.22", 936, 678);
  pc47 = new Sensors("people", "+PC05.23", 1027, 589);
  pc48 = new Sensors("people", "+PC05.24", 1152, 720);
  pc49 = new Sensors("people", "+PC08.25", 1224, 574);
  pc50 = new Sensors("people", "+PC09.26", 1265, 733);
  
  file = new SoundFile(this, "RADAR.wav");
  lastFetch = new Date();
}

void draw() {
  background(bg);
  
  fetch();
  pc35.display();
  pc35.checkSensor();
  pc36.display();
  pc36.checkSensor();
  pc37.display();
  pc37.checkSensor();
  pc38.display();
  pc38.checkSensor();
  pc39.display();
  pc39.checkSensor();
  pc40.display();
  pc40.checkSensor();
  pc41.display();
  pc41.checkSensor();
  pc42.display();
  pc42.checkSensor();
  pc43.display();
  pc43.checkSensor();
  pc44.display();
  pc44.checkSensor();
  pc45.display();
  pc45.checkSensor();
  pc46.display();
  pc46.checkSensor();
  pc47.display();
  pc47.checkSensor();
  pc48.display();
  pc48.checkSensor();
  pc49.display();
  pc49.checkSensor();
  pc50.display();
  pc50.checkSensor();
}

void fetch() {
  long diff = new Date().getTime() - lastFetch.getTime();
  long seconds = TimeUnit.MILLISECONDS.toSeconds(diff);
  
  if(seconds > 30) {
    pc35.getData();
    pc36.getData();
    pc37.getData();
    pc38.getData();
    pc39.getData();
    pc40.getData();
    pc41.getData();
    pc42.getData();
    pc43.getData();
    pc44.getData();
    pc45.getData();
    pc46.getData();
    pc47.getData();
    pc48.getData();
    pc49.getData();
    pc50.getData();
    
    lastFetch = new Date();
  }
}

void mousePressed(){

}
