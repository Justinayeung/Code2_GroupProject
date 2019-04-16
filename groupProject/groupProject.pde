// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//https://processing.org/tutorials/text/
//https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles

//____________________________________________________________[VARIABLES]
Table airData;
float bronx;
float brooklyn;
float queens;
float central_harlem;
float east_harlem;
float upperW;
float upperE;
float chelsea;
float gramercy_murray;
float greenwich_soho;
float union_lowerE;
float lower_manhattan;

String message0, message1, message2, message3, message4, message5, message6, message7, message8, message9, message10, message11 = "";
float life;
//________________________________________________Health

//________________________________________health
float xPos;
float yPos;
int boxSize = 20;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
PImage body;

PImage NYMap;

//________________________________________pollution
ArrayList<Pollution> pollution;

//____________________________________________________________[SETUP FUNCTION]
void setup() {
  size(1200, 750);

//________________________________________health
  xPos = width/12;
  yPos = height/2;
  rectMode(RADIUS); 
  //drawing
  body = loadImage("body.png");
  body.resize(250, 400);

//________________________________________table
  airData = loadTable("Air_Quality.csv", "header");
  
  bronx = airData.getFloat(0, "data_");
  brooklyn = airData.getFloat(1, "data_");
  queens = airData.getFloat(2, "data_");
  central_harlem = airData.getFloat(3, "data_");
  east_harlem = airData.getFloat(4, "data_");
  upperW = airData.getFloat(5, "data_");
  upperE = airData.getFloat(6, "data_");
  chelsea = airData.getFloat(7, "data_");
  gramercy_murray = airData.getFloat(8, "data_");
  greenwich_soho = airData.getFloat(9, "data_");
  union_lowerE = airData.getFloat(10, "data_");
  lower_manhattan = airData.getFloat(11, "data_");
  message0 = "BRONX";
  message1 = "BROOKLYN";
  message2 = "QUEENS";
  message3 = "CENTRAL HARLEM";
  message4 = "EAST HARLEM";
  message5 = "UPPER WEST SIDE";
  message6 = "UPPER EAST SIDE";
  message7 = "CHELSEA";
  message8 = "GRAMERCY MURRAY";
  message9 = "GREENIWICH VILLAGE";
  message10 = "UNION SQUARE";
  message11 = "LOWER MANHATTAN";

  NYMap = loadImage("NYMap.png");

//________________________________________pollution
  pollution = new ArrayList<Pollution>();
}

//____________________________________________________________[DRAW FUNCTION]
void draw() { 
  background(220, 10, 100);
  fill(0);
  image(body,xPos, yPos - 300);
  showingPercentageBox();
  Cross();
  movingNeedle();
  image(NYMap, 450, 0, 750, 750);
  for (int i = 0; i < pollution.size(); i++) {
    Pollution p = pollution.get(i);
    p.addLetters();
    p.drawLetters();
    //pollution.add(new Pollution(200, 200, bronx, message0));
    //pollution.add(new Pollution(600, 500, brooklyn, message1));
    //pollution.add(new Pollution(x, y, queens, message2));
    //pollution.add(new Pollution(x, y, central_harlem, message3));
    //pollution.add(new Pollution(x, y, east_harlem, message4));
    //pollution.add(new Pollution(x, y, upperW, message5));
    //pollution.add(new Pollution(x, y, upperE, message6));
    //pollution.add(new Pollution(x, y, chelsea, message7));
    //pollution.add(new Pollution(x, y, gramercy_murray, message8));
    //pollution.add(new Pollution(x, y, greenwich_soho, message9));
    //pollution.add(new Pollution(x, y, union_lowerE, message10));
    //pollution.add(new Pollution(x, y, lower_manhattan, message11));
  }
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
//________________________________________Percentage Box
void showingPercentageBox(){
  fill(255,122,122);
  rect( xPos + 125, yPos - 65, 96, 120);
}
//_____________________________________________________________needle
void movingNeedle(){
  rect(xPos + 250, yPos + 325, boxSize/6, boxSize/2);
  rect(xPos + 250, yPos + 280, boxSize, (boxSize * 2 )-2);
}

//____________________________________________________________[MOUSEPRESSED FUNCTION]
void mousePressed() {
  if(mouseX > xPos - boxSize && mouseX < xPos + boxSize && 
      mouseY > yPos - boxSize * 2 && mouseY < yPos + boxSize * 2) { 
    locked = true; 
  } else {
    locked = false;
  }
  
  //needle
  if(mouseX > xPos + 250 - boxSize/2 && mouseX < xPos + boxSize/2 && 
      mouseY > yPos - boxSize && mouseY < yPos + boxSize){
        locked = true; 
       } else {
        locked = false;
      }
  
  xOffset = mouseX - xPos; 
  yOffset = mouseY - yPos; 
}

//____________________________________________________________[MOUSEDRAGGED FUNCTION]
void mouseDragged() {
  if(locked) {
    xPos = mouseX - xOffset; 
    yPos = mouseY - yOffset; 
  }
}

//____________________________________________________________[MOUSERELEASED FUNCTION]
void mouseReleased() {
  locked = false;
}
