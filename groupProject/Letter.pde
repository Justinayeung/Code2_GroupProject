class Letter
{
  char letter;
  float posX;
  float posY;
  float velX;
  float velY;
  float alpha;
  float life;
  String location;
 
  
  Letter(float posX, float posY, char letter, float life_)
  {
    life = life_;
    this.posX = posX + random(-2, 3);
    this.posY = posY + random(-40, 40);
    this.velX = random(-0.5, 0.5);
    this.velY = random(-5, 0);
    this.letter = letter;
    alpha = 180;
  }
  
  void display() {
    noStroke();
    fill(map(life, 50, 100, 150, 0));
    text(letter, posX, posY);
  }
  
  void update() {
    alpha -= 20;
    life = life - 10;
    this.posX += this.velX;
    this.posY += this.velY;
  }
}
