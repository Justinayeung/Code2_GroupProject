class Pollution
{
  ArrayList<Letter> letters;
  float posX;
  float posY;
  float rate; 
  float colors;
  PFont f;
  String message0, message1, message2, message3, message4, message5, message6, message7, message8, message9, message10, message11;
  String name = "";
  Letter[] letter;
  //Data
  
  Pollution(float posX, float posY, float life_, String message_)
  {
    this.posX = posX;
    this.posY = posY;
    letters = new ArrayList<Letter>();
    f = createFont("Arial", 10, true);
    textFont(f);
    life = life_;
    name = message_;
    letter = new Letter[name.length()];
    
    message0 = "BRONX";
    message1 = "BROOKLYN";
    message2 = "QUEENS";
    message3 = "CENTRAL HARLEM";
    message4 = "EAST HARLEM";
    message5 = "UPPER WEST SIDE";
    message6 = "UPPER EAST SIDE";
    message7 = "CHELSEA";
    message8 = "GRAMERCY MURRAY";
    message9 = "GREENIWICH VILLAGE";
    message10 = "UNION SQUARE";
    message11 = "LOWER MANHATTAN";
  
    int x = 16;
    for(int i = 0; i < name.length(); i++)
    {
      letter[i] = new Letter(x, 100, name.charAt(i), life);
      x += textWidth(name.charAt(i));
    }
  }
  
  void addLetters() {
    for(int i = 0; i < name.length(); i++)
    {
      letters.add(new Letter(this.posX, this.posY, name.charAt(i), life));
    }
  }

  void drawLetters() {
    for (int i = 0; i < letters.size(); i++) {
      Letter b = letters.get(i);
      b.update();
      b.display();
     
    } 

    for (int i = letters.size() - 1; i >= 0; i--) {
      //Letter l = letters.get(i);
      if (life < 0) {
        letters.remove(i);
      }
    }
  }
}
