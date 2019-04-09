// Air Quality Index(AQI) Website: https://airnow.gov/index.cfm?action=aqibasics.aqi
//
//float xPos;
//float yPos;
//int boxSize = 20;
//boolean locked = false;
//float xOffset = 0.0; 
//float yOffset = 0.0; 

//void setup() {
//  size(1200, 750);
//  xPos = width - width/20;
//  yPos = height/10;
//  rectMode(RADIUS); 
//  noStroke();
//}

//void draw() { 
//  background(220, 10, 100);
//  fill(0);
//  rect(xPos, yPos, boxSize, boxSize * 2);
//}

//void mousePressed() {
//  if(mouseX > xPos - boxSize && mouseX < xPos + boxSize && 
//      mouseY > yPos - boxSize * 2 && mouseY < yPos + boxSize * 2) { 
//    locked = true; 
//  } else {
//    locked = false;
//  }
  
//  xOffset = mouseX - xPos; 
//  yOffset = mouseY - yPos; 

//}

//void mouseDragged() {
//  if(locked) {
//    xPos = mouseX - xOffset; 
//    yPos = mouseY - yOffset; 
//  }
//}

//void mouseReleased() {
//  locked = false;
//}

//https://processing.org/tutorials/text/
//https://github.com/Justinayeung/Code2_GroupProject/tree/master/groupProject/Particles
//ArrayList<Pollution> pollution;

//void setup()
//{
//  size(1200, 750);
//  pollution = new ArrayList<Pollution>();

//}

//void draw() {
//  background(100);
//  for (int i = 0; i < pollution.size(); i++) {
//    Pollution p = pollution.get(i);
//    p.addLetters();
//    p.drawLetters();
//  }
//}

//void mousePressed() {
//  pollution.add(new Pollution(mouseX, mouseY));
//}

//class Letter
//{
//  char letter;
//  float posX;
//  float posY;
//  float velX;
//  float velY;
//  float life;
//  float alpha;
//  float colorChange;
    
//  Letter(float posX, float posY, char letter)
//  {
//    this.posX = posX + random(-2, 3);
//    this.posY = posY + random(-40, 40);
//    this.velX = random(-1, 1);
//    this.velY = random(-5, 0);
//    this.letter = letter;
//    life = 30;
//    alpha = 180;
//  }
  
//  void display() {
//    noStroke();
//    fill(map(life, 50, 0, 200, 20));
//    text(letter, posX, posY);
//  }
  
//  void update() {
//    alpha -= 20;
//    life = life - 0.5;
//    this.posX += this.velX;
//    this.posY += this.velY;

//    // check if it goes off
//    if (this.posX > width || this.posX < 0) {
//      this.velX *= -20;
//    }
//    if (this.posY > height || this.posY < 0) {
//      this.velY *= -20;
//    }
//  }
//}

//class Pollution
//{
//  ArrayList<Letter> letters;
//  float posX;
//  float posY;
//  float rate; 
//  float colors;
//  PFont f;
//  String message = "BRONX";
//  Letter[] letter;
  
//  Pollution(float posX, float posY)
//  {
//    this.posX = posX;
//    this.posY = posY;
//    letters = new ArrayList<Letter>();
//    f = createFont("Arial", 20, true);
//    textFont(f);
//    letter = new Letter[message.length()];
//    int x = 16;
//    for(int i = 0; i < message.length(); i++)
//    {
//      letter[i] = new Letter(x, 100, message.charAt(i));
//      x += textWidth(message.charAt(i));
//    }
//  }
  
//  void addLetters() {
//    for(int i = 0; i < message.length(); i++)
//    {
//      letters.add(new Letter(this.posX, this.posY, message.charAt(i)));
//    }
//  }

//  void drawLetters() {
//    for (int i = 0; i < letters.size(); i++) {
//      Letter b = letters.get(i);
//      b.update();
//      b.display();
     
//    } 

//    for (int i = letters.size() - 1; i >= 0; i--) {
//      Letter l = letters.get(i);
//      if (l.life < 0) {
//        letters.remove(i);
//      }
//    }
//  }
//}
