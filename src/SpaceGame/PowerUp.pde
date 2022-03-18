class PowerUp {
  int x, y, diam, speed, rand;
  PImage powerUp;
  char type;

  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    diam = int(random(20, 60));

    speed = int(random(2, 10));
    rand = int(random(3));
    if (rand ==0) {
      type = 'h'; // increases health
      powerUp = loadImage("healthIncrease.png");
    }
    if (rand ==1) {
      type ='l';
      powerUp = loadImage("laserIncrease.png");
    }
    if (rand ==2) {
      type = 't';
      powerUp = loadImage("turretCount.png");
    }
  }
  void display() {
    fill(255, 0, 0);
    imageMode(CENTER);
    if (type == 'h') {
      fill(0, 255, 0);
    } else if (type == 'l') {
      fill (255, 0, 0);
    } else if (type == 't') {
      fill(0, 0, 255);
    }

   image(powerUp, x, y);
    //ellipse(x,y,diam,diam);
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
