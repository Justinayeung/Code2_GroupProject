class Letter
{
  char letter;
  float posX;
  float posY;
  float velX;
  float velY;
  float life;
  float alpha;
    
  Letter(float posX, float posY, char letter)
  {
    this.posX = posX + random(-2, 3);
    this.posY = posY + random(-40, 40);
    this.velX = random(-1, 1);
    this.velY = random(-5, 0);
    this.letter = letter;
    life = 30;
    alpha = 180;
  }
  
  void display() {
    noStroke();
    fill(map(life, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  
  void update() {
    alpha -= 20;
    life = life - 0.5;
    this.posX += this.velX;
    this.posY += this.velY;
  }
}
