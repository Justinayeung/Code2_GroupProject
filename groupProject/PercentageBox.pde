class PercentageBox{
  
  float xPos, yPos;
  boolean overBronx = false;
  boolean overBrooklyn = false; 
  boolean overQueens = false;
  boolean overCentralHarlem = false;
  boolean overEastHarlem = false;
  boolean overUpperWestSide = false;
  boolean overUpperEastSide = false; 
  boolean overChelsea = false;
  boolean overGramercyMurray = false;
  boolean overGreenwichVillage = false;
  boolean overUnionSquare = false;
  boolean overLowerManhattan = false;
  
  color good, moderate, unhealthyForSensitiveGroups, unhealthy, veryUnhealthy, harzardous;
  
  /*
  good = 0 - 50 (#24e228);
  moderate = 51 -100 (#fffd38);
  unhealthyForSensitiveGroups = 101 - 150 (#fd7e23);
  unhealthy = 151 - 200 (#fc0d1b);
  veryUnhealthy = 201 - 300 (#8e4295);
  harzardous = 301 - 500 (#7d0425);
  */
  
  PercentageBox(float x, float y){
    xPos = x;
    yPos = y;
    
    good = color(#24e228);
    moderate = color(#fffd38);
    unhealthyForSensitiveGroups = color(#fd7e23);
    unhealthy = color(#fc0d1b);
    veryUnhealthy = color(#8e4295);
    harzardous = color(#7d0425);
    
    
  }
  
  
  void display(){
    
  }
  
  

  
}
