class Laser {
  int x, y, w, h, speed;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 3;
    h = 9;
    speed = 9;
  }

  void display() {
    fill(255, 0, 0);
    noStroke();
    rectMode(CENTER);
    ellipse(x, y, w, h);
  }


  void move() {
    y-=speed;
  }


  boolean reachedTop() {
    if (y<0-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float distance = dist(x, y, r.x, r.y);
    if (distance < w + r.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
