// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//https://processing.org/tutorials/text/
//https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles

//____________________________________________________________[VARIABLES]
Table airData;

float xPos;
float yPos;
float xNeedle, yNeedle;
int boxSize = 20;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
PImage body;

PImage NYMap;

ArrayList<Pollution> pollutions;
String message0 = "BRONX";
String message1 = "BROOKLYN";
String message2 = "QUEENS";
String message3 = "CENTRAL HARLEM";
String message4 = "EAST HARLEM";
String message5 = "UPPER WEST SIDE";
String message6 = "UPPER EAST SIDE";
String message7 = "CHELSEA";
String message8 = "GRAMERCY MURRAY";
String message9 = "GREENWICH VILLAGE";
String message10 = "UNION SQUARE";
String message11 = "LOWER MANHATTAN";
float bronxLife, brooklynLife, queensLife, central_harlemLife, east_harlemLife, upperWLife, upperELife, chelseaLife, gramercy_murrayLife, greenwich_sohoLife, union_lowerELife, lower_manhattanLife;
String instruction = "Drag The Needle To See Details";

//ArrayList<Pollution> pollution;

//____________________________________________________________[SETUP FUNCTION]
void setup() {
  size(1200, 750);

  xPos = width/12;
  yPos = height/2;
  
  xNeedle = width/12 + 250;
  yNeedle = height/2 + 280;
  rectMode(RADIUS); 
  //drawing
  body = loadImage("body.png");
  body.resize(250, 400);
  
  NYMap = loadImage("NYMap.png");

  pollutions = new ArrayList<Pollution>();
  airData = loadTable("Air_Quality.csv", "header");
  bronxLife = airData.getFloat(0, "data_");
  brooklynLife = airData.getFloat(1, "data_");
  queensLife = airData.getFloat(2, "data_");
  central_harlemLife = airData.getFloat(3, "data_");
  east_harlemLife = airData.getFloat(4, "data_");
  upperWLife = airData.getFloat(5, "data_");
  upperELife = airData.getFloat(6, "data_");
  chelseaLife = airData.getFloat(7, "data_");
  gramercy_murrayLife = airData.getFloat(8, "data_");
  greenwich_sohoLife = airData.getFloat(9, "data_");
  union_lowerELife = airData.getFloat(10, "data_");
  lower_manhattanLife = airData.getFloat(11, "data_");
  
  pollutions.add(new Pollution(1020, 170, bronxLife, message0));
  pollutions.add(new Pollution(860, 640, brooklynLife, message1));
  pollutions.add(new Pollution(1065, 523, queensLife, message2));
  pollutions.add(new Pollution(850, 260, central_harlemLife, message3));
  pollutions.add(new Pollution(865, 325, east_harlemLife, message4));
  pollutions.add(new Pollution(780, 370, upperWLife, message5));
  pollutions.add(new Pollution(830, 410, upperELife, message6));
  pollutions.add(new Pollution(730, 490, chelseaLife, message7));
  pollutions.add(new Pollution(775, 520, gramercy_murrayLife, message8));
  pollutions.add(new Pollution(725, 545, greenwich_sohoLife, message9));
  pollutions.add(new Pollution(751, 525, union_lowerELife, message10));
  pollutions.add(new Pollution(742, 588, lower_manhattanLife, message11));
}

//____________________________________________________________[DRAW FUNCTION]
void draw() { 
  background(220, 10, 100);
  fill(0);
  image(body,xPos, yPos - 300);
  showingPercentageBox();
  Cross();
  textSize(10);
  image(NYMap, 450, 0, 750, 750);
  for (int i = 0; i < pollutions.size(); i++) {
    Pollution p = pollutions.get(i);
    p.addLetters();
    p.drawLetters();
  }
  Banner();
  movingNeedle();
}

//____________________________________________________________[CROSS CLASS]
void Cross(){
  //white box(decoration)
  fill(0);
  rect( xPos + 125, yPos - 30, 81, 81);
  fill(255);
  rect(xPos + 125, yPos - 30, 75, 75);
  // cross
  fill(0);
  noStroke();
  rect(xPos + 125, yPos - 20, 16, 40);
  rect(xPos + 125, yPos - 20, 40, 16);
  //poles
  rect(70, height/2 + 15, 10, 350);
  rect(210, 45, 150, 9);
  //a string
  strokeWeight(3);
  fill(0);
  ellipse(xPos + 125, yPos - 310, 8, 40);
  // base
  rect(width/4 - 70, height - 7, 190, 15);
}
//_________________________________________________________Percentage Box
void showingPercentageBox(){
  pushMatrix();
  translate(xPos + 125, yPos - 65);
  fill(255,122,122);
  rect( 0, 0, 96, 120);
  popMatrix();
}
//__________________________________________________________________needle
void movingNeedle(){
  color c1 = color(#C4C3D0);
  fill(c1);
  rect(xNeedle, yNeedle + 45, boxSize/7, boxSize/1.2);
  fill(0);
  rect(xNeedle, yNeedle, boxSize, boxSize * 2);
}
//__________________________________________________________________Banner 
void Banner(){
  color b2 = color(#d4b8cd);
  fill(b2);
  for ( int i = 0; i < height; i = i + 28){
    rect(width/2 - 90, i + 11, 64, 11);
  }
  color b1 = color(#a8709a);
  fill(b1);
  rect(width/2 - 90, height/2, 60, height);
  
  pushMatrix();
  translate(width/2 - 108, height/15 - 10);
  rotate(radians(90));
  fill(b2);
  textSize(45);
  text(instruction, 0, 0);
  popMatrix();
}

//____________________________________________________________[MOUSEPRESSED FUNCTION]
void mousePressed() {
  //needle
  if(mouseX > (xNeedle - boxSize/2) && mouseX < (xNeedle + boxSize/2) && 
      mouseY > (yNeedle - boxSize * 2) && mouseY < (yNeedle + boxSize * 2)){
        locked = true; 
       } else {
        locked = false;
      }
  println(locked);
  xOffset = mouseX - xNeedle; 
  yOffset = mouseY - yNeedle; 
}

//____________________________________________________________[MOUSEDRAGGED FUNCTION]
void mouseDragged() {
  if(locked == true) {
    xNeedle = mouseX - xOffset; 
    yNeedle = mouseY - yOffset; 
  }
}

//____________________________________________________________[MOUSERELEASED FUNCTION]
void mouseReleased() {
  locked = false;
}
