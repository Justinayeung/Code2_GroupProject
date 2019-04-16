class Pollution
{
  ArrayList<Letter> letters;
  float posX;
  float posY;
  float rate; 
  float colors;
  PFont f;
  String message0 = "BRONX";
  String message1 = "BROOKLYN";
  String message2 = "QUEENS";
  String message3 = "CENTRAL HARLEM";
  String message4 = "EAST HARLEM";
  String message5 = "UPPER WEST SIDE";
  String message6 = "UPPER EAST SIDE";
  String message7 = "CHELSEA";
  String message8 = "GRAMERCY MURRAY";
  String message9 = "GREENIWICH VILLAGE";
  String message10 = "UNION SQUARE";
  String message11 = "LOWER MANHATTAN";
  Letter[] letter0;
  Letter[] letter1;
  Letter[] letter2;
  Letter[] letter3;
  Letter[] letter4;
  Letter[] letter5;
  Letter[] letter6;
  Letter[] letter7;
  Letter[] letter8;
  Letter[] letter9;
  Letter[] letter10;
  Letter[] letter11;
  //Data
  
  Pollution(float posX, float posY, String message_)
  {
    this.posX = posX;
    this.posY = posY;
    letters = new ArrayList<Letter>();
    f = createFont("Arial", 10, true);
    textFont(f);
    letter0 = new Letter[message0.length()];
    letter1 = new Letter[message1.length()];
    letter2 = new Letter[message2.length()];
    letter3 = new Letter[message3.length()];
    letter4 = new Letter[message4.length()];
    letter5 = new Letter[message5.length()];
    letter6 = new Letter[message6.length()];
    letter7 = new Letter[message7.length()];
    letter8 = new Letter[message8.length()];
    letter9 = new Letter[message9.length()]; 
    letter10 = new Letter[message10.length()]; 
    letter11 = new Letter[message11.length()];  
    int x = 16;
    for(int i = 0; i < message0.length(); i++){
      letter0[i] = new Letter(x, 100, message0.charAt(i));
      x += textWidth(message0.charAt(i));
    }
    for(int i = 0; i < message1.length(); i++){
      letter1[i] = new Letter(x, 100, message1.charAt(i));
      x += textWidth(message1.charAt(i));
    }
    for(int i = 0; i < message2.length(); i++){
      letter2[i] = new Letter(x, 100, message2.charAt(i));
      x += textWidth(message2.charAt(i));
    }
    for(int i = 0; i < message3.length(); i++){
      letter3[i] = new Letter(x, 100, message3.charAt(i));
      x += textWidth(message3.charAt(i));
    }
    for(int i = 0; i < message4.length(); i++){
      letter4[i] = new Letter(x, 100, message4.charAt(i));
      x += textWidth(message4.charAt(i));
    }
    for(int i = 0; i < message5.length(); i++){
      letter5[i] = new Letter(x, 100, message5.charAt(i));
      x += textWidth(message5.charAt(i));
    }
    for(int i = 0; i < message6.length(); i++){
      letter6[i] = new Letter(x, 100, message6.charAt(i));
      x += textWidth(message6.charAt(i));
    }
    for(int i = 0; i < message7.length(); i++){
      letter7[i] = new Letter(x, 100, message7.charAt(i));
      x += textWidth(message7.charAt(i));
    }
    for(int i = 0; i < message8.length(); i++){
      letter8[i] = new Letter(x, 100, message8.charAt(i));
      x += textWidth(message8.charAt(i));
    }
    for(int i = 0; i < message9.length(); i++){
      letter9[i] = new Letter(x, 100, message9.charAt(i));
      x += textWidth(message9.charAt(i));
    }
    for(int i = 0; i < message10.length(); i++){
      letter10[i] = new Letter(x, 100, message10.charAt(i));
      x += textWidth(message10.charAt(i));
    }
    for(int i = 0; i < message11.length(); i++){
      letter11[i] = new Letter(x, 100, message11.charAt(i));
      x += textWidth(message11.charAt(i));
    }
  }
  
  void addLetters() {
    for(int i = 0; i < message0.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message0.charAt(i)));
    }
    for(int i = 0; i < message1.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message1.charAt(i)));
    }
    for(int i = 0; i < message2.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message2.charAt(i)));
    }
    for(int i = 0; i < message3.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message3.charAt(i)));
    }
    for(int i = 0; i < message4.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message4.charAt(i)));
    }
    for(int i = 0; i < message5.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message5.charAt(i)));
    }
    for(int i = 0; i < message6.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message6.charAt(i)));
    }
    for(int i = 0; i < message7.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message7.charAt(i)));
    }
    for(int i = 0; i < message8.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message8.charAt(i)));
    }
    for(int i = 0; i < message9.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message9.charAt(i)));
    }
    for(int i = 0; i < message10.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message10.charAt(i)));
    }
    for(int i = 0; i < message11.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message11.charAt(i)));
    }
  }

  void drawbronx() {
    for (int i = 0; i < letters.size(); i++) {
      Letter b = letters.get(i);
      b.update();
      b.display0();
      b.display1();
      b.display2();
      b.display3();
      b.display4();
      b.display5();
      b.display6();
      b.display7();
      b.display8();
      b.display9();
      b.display10();
      b.display11();
    } 

    for (int i = letters.size() - 1; i >= 0; i--) {
      //Letter l = letters.get(i);
     /* if (bronxLife < 0) {
        letters.remove(i);
      }
      */
    }
  }
}
