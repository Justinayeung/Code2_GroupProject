ArrayList<Generator> generators;

void setup() {
  size(800, 800);
  generators = new ArrayList<Generator>();
}

void draw() {
  background(30);
  for (int i = 0; i < generators.size(); i++) {
    Generator g = generators.get(i);
    g.addParticles();
    g.drawParticles();
  }
}

void mousePressed() {
  generators.add(new Generator(mouseX, mouseY, random(RGB)));
}

class Particle {
  float posX;
  float posY;
  float velX;
  float velY;
  float life;
  float alpha;
  float colorChange;

  Particle(float posX, float posY) {
    this.posX = posX + random(-1,3);
    this.posY = posY+ random(-40,40);
    this.velX = random(-1, 1);
    this.velY = random(-5, 0);
    life = 30;
    alpha = 180;
    colorChange = 255;
  }

  void display() {
    noStroke();
    fill(map(life, 50, 250, 70, 255), map(life, 50, 20, 70, 230), 30, map(life, 50, 0, 230, 20));
    ellipse(this.posX, this.posY, life, life);
  }

  void update() {
    alpha-=20;
    life = life - 0.5;
    colorChange = colorChange - 50;
    this.posX += this.velX;
    this.posY += this.velY;

    // check if it goes off
    if (this.posX > width || this.posX < 0) {
      this.velX *= -20;
    }
    if (this.posY > height || this.posY < 0) {
      this.velY *= -20;
    }
  }
}

class Generator {
  ArrayList<Particle> particles;
  float posX;
  float posY;
  float rate; 
  float colors;

  Generator(float posX, float posY, float colors) {
    this.posX = posX;
    this.posY = posY;
    this.colors = colors;
    particles = new ArrayList<Particle>();
  }

  void addParticles() {
    particles.add(new Particle(this.posX, this.posY));
  }

  void drawParticles() {
    for (int i = 0; i < particles.size(); i++) {
      Particle b = particles.get(i);
      b.update();
      b.display();
     
    } 

    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      if (p.life < 0) {
        particles.remove(i);
      }
    }
  }
}
