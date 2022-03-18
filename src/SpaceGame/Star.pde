class Star {
  int x, y, diam, speed;
  PImage Star, Star2;

  Star() {
    x= int(random(width));
    y = int(random(height));
    diam = int(random(1, 4));
    speed = int(random(1, 5));
  }

  void display() {
    fill(255);
    rect(x, y, diam, diam);
    //Star = loadImage("star1.png");
  }


  void move() {
    if (y> height+ 10 ) {
      y = 10;
      x = int(random(width));
    }
    y+=speed;
  }


  boolean reachedBottom() {
    return true;
  }
}
