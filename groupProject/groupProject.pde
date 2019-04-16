//// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
////https://processing.org/tutorials/text/
////https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles

////____________________________________________________________[VARIABLES]
//Table airData;
//float bronx;
//float brooklyn;
//float queens;
//float central_harlem;
//float east_harlem;
//float upperW;
//float upperE;
//float chelsea;
//float gramercy_Murray;
//float greenwich_Soho;
//float union_LowerE;
//float lower_Manhattan;

//String message = "";
//float life;
//float x;
//float y;

////________________________________________health
//float xPos;
//float yPos;
//int boxSize = 20;
//boolean locked = false;
//float xOffset = 0.0; 
//float yOffset = 0.0; 
//PImage body;

//PImage NYMap;

////________________________________________pollution
//ArrayList<Pollution> pollution;

////____________________________________________________________[SETUP FUNCTION]
//void setup() {
//  size(1200, 750);

////________________________________________health
//  xPos = width/12;
//  yPos = height/2;
//  rectMode(RADIUS); 
//  //drawing
//  body = loadImage("body.png");
//  body.resize(250, 400);
  
////________________________________________table
//  airData = loadTable("Air_Quality.csv", "header");
//  for(TableRow row : airData.rows())
//  {
//    float data = row.getFloat("data_");
//    String location = row.getString("location_");
//    String type = row.getString("type_");
    
//    switch(location)
//    {
//      case "Bronx":
//        bronx = airData.getFloat(0, "data_");
//        message = "BRONX";
//        bronx = life;
//        xPos = 500;
//        yPos = 500;
//        //println(airData.getFloat(0, "data_"));
//        println(bronx);
//        break;
//      case "Brooklyn":
//        brooklyn = airData.getFloat(1, "data_");
//        message = "BROOKLYN";
//        brooklyn = life;
//        //println(airData.getFloat(1, "data_"));
//        break;
//      case "Queens":
//        queens = airData.getFloat(2, "data_");
//        message = "QUEENS";
//        queens = life;
//        //println(airData.getFloat(2, "data_"));
//        break;
//      case "Central Harlem - Morningside Heights":
//        central_harlem = airData.getFloat(3, "data_");
//        message = "CENTRAL HARLEM";
//        central_harlem = life;
//        //println(airData.getFloat(3, "data_"));
//        break;
//      case "East Harlem":
//        east_harlem = airData.getFloat(4, "data_");
//        message = "EAST HARLEM";
//        east_harlem = life;
//        //println(airData.getFloat(4, "data_"));
//        break;
//      case "Upper West Side":
//        upperW = airData.getFloat(5, "data_");
//        message = "UPPER WEST SIDE";
//        upperW = life;
//        //println(airData.getFloat(5, "data_"));
//        break;
//      case "Upper East Side":
//        upperE = airData.getFloat(6, "data_");
//        message = "UPPER EAST SIDE";
//        upperE = life;
//        //println(airData.getFloat(6, "data_"));
//        break;
//      case "Chelsea":
//        chelsea = airData.getFloat(7, "data_");
//        message = "CHELSEA";
//        chelsea = life;
//        //println(airData.getFloat(7, "data_"));
//        break;
//      case "Gramercy Park - Murray Hill":
//        gramercy_Murray = airData.getFloat(8, "data_");
//        message = "GRAMERCY MURRAY";
//        gramercy_Murray = life;
//        //println(airData.getFloat(8, "data_"));
//        break;
//      case "Greenwich Village - SoHo":
//        greenwich_Soho = airData.getFloat(9, "data_");
//        message = "GREENIWICH VILLAGE";
//        greenwich_Soho = life;
//        //println(airData.getFloat(9, "data_"));
//        break;
//      case "Union Square - Lower East Side":
//        union_LowerE = airData.getFloat(10, "data_");
//        message = "UNION SQUARE";
//        union_LowerE = life;
//        //println(airData.getFloat(10, "data_"));
//        break;
//      case "Lower Manhattan":
//        lower_Manhattan = airData.getFloat(11, "data_");
//        message = "LOWER MANHATTAN";
//        lower_Manhattan = life;
//        //println(airData.getFloat(11, "data_"));
//        break;
//    }
//  }
  
//  NYMap = loadImage("NYMap.png");

////________________________________________pollution
//  pollution = new ArrayList<Pollution>();
//}

////____________________________________________________________[DRAW FUNCTION]
//void draw() { 
//  background(220, 10, 100);
//  fill(0);
//  image(body,xPos, yPos - 300);
//  showingPercentageBox();
//  Cross();
//  image(NYMap, 450, 0, 750, 750);

//  for (int i = 0; i < pollution.size(); i++) {
//    Pollution p = pollution.get(i);
//    p.addLetters();
//    p.drawLetters();
//  }
//  pollution.add(new Pollution(x, y, life, message));
//  //pollution.add(new Pollution(x, y));
    
    
////________________________________________needle
//  movingNeedle();
//}

