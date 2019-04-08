// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//
float xPos;
float yPos;
int boxSize = 20;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() {
  size(1200, 750);
  xPos = width - width/20;
  yPos = height/10;
  rectMode(RADIUS); 
  noStroke();
}

void draw() { 
  background(220, 10, 100);
  fill(0);
  rect(xPos, yPos, boxSize, boxSize * 2);
}

void mousePressed() {
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
