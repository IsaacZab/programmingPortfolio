class Rock {
  int x, y, diam, speed, rand, health;
  PImage Rock;

  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    diam = int(random(80, 140));
    health = diam;
    speed = int(random(2, 7));
    rand = int(random(3));
    if (rand ==0) {
      Rock = loadImage("rock1.png");
    }
    if (rand ==1) {
      Rock = loadImage("rock2.png");
    }
    if (rand ==2) {
      Rock = loadImage("rock3.png");
    }
  }
  void display() {
    fill(255, 0, 0);
    imageMode(CENTER);
    Rock.resize(diam ,diam) ;
    image(Rock, x, y);
  }
  
  


  void move() {
    y+=speed;
  }


  boolean reachedBottom() {
    if (y> height + 100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip s) {
    float distance = dist(x, y, s.x, s.y);
    if (distance < 40) {
      return true;
    } else {
      return false;
    }
  }
}
