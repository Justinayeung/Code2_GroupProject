// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//https://processing.org/tutorials/text/
//https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles

  /*
  good = 0 - 50 (#24e228);
  moderate = 51 -100 (#fffd38);
  unhealthyForSensitiveGroups = 101 - 150 (#fd7e23);
  unhealthy = 151 - 200 (#fc0d1b);
  veryUnhealthy = 201 - 300 (#8e4295);
  harzardous = 301 - 500 (#7d0425);
  */
  

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

boolean overBronx = false;
boolean overBrooklyn = false; 
boolean overQueens = false;
boolean overCentralHarlem = false;
boolean overEastHarlem = false;
boolean overUpperWestSide = false;
boolean overUpperEastSide = false; 
boolean overChelsea = false;
boolean overGramercyMurray = false;
boolean overGreenwichVillage = false;
boolean overUnionSquare = false;
boolean overLowerManhattan = false;

//float bronxPercentage = 0;
//float brooklynPercentage = 0;
//float queensPercentage = 0;
//float centralHarlemPercentage = 0;
//float eastHarlemPercentage = 0;
//float upperWestSidePercentage = 0;
//float upperEastSidePercentage = 0;
//float chelseaPercentage = 0;
//float gramercyMurrayPercentage = 0;
//float greenwichVillagePercentage = 0;
//float unionSquarePercentage = 0;
//float lowerManhattanPercentage = 0;

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
float bronxAPH, brooklynAPH, queensAPH, central_harlemAPH, east_harlemAPH, upperWAPH, upperEAPH, chelseaAPH, gramercy_murrayAPH, greenwich_sohoAPH, union_lowerEAPH, lower_manhattanAPH;
String instruction = "Drag The Needle To See Details";

String bronx = "BRONX : \nTotal NOx Emissions = 42.7 \n Good";
String brooklyn = "BROOKLYN : \nTotal NOx Emissions = 22.8 \n Good";
String queens = "QUEENS : \nTotal NOx Emissions = 16.1 \n Good";
String central_harlem = "CENTRAL HARLEM : \nTotal NOx Emissions = 82.1 \n Moderate";
String east_harlem = "EAST HARLEM : \nTotal NOx Emissions = 55.8 \n Moderate";
String upperW = "UPPER WEST SIDE : \nTotal NOx Emissions = 247.9 \n Very Unhealthy";
String upperE = "UPPER EAST SIDE : \nTotal NOx Emissions = 269.8 \n Very Unhealthy";
String chelsea = "CHELSEA : \nTotal NOx Emissions = 204.8 \n Very Unhealthy";
String gramercy_murray = "GRAMERCY MURRAY : \nTotal NOx Emissions = 284.7 \n Very Unhealthy";
String greenwich = "GREENWICH VILLAGE : \nTotal NOx Emissions = 132.5 \n Unhealthy for Sensitive Groups";
String union = "UNION SQUARE : \nTotal NOx Emissions = 126.1 \n Unhealthy for Sensitive Groups";
String lower_manhattan = "LOWER MANHATTAN : \nTotal NOx Emissions = 118.7 \n Unhealthy for Sensitive Groups";

color good, moderate, unhealthyForSensitiveGroups, unhealthy, veryUnhealthy, harzardous;

//____________________________________________________________region PShapes
PShape Bronx_Shape;
PShape CentralHarlem_Shape;
PShape EastHarlem_Shape;
PShape UpperWestSide_Shape;
PShape UpperEastSide_Shape;
PShape Chelsea_Shape;
PShape GramercyPark_Shape;
PShape UnionSquare_Shape;
PShape GreenwichVillage_Shape;
PShape LowerManhattan_Shape;
PShape Queens_Shape;
PShape Brooklyn_Shape;


