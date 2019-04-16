class Letter
{
  char letter;
  float posX;
  float posY;
  float velX;
  float velY;
  float alpha;
  float bronxLife, brooklynLife, queensLife, central_harlemLife, east_harlemLife, upperWLife, upperELife, chelseaLife, gramercy_murrayLife, greenwich_sohoLife, union_lowerELife, lower_manhattanLife;
    
  Letter(float posX, float posY, char letter)
  {
    this.posX = posX + random(-2, 3);
    this.posY = posY + random(-40, 40);
    this.velX = random(-0.5, 0.5);
    this.velY = random(-5, 0);
    this.letter = letter;
    alpha = 180;
    
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
