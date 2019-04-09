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


float xPos;
float yPos;
int boxSize = 20;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
ArrayList<Pollution> pollution;


void setup() {
  size(1200, 750);
  xPos = width - width/20;
  yPos = height/10;
  rectMode(RADIUS); 
  noStroke();
  pollution = new ArrayList<Pollution>();
  
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
}

void draw() { 
  background(220, 10, 100);
  fill(0);
  rect(xPos, yPos, boxSize, boxSize * 2);
  for (int i = 0; i < pollution.size(); i++) {
    Pollution p = pollution.get(i);
    p.addLetters();
    p.drawLetters();
  }
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