//____________________________________________________________[SETUP FUNCTION]
void setup() {
  size(1200, 750);
  xPos = width/12;
  yPos = height/2;
  xNeedle = width/12 + 125;
  yNeedle = height/2 + 138;
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

  bronxAPH = airData.getFloat(12, "data_");
  brooklynAPH = airData.getFloat(13, "data_");
  queensAPH = airData.getFloat(14, "data_");
  central_harlemAPH = airData.getFloat(15, "data_");
  east_harlemAPH = airData.getFloat(16, "data_");
  upperWAPH = airData.getFloat(17, "data_");
  upperEAPH = airData.getFloat(18, "data_");
  chelseaAPH = airData.getFloat(19, "data_");
  gramercy_murrayAPH = airData.getFloat(20, "data_");
  greenwich_sohoAPH = airData.getFloat(21, "data_");
  union_lowerEAPH = airData.getFloat(22, "data_");
  lower_manhattanAPH = airData.getFloat(23, "data_");
  
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
  
  good = color(#24e228);
  moderate = color(#fffd38);
  unhealthyForSensitiveGroups = color(#F76502);
  unhealthy = color(#fc0d1b);
  veryUnhealthy = color(#8e4295);
  harzardous = color(#7d0425);

    //for (TableRow row : airData.rows()) {

    ////int id = row.getInt("EventID");
    //float data = row.getFloat("data_");


    //switch(data) {
    //case "Bronx":
    //  bronxPercentage++;
    //  break;
    //case "Brooklyn":
    //  brooklynPercentage++;
    //  break;
    //case "Queens":
    //  queensPercentage++;
    //  break;
    //case "Central Harlem":
    //  centralHarlemPercentage++;
    //  break;
    //case "East Harlem":
    //  eastHarlemPercentage++;
    //  break;
    //case "Upper West Side":
    //  upperWestSidePercentage++;
    //  break;
    //case "Upper East Side":
    //  upperEastSidePercentage++;
    //  break;
    //case "Chelsea":
    //  chelseaPercentage++;
    //  break;
    //case "Gramercy Murray":
    //  gramercyMurrayPercentage++;
    //  break;
    //case "Greenwich Village":
    //  greenwichVillagePercentage++;
    //  break;
    //case "Union Square":
    //  unionSquarePercentage++;
    //  break;
    //case "Lower Manhattan":
    //  lowerManhattanPercentage++;
    //  break;
    //}
    
    
  // }

//____________________________________________________________region PShapes
  Bronx_Shape = createShape();
  Bronx_Shape.beginShape();
  Bronx_Shape.noStroke();
  Bronx_Shape.vertex(937, 25);
  Bronx_Shape.vertex(1200, 119);
  Bronx_Shape.vertex(1182, 345);
  Bronx_Shape.vertex(935, 380);
  Bronx_Shape.vertex(888, 349);
  Bronx_Shape.vertex(884, 264);
  Bronx_Shape.vertex(946, 148);
  Bronx_Shape.vertex(906, 132);
  Bronx_Shape.endShape(CLOSE);
  
  CentralHarlem_Shape = createShape();
  CentralHarlem_Shape.beginShape();
  CentralHarlem_Shape.noStroke();
  CentralHarlem_Shape.vertex(905,140);
  CentralHarlem_Shape.vertex(935,155);
  CentralHarlem_Shape.vertex(878,262);
  CentralHarlem_Shape.vertex(880,318);
  CentralHarlem_Shape.vertex(844,379);
  CentralHarlem_Shape.vertex(828,370);
  CentralHarlem_Shape.vertex(813,397);
  CentralHarlem_Shape.vertex(787,383);
  CentralHarlem_Shape.endShape(CLOSE);
  
  EastHarlem_Shape = createShape();
  EastHarlem_Shape.beginShape();
  EastHarlem_Shape.noStroke();
  EastHarlem_Shape.vertex(880,326);
  EastHarlem_Shape.vertex(882,352);
  EastHarlem_Shape.vertex(894,372);
  EastHarlem_Shape.vertex(892,387);
  EastHarlem_Shape.vertex(861,421);
  EastHarlem_Shape.vertex(834,410);
  EastHarlem_Shape.endShape(CLOSE);
  
  UpperWestSide_Shape = createShape();
  UpperWestSide_Shape.beginShape();
  UpperWestSide_Shape.noStroke();
  UpperWestSide_Shape.vertex(785,389);
  UpperWestSide_Shape.vertex(809,403);
  UpperWestSide_Shape.vertex(775,466);
  UpperWestSide_Shape.vertex(749,453);
  UpperWestSide_Shape.vertex(772,401);
  UpperWestSide_Shape.vertex(785,389);
  UpperWestSide_Shape.endShape(CLOSE);
  
  UpperEastSide_Shape = createShape();
  UpperEastSide_Shape.beginShape();
  UpperEastSide_Shape.noStroke();
  UpperEastSide_Shape.vertex(832,414);
  UpperEastSide_Shape.vertex(861,429);
  UpperEastSide_Shape.vertex(864,445);
  UpperEastSide_Shape.vertex(829,495);
  UpperEastSide_Shape.vertex(798,478);
  UpperEastSide_Shape.endShape(CLOSE);
  
  Chelsea_Shape = createShape();
  Chelsea_Shape.beginShape();
  Chelsea_Shape.noStroke();
  Chelsea_Shape.vertex(724,496);
  Chelsea_Shape.vertex(764,519);
  Chelsea_Shape.vertex(740,560);
  Chelsea_Shape.vertex(713,544);
  Chelsea_Shape.vertex(712,518);
  Chelsea_Shape.endShape(CLOSE);
  
  GramercyPark_Shape = createShape();
  GramercyPark_Shape.beginShape();
  GramercyPark_Shape.noStroke();
  GramercyPark_Shape.vertex(764,535);
  GramercyPark_Shape.vertex(789,552);
  GramercyPark_Shape.vertex(772,579);
  GramercyPark_Shape.vertex(761,573);
  GramercyPark_Shape.vertex(771,556);
  GramercyPark_Shape.vertex(757,547);
  GramercyPark_Shape.endShape(CLOSE);
  
  UnionSquare_Shape = createShape();
  UnionSquare_Shape.beginShape();
  UnionSquare_Shape.noStroke();
  UnionSquare_Shape.vertex(753,550);
  UnionSquare_Shape.vertex(763,556);
  UnionSquare_Shape.vertex(756,569);
  UnionSquare_Shape.vertex(746,563);
  UnionSquare_Shape.endShape(CLOSE);
  
  GreenwichVillage_Shape = createShape();
  GreenwichVillage_Shape.beginShape();
  GreenwichVillage_Shape.noStroke();
  GreenwichVillage_Shape.vertex(713,550);
  GreenwichVillage_Shape.vertex(754,576);
  GreenwichVillage_Shape.vertex(752,587);
  GreenwichVillage_Shape.vertex(739,605);
  GreenwichVillage_Shape.vertex(728,595);
  GreenwichVillage_Shape.vertex(708,593);
  GreenwichVillage_Shape.endShape(CLOSE);
  
  LowerManhattan_Shape = createShape();
  LowerManhattan_Shape.beginShape();
  LowerManhattan_Shape.noStroke();
  LowerManhattan_Shape.vertex(707,598);
  LowerManhattan_Shape.vertex(725,599);
  LowerManhattan_Shape.vertex(739,611);
  LowerManhattan_Shape.vertex(757,590);
  LowerManhattan_Shape.vertex(790,609);
  LowerManhattan_Shape.vertex(782,640);
  LowerManhattan_Shape.vertex(736,647);
  LowerManhattan_Shape.vertex(712,667);
  LowerManhattan_Shape.vertex(698,667);
  LowerManhattan_Shape.vertex(695,651);
  LowerManhattan_Shape.endShape(CLOSE);
  
  Queens_Shape = createShape();
  Queens_Shape.beginShape();
  Queens_Shape.noStroke();
  Queens_Shape.vertex(1089,741);
  Queens_Shape.vertex(1081,701);
  Queens_Shape.vertex(1064,707);
  Queens_Shape.vertex(1061,679);
  Queens_Shape.vertex(1030,667);
  Queens_Shape.vertex(1008,689);
  Queens_Shape.vertex(1001,686);
  Queens_Shape.vertex(989,695);
  Queens_Shape.vertex(919,627);
  Queens_Shape.vertex(904,587);
  Queens_Shape.vertex(882,579);
  Queens_Shape.vertex(871,561);
  Queens_Shape.vertex(837,543);
  Queens_Shape.vertex(821,558);
  Queens_Shape.vertex(830,527);
  Queens_Shape.vertex(878,444);
  Queens_Shape.vertex(939,402);
  Queens_Shape.vertex(1080,491);
  Queens_Shape.vertex(1053,415);
  Queens_Shape.vertex(1146,370);
  Queens_Shape.vertex(1200,387);
  Queens_Shape.vertex(1200,739);
  Queens_Shape.endShape(CLOSE);
  
  Brooklyn_Shape = createShape();
  Brooklyn_Shape.beginShape();
  Brooklyn_Shape.noStroke();
  Brooklyn_Shape.vertex(692,739);
  Brooklyn_Shape.vertex(723,713);
  Brooklyn_Shape.vertex(742,667);
  Brooklyn_Shape.vertex(778,656);
  Brooklyn_Shape.vertex(797,678);
  Brooklyn_Shape.vertex(798,657);
  Brooklyn_Shape.vertex(826,600);
  Brooklyn_Shape.vertex(821,570);
  Brooklyn_Shape.vertex(835,553);
  Brooklyn_Shape.vertex(862,567);
  Brooklyn_Shape.vertex(875,586);
  Brooklyn_Shape.vertex(895,593);
  Brooklyn_Shape.vertex(910,630);
  Brooklyn_Shape.vertex(986,704);
  Brooklyn_Shape.vertex(1002,695);
  Brooklyn_Shape.vertex(1010,697);
  Brooklyn_Shape.vertex(1033,674);
  Brooklyn_Shape.vertex(1053,683);
  Brooklyn_Shape.vertex(1057,717);
  Brooklyn_Shape.vertex(1078,710);
  Brooklyn_Shape.vertex(1083,740);
  Brooklyn_Shape.endShape(CLOSE);
}

//____________________________________________________________[DRAW FUNCTION]
void draw() { 
  if(xNeedle > 956 && xNeedle < 1113 && yNeedle + 55 > 139 && yNeedle + 55 < 278){
      overBronx = true;
    }else {
      overBronx = false;
    }
  if(xNeedle > 806 && xNeedle < 930 && yNeedle + 55 > 650 && yNeedle + 55 < 735){
      overBrooklyn = true;
    }else {
      overBrooklyn = false;
    }
  if(xNeedle > 936 && xNeedle < 1190 && yNeedle + 55 > 500 && yNeedle + 55 < 625){
      overQueens = true;
    }else {
      overQueens = false;
    }
  if(xNeedle > 832 && xNeedle < 868 && yNeedle + 55 > 289 && yNeedle + 55 < 337){
      overCentralHarlem = true;
    }else {
      overCentralHarlem = false;
    }
  if(xNeedle > 852 && xNeedle < 890 && yNeedle + 55 > 361 && yNeedle + 55 < 399){
      overEastHarlem = true;
    }else {
      overEastHarlem = false;
    }
  if(xNeedle > 765 && xNeedle < 798 && yNeedle + 55 > 398 && yNeedle + 55 < 455){
      overUpperWestSide = true;
    }else {
      overUpperWestSide = false;
    }
  if(xNeedle > 814 && xNeedle < 853 && yNeedle + 55 > 430 && yNeedle + 55 < 486){
      overUpperEastSide = true;
    }else {
      overUpperEastSide = false;
    }
  if(xNeedle > 713 && xNeedle < 750 && yNeedle + 55 > 507 && yNeedle + 55 < 541){
      overChelsea = true;
    }else {
      overChelsea = false;
    }
  if(xNeedle > 769 && xNeedle < 799 && yNeedle + 55 > 542 && yNeedle + 55 < 578){
      overGramercyMurray = true;
    }else {
      overGramercyMurray = false;
    }
  if(xNeedle > 707 && xNeedle < 746 && yNeedle + 55 > 565 && yNeedle + 55 < 594){
      overGreenwichVillage = true;
    }else {
      overGreenwichVillage = false;
    }
  if(xNeedle > 749 && xNeedle < 761 && yNeedle + 55 > 552 && yNeedle + 55 < 568){
      overUnionSquare = true;
    }else {
      overUnionSquare = false;
    }
  if(xNeedle > 705 && xNeedle < 782 && yNeedle + 55 > 608 && yNeedle + 55 < 653){
      overLowerManhattan = true;
    }else {
      overLowerManhattan = false;
    }
  background(227, 145, 174);  //228, 100, 130 //220, 10, 100 //228, 94, 157 //227, 138, 174 
  fill(0);
  image(body,xPos, yPos - 300);
//_____________________________________________________________showingPercentageBox();
  showingPercentageBox(); 
  
//___________________________________________________________________
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
  
  println (mouseX +"," + mouseY);
  
  //println (mouseX +", " + mouseY);
//____________________________________________________________region PShapes
  //shape(Bronx_Shape);
  //shape(CentralHarlem_Shape);
  //shape(EastHarlem_Shape);
  //shape(UpperWestSide_Shape);
  //shape(UpperEastSide_Shape);
  //shape(Chelsea_Shape);
  //shape(GramercyPark_Shape);
  //shape(UnionSquare_Shape);
  //shape(GreenwichVillage_Shape);
  //shape(LowerManhattan_Shape);
  //shape(Queens_Shape);
  //shape(Brooklyn_Shape);
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
  float textYPos = 180;
  
  if(overBronx == true){
    fill(good);
    rect(xPos + 125, yPos +36, 96, bronxLife * .5);
    textSize(25);
    text(bronx,xPos, yPos + textYPos);
  }
  if(overBrooklyn == true){
    fill(good);
    rect(xPos + 125, yPos + 45, 96, brooklynLife * .5);
    textSize(25);
    text(brooklyn,xPos, yPos + textYPos);
  }
  if(overQueens == true){
    fill(good);
    rect(xPos + 125, yPos + 49, 96, queensLife * .5);
    textSize(25);
    text(queens,xPos, yPos + textYPos);
  }
  if(overCentralHarlem == true){
    fill(moderate);
    rect(xPos + 125, yPos + 15, 96, central_harlemLife * .5);
    textSize(25);
    text(central_harlem,xPos, yPos + textYPos);
  }
  if(overEastHarlem == true){
    fill(moderate);
    rect(xPos + 125, yPos + 29, 96, east_harlemLife * .5);
    textSize(25);
    text(east_harlem,xPos, yPos + textYPos);
  }
  if(overUpperWestSide == true){
    fill(veryUnhealthy);
    rect(xPos + 125, yPos - 65, 96, upperWLife * .5);
    textSize(25);
    text(upperW,xPos, yPos + textYPos);
  }
  if(overUpperEastSide == true){
    fill(veryUnhealthy);
    rect(xPos + 125, yPos - 77, 96, upperELife * .5);
    textSize(25);
    text(upperE,xPos, yPos + textYPos);
  }
  if(overChelsea == true){
    fill(veryUnhealthy);
    rect(xPos + 125, yPos - 45, 96, chelseaLife * .5);
    textSize(25);
    text(chelsea,xPos, yPos + textYPos);
  }
  if(overGramercyMurray == true){
    fill(veryUnhealthy);
    rect(xPos + 125, yPos - 85, 96,  gramercy_murrayLife * .5);
    textSize(25);
    text(gramercy_murray,xPos, yPos + textYPos);
  }
  if(overGreenwichVillage == true){
    fill(unhealthyForSensitiveGroups);
    rect(xPos + 125, yPos - 9, 96, greenwich_sohoLife * .5);
    textSize(25);
    text(greenwich,xPos, yPos + textYPos);
  }
  if(overUnionSquare == true){
    fill(unhealthyForSensitiveGroups);
    rect(xPos + 125, yPos - 6, 96, union_lowerELife * .5);
    textSize(25);
    text(union,xPos, yPos + textYPos);
  }
  if(overLowerManhattan == true){
    fill(unhealthyForSensitiveGroups);
    rect(xPos + 125, yPos - 2, 96, lower_manhattanLife * .5);
    textSize(25);
    text(lower_manhattan,xPos, yPos + textYPos);
  }
  
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
      
  //println(locked);
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