////____________________________________________________________[CROSS CLASS]
//void Cross(){
//  //white box(decoration)
//  fill(0);
//  rect( xPos + 125, yPos - 30, 81, 81);
//  fill(255);
//  rect(xPos + 125, yPos - 30, 75, 75);
//  // cross
//  fill(0);
//  noStroke();
//  rect(xPos + 125, yPos - 20, 16, 40);
//  rect(xPos + 125, yPos - 20, 40, 16);
//  //poles
//  rect(70, height/2 + 15, 10, 350);
//  rect(210, 45, 150, 9);
//  //a string
//  strokeWeight(3);
//  fill(0);
//  ellipse(xPos + 125, yPos - 310, 8, 40);
//  // base
//  rect(width/4 - 70, height - 7, 190, 15);
//}

//void showingPercentageBox(){
//  fill(255,122,122);
//  rect( xPos + 125, yPos - 65, 96, 120);
//}

//void movingNeedle(){
//  rect(xPos + 250, yPos + 325, boxSize/6, boxSize/2);
//  rect(xPos + 250, yPos + 280, boxSize, (boxSize * 2 )-2);
//}

////____________________________________________________________[MOUSEPRESSED FUNCTION]
//void mousePressed() {
//  if(mouseX > xPos - boxSize && mouseX < xPos + boxSize && 
//      mouseY > yPos - boxSize * 2 && mouseY < yPos + boxSize * 2) { 
//    locked = true; 
//  } else {
//    locked = false;
//  }
  
//  //needle
//  if(mouseX > xPos + 250 - boxSize/2 && mouseX < xPos + boxSize/2 && 
//      mouseY > yPos - boxSize && mouseY < yPos + boxSize){
//        locked = true; 
//       } else {
//        locked = false;
//      }
  
//  xOffset = mouseX - xPos; 
//  yOffset = mouseY - yPos; 

//}

////____________________________________________________________[MOUSEDRAGGED FUNCTION]
//void mouseDragged() {
//  if(locked) {
//    xPos = mouseX - xOffset; 
//    yPos = mouseY - yOffset; 
//  }
//}

////____________________________________________________________[MOUSERELEASED FUNCTION]
//void mouseReleased() {
//  locked = false;
//}

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
float Chelsea;
float Gramercy_Murray;
float Greenwich_Soho;
float Union_LowerE;
float Lower_Manhattan;

String message = "";
float life;
float x;
float y;
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
  for(TableRow row : airData.rows())
  {
    float data = row.getFloat ("data_");
    String location = row.getString("location_");
    String type = row.getString("type_");
    
    switch(location)
    {
      case "Bronx":
        bronx = airData.getFloat(0, "data_");
        message = "BRONX";
        bronx = life;
        xPos = 500;
        yPos = 500;
        //println(airData.getFloat(0, "data_"));
        println(bronx);
        break;
      case "Brooklyn":
        brooklyn = airData.getFloat(1, "data_");
        message = "BROOKLYN";
        brooklyn = life;
        //println(airData.getFloat(1, "data_"));
        break;
      case "Queens":
        queens = airData.getFloat(2, "data_");
        message = "QUEENS";
        queens = life;
        //println(airData.getFloat(2, "data_"));
        break;
      case "Central Harlem - Morningside Heights":
        central_harlem = airData.getFloat(3, "data_");
        message = "CENTRAL HARLEM";
        central_harlem = life;
        //println(airData.getFloat(3, "data_"));
        break;
      case "East Harlem":
        east_harlem = airData.getFloat(4, "data_");
        message = "EAST HARLEM";
        east_harlem = life;
        //println(airData.getFloat(4, "data_"));
        break;
      case "Upper West Side":
        upperW = airData.getFloat(5, "data_");
        message = "UPPER WEST SIDE";
        upperW = life;
        //println(airData.getFloat(5, "data_"));
        break;
      case "Upper East Side":
        upperE = airData.getFloat(6, "data_");
        message = "UPPER EAST SIDE";
        upperE = life;
        //println(airData.getFloat(6, "data_"));
        break;
      case "Chelsea":
        chelsea = airData.getFloat(7, "data_");
        message = "CHELSEA";
        chelsea = life;
        //println(airData.getFloat(7, "data_"));
        break;
      case "Gramercy Park - Murray Hill":
        gramercy_Murray = airData.getFloat(8, "data_");
        message = "GRAMERCY MURRAY";
        gramercy_Murray = life;
        //println(airData.getFloat(8, "data_"));
        break;
      case "Greenwich Village - SoHo":
        greenwich_Soho = airData.getFloat(9, "data_");
        message = "GREENIWICH VILLAGE";
        greenwich_Soho = life;
        //println(airData.getFloat(9, "data_"));
        break;
      case "Union Square - Lower East Side":
        union_LowerE = airData.getFloat(10, "data_");
        message = "UNION SQUARE";
        union_LowerE = life;
        //println(airData.getFloat(10, "data_"));
        break;
      case "Lower Manhattan":
        lower_Manhattan = airData.getFloat(11, "data_");
        message = "LOWER MANHATTAN";
        lower_Manhattan = life;
        //println(airData.getFloat(11, "data_"));
        break;
    }
  }

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
  image(NYMap, 450, 0, 750, 750);
  for (int i = 0; i < pollution.size(); i++) {
    Pollution p = pollution.get(i);
    p.addLetters();
    p.drawLetters();
  }

//________________________________________needle
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
void showingPercentageBox(){
  fill(255,122,122);
  rect( xPos + 125, yPos - 65, 96, 120);
}
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
