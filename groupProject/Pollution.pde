class Pollution
{
  ArrayList<Letter> letters;
  float posX;
  float posY;
  float rate; 
  float colors;
  float life;
  PFont f;
  String message = "";
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
    letter = new Letter[message.length()];  
    int x = 10;
    for(int i = 0; i < message.length(); i++){
      letter[i] = new Letter(x, 5, message.charAt(i), life_);
      x += textWidth(message.charAt(i));
    }
  }
 
  void addLetters() {
    for(int i = 0; i < message.length(); i++){
      letters.add(new Letter(this.posX, this.posY, message.charAt(i), life));
    }
  }

  void drawLetters() {
    for (int i = 0; i < letters.size(); i++) {
      Letter b = letters.get(i);
      b.update();
      b.display();
    }
    for(int i = letters.size() - 1; i >= 0; i--) {
      Letter l = letters.get(i);
      if(l.life < 0) {
        letters.remove(i);
      }
    }
  }
}
