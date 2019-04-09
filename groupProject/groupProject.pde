// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//https://processing.org/tutorials/text/
//https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles

float xPos;
float yPos;
int boxSize = 20;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
ArrayList<Pollution> pollution;
PImage body;


void setup() {
  size(1200, 750);
  xPos = width - width/10;
  yPos = height/10;
  rectMode(RADIUS); 
  noStroke();
  pollution = new ArrayList<Pollution>();
  
  body = loadImage("body.png");
  body.resize(100,150);
}

void draw() { 
  background(220, 10, 100);
  fill(0);
  image(body,xPos, yPos);
  //rect(xPos, yPos, boxSize, boxSize * 2);
  for (int i = 0; i < pollution.size(); i++) {
    Pollution p = pollution.get(i);
    p.addLetters();
    p.drawLetters();
  }
}

void Cross(){
  
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
