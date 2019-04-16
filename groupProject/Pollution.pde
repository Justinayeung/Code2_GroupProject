class Pollution
{
  ArrayList<Letter> letters;
  float posX;
  float posY;
  float rate; 
  float colors;
  PFont f;
  String name = "";
  Letter[] letter;
  //Data
  
  Pollution(float posX, float posY, float life_, String message_)
  {
    life = life_;
    message = message_;
    this.posX = posX;
    this.posY = posY;
    letters = new ArrayList<Letter>();
    f = createFont("Arial", 10, true);
    textFont(f);
    message_ = name;
    letter = new Letter[name.length()];
    int x = 16;
    for(int i = 0; i < name.length(); i++)
    {
      letter[i] = new Letter(x, 100, name.charAt(i));
      x += textWidth(name.charAt(i));
    }
  }
  
  void addLetters() {
    for(int i = 0; i < name.length(); i++)
    {
      letters.add(new Letter(this.posX, this.posY, name.charAt(i)));
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
      if (life < 0) {
        letters.remove(i);
      }
    }
  }
}
