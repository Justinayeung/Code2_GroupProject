// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//https://processing.org/tutorials/text/
//https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles

Table airData;
int bronx;
int brooklyn;
int queens;
int central_harlem;
int east_harlem;
int upperW;
int upperE;
int Chelsea;
int Gramercy_Murray;
int Greenwich_Soho;
int Union_LowerE;
int Lower_Manhattan;
//________________________________________________Health
float xPos;
float yPos;
int boxSize = 20;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
PImage body;

PImage NYMap;

//________________________________________________Pollution
ArrayList<Pollution> pollution;

//________________________________________________Variables for Area Buttons
// Variables for Bronx Button
int BronxButton_X = 700;
int BronxButton_Y = 300;
int BronxButton_Size = 50;

void setup() {
  size(1200, 750);
  //________________________________________________Health
  xPos = 100;
  yPos = height/2;
  rectMode(RADIUS); 
  //rect(
  body = loadImage("body.png");
  body.resize(250, 400);
  //________________________________________________table
  airData = loadTable("Air_Quality.csv", "header");
  for(TableRow row : airData.rows())
  {
    int data = row.getInt("data_");
    
    String location = row.getString("location_");
    String type = row.getString("type_");
    
    switch(location)
    {
      case "Bronx":
        break;
      case "Brooklyn":
        break;
      case "Queens":
        break;
      case "Central Harlem - Morningside Heights":
        break;
      case "East Harlem":
        break;
      case "Upper West Side":
        break;
      case "Upper East Side":
        break;
      case "Chelsea":
        break;
      case "Gramercy Park - Murray Hill":
        break;
      case "Greenwich Village - SoHo":
        break;
      case "Union Square - Lower East Side":
        break;
      case "Lower Manhattan":
        break;
    }
  }
  
  NYMap = loadImage("NYMap.png");

  //________________________________________________Pollution
  pollution = new ArrayList<Pollution>();
}

void draw() { 
  background(220, 10, 100);
  fill(0);
  image(body,xPos, yPos - 300);
  Cross();
  image(NYMap, 450, 0, 750, 750);
  //rect(xPos, yPos, boxSize, boxSize * 2);
  for (int i = 0; i < pollution.size(); i++) {
    Pollution p = pollution.get(i);
    p.addLetters();
    p.drawLetters();
  }
  
  rect(BronxButton_X, BronxButton_Y, BronxButton_Size, BronxButton_Size);

}

void Cross(){
  //white box(decoration)
  fill(255);
  strokeWeight(15);
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
}

void mousePressed() {
  
  pollution.add(new Pollution(mouseX, mouseY));
  
  if(mouseX > xPos - boxSize && mouseX < xPos + boxSize && 
      mouseY > yPos - boxSize * 2 && mouseY < yPos + boxSize * 2) { 
    locked = true; 
  } else {
    locked = false;
  }
  
  xOffset = mouseX - xPos; 
  yOffset = mouseY - yPos; 

  if (mouseX > BronxButton_X && mouseX < BronxButton_X + BronxButton_Size && mouseY > BronxButton_Y && mouseY < BronxButton_Y + BronxButton_Size)
    {
      fill(255);
      println("Square button pressed.");
    }
    else
    {
      fill(127.5);
      println("No button pressed.");
    }
}

void mouseDragged() {
  if(locked) {
    xPos = mouseX - xOffset; 
    yPos = mouseY - yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}
