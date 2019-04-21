class PercentageBox{
  
  float xPos, yPos;
  //float emisBronx, emisBrooklyn, emisQueens, emisCentralHarlem, emisEastHarlem, emisUpperWestSide, 
  //emisUpperEastSide, emisChelsea, emisGramercyMurray, emisGreenwichVillage, emisUnionSquare, emisLowerManhattan;
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
  float colors;
  color good, moderate, unhealthyForSensitiveGroups, unhealthy, veryUnhealthy, harzardous;
  
  /*
  good = 0 - 50 (#24e228);
  moderate = 51 -100 (#fffd38);
  unhealthyForSensitiveGroups = 101 - 150 (#fd7e23);
  unhealthy = 151 - 200 (#fc0d1b);
  veryUnhealthy = 201 - 300 (#8e4295);
  harzardous = 301 - 500 (#7d0425);
  */
  
  PercentageBox(float x, float y, float colors_){
    xPos = x;
    yPos = y;
    
    colors = colors_;
    good = color(#24e228);
    moderate = color(#fffd38);
    unhealthyForSensitiveGroups = color(#fd7e23);
    unhealthy = color(#fc0d1b);
    veryUnhealthy = color(#8e4295);
    harzardous = color(#7d0425);
    
  }
  
  
  void display(){
    if(overBronx == true){
      //fill(
    }
    
    if(overBrooklyn == true){
      
    }
    
    if(overQueens == true){
      
    }
    
    if(overCentralHarlem == true){
      
    }
    
    if(overEastHarlem == true){
      
    }
    
    if(overUpperWestSide == true){
      
    }
    
    if(overUpperEastSide == true){
      
    }
    
    if(overChelsea == true){
      
    }
    
    if(overGramercyMurray == true){
      
    }
    
    if(overGreenwichVillage == true){
      
    }
    
    if(overUnionSquare == true){
      
    }
    
    if(overLowerManhattan == true){
      
    }
  }
  
  void Update(){
    rectMode(CORNER);
    rect (xPos, yPos, 96, 120);
    
    //if(
    
  }

  
}
