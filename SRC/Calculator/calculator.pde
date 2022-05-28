// Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0"; // info in display
String op = ""; // used for current operator
boolean left = true; // store the operator
float r = 0.0; // decimal number right of the operator
float l = 0; // decimal number left of the operator
float result = 0.0; // decimal number containing the result of a calculation
color c1, c2, c3, c4, c5, c6;

void setup() {
  size (300, 350);
  c1 = color(25);
  c2 = color(65);
  numButtons[1] = new Button(145, 235, 45, 45, "3", c1, c2);
  numButtons[9] = new Button(55, 235, 45, 45, "1", c1,c2);
  numButtons[2] = new Button(100, 235, 45, 45, "2", c1, c2);
  numButtons[3] = new Button(145, 145, 45, 45, "9", c1, c2);
  numButtons[4] = new Button(100, 145, 45, 45, "8", c1, c2);
  numButtons[5] = new Button(55, 145, 45, 45, "7", c1, c2);
  numButtons[6] = new Button(55, 190, 45, 45, "4", c1, c2);
  numButtons[7] = new Button(100, 190, 45, 45, "5",c1,c2);
  numButtons[8] = new Button(145, 190, 45, 45, "6", c1, c2);
  numButtons[0] = new Button(55, 280,90, 45, "0", c1, c2);



  opButtons[0] = new Button(235, 190,45, 45, "+/-", #041D26, #30698C);
  opButtons[1] = new Button(55, 100, 45, 45, "-", #041D26, #30698C);
  opButtons[2] = new Button(100, 100, 45, 45, "*", #041D26, #30698C);
  opButtons[3] = new Button(145, 100, 45, 45, "/", #041D26, #30698C);
  opButtons[4] = new Button(190, 100, 45, 45, "+", #041D26, #30698C);
  opButtons[5] = new Button(235, 100, 45,90, "C", #041D26, #30698C);
  opButtons[6] = new Button(190, 190, 45, 45, "", c1, c2);
  opButtons[7] = new Button(145, 280, 45, 45, ".", #041D26, #30698C);
  opButtons[8] = new Button(190, 280, 90, 45, "ENTER", #041D26, #30698C);
  opButtons[9] = new Button(190, 235, 45, 45, "", c1, c2);
  opButtons[10] = new Button(190, 145, 45, 45, "", c1, c2);
  opButtons[11] = new Button(235, 235, 45, 45, "", #041D26, #30698C);
}

void draw() {

  background(0);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void mousePressed() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() <26) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if(opButtons[i].on) {
    handleEvent(opButtons[i].val,false);}
  }
  println("L:" + l + "Op:" + op + "R:" + r + "Result:" + result + "Left" + left);
}

void clearCalc() {
  dVal = "0"; // info in display
  op = ""; // used for current operator
  left = true; // store the operator
  r = 0.0; // decimal number right of the operator
  l = 0; // decimal number left of the operator
  result = 0.0; // decimal number containing the result of a calculation
}


void updateDisplay() {

  fill(20);
  rect(0, 0, 300, 90);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length() < 12) {
    textSize(48);
  } else if (dVal.length() < 13) {
    textSize(44);
  } else if (dVal.length() < 14) {
    textSize(40);
  } else if (dVal.length() < 15) {
    textSize(36);
  } else textSize(20);
  text(dVal, width - 40, 60);
}

void performCalc() {
  if (op.equals("+")) {
    result = l+r;
  } else if (op.equals("-")) {
    result = l-r;
  } else if (op.equals("*")) {
    result = l*r;
  } else if (op.equals("/")) {
    result = l/r;
  }

  dVal = str(result);
  l = result;
  left = true;
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (keyPressed) {
    if (keyCode == 49 ) {
      handleEvent("1", true);
    } else if (keyCode == 50 ) {
      handleEvent("2", true);
    } else if (keyCode == 51) {
      handleEvent("3", true);
    }  else if (keyCode == 107) {
      handleEvent("+", true);
    }  else if (keyCode == 4) {
      handleEvent("4", true);
    }  else if (keyCode == 5) {
      handleEvent("5", true);
    }  else if (keyCode == 6) {
      handleEvent("6", true);
    }  else if (keyCode == 7) {
      handleEvent("7", true);
    }  else if (keyCode == 8) {
      handleEvent("8", true);
    }  else if (keyCode == 9) {
      handleEvent("9", true);
    }  else if (keyCode == 0) {
      handleEvent("0", true);
    }
  }
}

void handleEvent(String val, boolean num) {
  if (num) {
    // handle all numberclicks or keypress
    if ( dVal.equals("0")) {
      dVal = val;
      l = float(dVal);
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    } else if ( dVal.length() < 38) {
      dVal = dVal + val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    }
  } else if (val.equals("C")) {
    clearCalc();
  } else if (val.equals("+")) {
    left = false;
    op = "+";
    dVal = "0";
  } else if (val.equals("-")) {
    left = false;
    op = "-";
    dVal = "0";
  } else if (val.equals("*")) {
    left = false;
    op = "*";
    dVal = "0";
  } else if (val.equals("/")) {
    left = false;
    op = "/";
    dVal = "0";
  } else if (val.equals("ENTER")) {
    performCalc();
  }
}
