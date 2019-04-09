class Pollution
{
  ArrayList<Letter> letters;
  float posX;
  float posY;
  float rate; 
  float colors;
  PFont f;
  String message = "BRONX";
  Letter[] letter;
  //Data
  
  Pollution(float posX, float posY)//, float data)
  {
    this.posX = posX;
    this.posY = posY;
    letters = new ArrayList<Letter>();
    f = createFont("Arial", 10, true);
    textFont(f);
    letter = new Letter[message.length()];
    int x = 16;
    for(int i = 0; i < message.length(); i++)
    {
      letter[i] = new Letter(x, 100, message.charAt(i));
      x += textWidth(message.charAt(i));
    }
  }
  
  void addLetters() {
    for(int i = 0; i < message.length(); i++)
    {
      letters.add(new Letter(this.posX, this.posY, message.charAt(i)));
    }
  }

  void drawLetters() {
    for (int i = 0; i < letters.size(); i++) {
      Letter b = letters.get(i);
      b.update();
      b.display();
     
    } 

    for (int i = letters.size() - 1; i >= 0; i--) {
      Letter l = letters.get(i);
      if (l.life < 0) {
        letters.remove(i);
      }
    }
  }
}
