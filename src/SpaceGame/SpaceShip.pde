class SpaceShip {
  // MemberVariables
  int x, y, w, health, laserCount,turret;
  boolean active;
  PImage ship;

  // contructor
  SpaceShip() {
    x =0;
    y = 0;
    w = 80;
    health = 100;
    laserCount = 500;
    turret = 1;
    active = true;
    ship = loadImage("BigShip.png");
  }


  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    imageMode(CENTER);
    image(ship, x, y);
  }
  // only used for keyboard
  void move() {
  }

  boolean fire() {
    if (laserCount>0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intercect(Rock r) {
    return true;
  }
}
