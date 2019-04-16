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
  
  void display0() {
    noStroke();
    fill(map(bronxLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display1() {
    noStroke();
    fill(map(brooklynLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display2() {
    noStroke();
    fill(map(queensLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display3() {
    noStroke();
    fill(map(central_harlemLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display4() {
    noStroke();
    fill(map(east_harlemLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display5() {
    noStroke();
    fill(map(upperWLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display6() {
    noStroke();
    fill(map(upperELife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display7() {
    noStroke();
    fill(map(chelseaLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display8() {
    noStroke();
    fill(map(gramercy_murrayLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display9() {
    noStroke();
    fill(map(greenwich_sohoLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display10() {
    noStroke();
    fill(map(union_lowerELife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  void display11() {
    noStroke();
    fill(map(lower_manhattanLife, 50, 0, 200, 20));
    text(letter, posX, posY);
  }
  
  void update() {
    alpha -= 20;
    bronxLife = bronxLife - 0.5;
    brooklynLife = brooklynLife - 0.5;
    queensLife = queensLife - 0.5;
    central_harlemLife = central_harlemLife - 0.5;
    east_harlemLife = east_harlemLife - 0.5;
    upperWLife = upperWLife - 0.5;
    upperELife = upperELife - 0.5;
    chelseaLife = chelseaLife - 0.5;
    gramercy_murrayLife = gramercy_murrayLife - 0.5;
    greenwich_sohoLife = greenwich_sohoLife - 0.5;
    union_lowerELife = union_lowerELife - 0.5;
    lower_manhattanLife = lower_manhattanLife - 0.5;
    this.posX += this.velX;
    this.posY += this.velY;
  }
}
