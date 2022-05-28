class Button {
  // Member Variables
  float x, y, w, h;
  boolean on;
  String val;
  color c1,c2;

  //Contructor
  Button(float tempX, float tempY, float tempW, float tempH, String tempVal,color tempc1,color tempc2) {
    x = tempX;
    y = tempY;
    h = tempH;
    w = tempW;
    val = tempVal;
    c1 = tempc1;
    c2 = tempc2;
    on = false;
  }


  // Method for display
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x,y,w,h,5);
    fill(0);
    textSize(16);
    textAlign(LEFT);
    fill(255);
    text(val,x+15,y+25);
  }
  void hover(int mx, int my) {
  on = (mx > x && mx<x+w && my > y && my < y+ h);
  }
}
