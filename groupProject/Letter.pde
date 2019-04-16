class Letter
{
  char letter;
  float posX;
  float posY;
  float velX;
  float velY;
  float alpha;
  float life;
    
  Letter(float posX, float posY, char letter, float life_)
  {
    life = life_;
    this.posX = posX + random(-2, 3);
    this.posY = posY + random(-40, 40);
    this.velX = random(-0.5, 0.5);
    this.velY = random(-5, 0);
    this.letter = letter;
    alpha = 180;
    
    bronx = airData.getFloat(0, "data_");
    brooklyn = airData.getFloat(1, "data_");
    queens = airData.getFloat(2, "data_");
    central_harlem = airData.getFloat(3, "data_");
    east_harlem = airData.getFloat(4, "data_");
    upperW = airData.getFloat(5, "data_");
    upperE = airData.getFloat(6, "data_");
    chelsea = airData.getFloat(7, "data_");
    gramercy_murray = airData.getFloat(8, "data_");
    greenwich_soho = airData.getFloat(9, "data_");
    union_lowerE = airData.getFloat(10, "data_");
    lower_manhattan = airData.getFloat(11, "data_");
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
