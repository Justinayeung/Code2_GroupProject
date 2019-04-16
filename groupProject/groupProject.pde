// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//https://processing.org/tutorials/text/
//https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles

//____________________________________________________________[VARIABLES]
Table airData;

float xPos;
float yPos;
int boxSize = 20;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
PImage body;

PImage NYMap;

ArrayList<Pollution> pollution;

//____________________________________________________________[SETUP FUNCTION]
void setup() {
  size(1200, 750);

  xPos = width/12;
  yPos = height/2;
  rectMode(RADIUS); 
  //drawing
  body = loadImage("body.png");
  body.resize(250, 400);
  
  NYMap = loadImage("NYMap.png");

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
