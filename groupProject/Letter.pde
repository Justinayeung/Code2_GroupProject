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
    if(life == bronxLife) {
      fill(map(bronxLife, 50, 0, 200, 20));
    }
    if(life == brooklynLife) {
      fill(map(brooklynLife, 50, 0, 200, 20));
    }
    if(life == queensLife) {
      fill(map(queensLife, 50, 0, 200, 20));
    }
    if(life == central_harlemLife) {
      fill(map(central_harlemLife, 50, 0, 200, 20));
    }
    if(life == east_harlemLife) {
      fill(map(east_harlemLife, 50, 0, 200, 20));
    }
    if(life == upperWLife) {
      fill(map(upperWLife, 50, 0, 200, 20));
    }
    if(life == upperELife) {
      fill(map(upperELife, 50, 0, 200, 20));
    }
    if(life == chelseaLife) {
      fill(map(chelseaLife, 50, 0, 200, 20));
    }
    if(life == gramercy_murrayLife) {
      fill(map(gramercy_murrayLife, 50, 0, 200, 20));
    }
    if(life == greenwich_sohoLife) {
      fill(map(greenwich_sohoLife, 50, 0, 200, 20));
    }
    if(life == union_lowerELife) {
      fill(map(union_lowerELife, 50, 0, 200, 20));
    }
    if(life == lower_manhattanLife) {
      fill(map(lower_manhattanLife, 50, 0, 200, 20));
    }
    text(letter, posX, posY);
  }
  
  void update() {
    alpha -= 20;
    bronxLife = bronxLife - 10;
    brooklynLife = brooklynLife - 10;
    queensLife = queensLife - 5;
    central_harlemLife = central_harlemLife - 10;
    east_harlemLife = east_harlemLife - 10;
    upperWLife = upperWLife - 10;
    upperELife = upperELife - 10;
    chelseaLife = chelseaLife - 10;
    gramercy_murrayLife = gramercy_murrayLife - 10;
    greenwich_sohoLife = greenwich_sohoLife - 10;
    union_lowerELife = union_lowerELife - 10;
    lower_manhattanLife = lower_manhattanLife - 10;
    this.posX += this.velX;
    this.posY += this.velY;
  }
}
