class Letter
{
  char letter;
  float posX;
  float posY;
  float velX;
  float velY;
  float alpha;
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
