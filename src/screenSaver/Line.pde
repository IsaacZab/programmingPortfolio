class Line {
  //Member Variables
  float xpos, ypos, strokeW, pointCount;

  //Constructor
  Line(float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
  }

  //Display Method
  void display() {
    strokeW = random(1, 6);
    pointCount = random(1, 50);
    stroke(random(50,150),random(10),random(100,255));
    strokeWeight(strokeW);

    int rand = int(random(4));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (rand == 0) {
        moveRight(xpos, ypos, pointCount);
      } else if (rand == 1) {
        moveUp(xpos, ypos, pointCount);
      } else if (rand == 2) {
        moveLeft(xpos, ypos, pointCount);
      } else {
        moveDown(xpos, ypos, pointCount);
      }
    }
  }



  //Movement Method
  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX+i;
      ypos = startY;
    }
  }
  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX-i;
      ypos = startY;
    }
  }
  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY+i;
    }
  }
  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY-i;
    }
  }
}
