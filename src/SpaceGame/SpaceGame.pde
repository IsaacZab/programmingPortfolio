SpaceShip s1;
Star[] stars = new Star[125];
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
Timer rockTimer;
Timer puTimer;
int score, level, p, rockCount ;
boolean play, shield;
PImage startScreen, gameOver;
PFont font;


void setup() {
  size(1000, 1000);
  startScreen = loadImage("start.png");
  s1 = new SpaceShip();
  score = 0;
  level = 1;
  play = false;
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  rockTimer = new Timer(1000);
  rockTimer.start();
  rockCount = 0;
  puTimer = new Timer(15000);
  puTimer.start();
 
  font = createFont("newFont.ttf",128);
}


void draw() {
  background(0);
  noCursor();
  infoPanel();

  // determine if the user is in gameplay
  if (!play) {
    startScreen();
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
  } else {

    // random planet
    //p = int(random(1000));
    //if (p <3) {
    //}


    //render stars
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    if (puTimer.isFinished()) {
      powerUps.add(new PowerUp(int(random(width)), -100));
      puTimer.start();
    }
    // render power ups an ad effects
    for (int p = 0; p < powerUps.size(); p++) {
      PowerUp pu = powerUps.get(p);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        if (pu.type =='h') {
          s1.health+=100;
          if(s1.health> 100) {
          s1.health = 100;
            shield = true;
          }
          powerUps.remove(pu);
        } else if (pu.type =='l') {
          s1.laserCount = 500;
          powerUps.remove(pu);
        } else if (pu.type =='t') {
          s1.turret+= 1;
          powerUps.remove(pu);
        }
        if (pu.reachedBottom()) {
          powerUps.remove(pu);
        }
      }
    }
    //timer for rocks
    s1.display(mouseX, 900);
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -100));
      rockTimer.start();
    }

    // render rocks and detect rock and ship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (rock.intersect(s1)) {
        if(shield = false) {
        s1.health-=rock.diam;
      }else {
     // s1.health = 100;
      ///shield = false;
      //shield.remove
    }
        
        rocks.remove(rock);
        score+= rock.health;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
        rockCount++;
      }
    }

    //Render the lasers and detect rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j<rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          lasers.remove(laser);
          rock.diam = rock.diam - 80;
          if (rock.diam<40) {
            rocks.remove(rock);
            score = score + rock.health;
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    if (s1.health < 1 || rockCount>9) {
      gameOver();
      noLoop();
    }
  } //check status o fplay boolean and check if false
}

void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 940, width, 60);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Score: " + score + " level: " + level + " Health: " + s1.health + " Ammo: " + s1.laserCount, width/2, 960);
}


void startScreen() {
  background(0); // ypu may include info as image
  textAlign(CENTER);
  textSize(45);
  fill(255);
  textFont(font,128);
  //image(startScreen,0,0);
  text(" Spacegame", width/2, height/2);
  textSize(25);
  text("By Isaac Z  2021", width/2, height/2+30);
  textSize(35);
  text("Press a key to start", width/2, height/2+60);
  if (keyPressed) {
    play = true;
  }
}


void gameOver() {
  background(0); // ypu may include info as image
  textAlign(CENTER);
  textSize(45);
  fill(255);
  //image(gameOver, 0, 0);
  text("Game Over", width/2, height/2);
  text("Score "+ score, width/2, height/2+30);
  //text("Press a key to start", width/2, height/2+50);
  if (keyPressed) {
    play = true;
  }
}


void ticker() {
}

void mousePressed() {
  if (s1.fire()) {
    if (s1.turret == 1) {
      lasers.add(new Laser(s1.x, s1.y-35));
      s1.laserCount-=1;
    } else if (s1.turret == 2 ) {
      lasers.add(new Laser(s1.x-20, s1.y-35));
      lasers.add(new Laser(s1.x+20, s1.y-35));
      s1.laserCount-=1;
    }
  }
}


void keyPressed() {
  if (s1.fire()) {
    if (s1.turret == 1) {
      lasers.add(new Laser(s1.x, s1.y-35));
      s1.laserCount-=1;
    } else if (s1.turret == 2 ) {
      lasers.add(new Laser(s1.x-15, s1.y-35));
      lasers.add(new Laser(s1.x+15, s1.y-35));
      s1.laserCount-=1;
    } else if (s1.turret == 3 ) {
      lasers.add(new Laser(s1.x-15, s1.y-35));
      lasers.add(new Laser(s1.x+15, s1.y-35));
      lasers.add(new Laser(s1.x, s1.y-35));
      s1.laserCount-=1;
    } else if (s1.turret == 4 ) {
      lasers.add(new Laser(s1.x-15, s1.y-35));
      lasers.add(new Laser(s1.x+15, s1.y-35));
      lasers.add(new Laser(s1.x, s1.y-35));
      lasers.add(new Laser(s1.x-30, s1.y-35));
      s1.laserCount-=1;
    } else if (s1.turret >= 5 ) {
      lasers.add(new Laser(s1.x-15, s1.y-35));
      lasers.add(new Laser(s1.x+15, s1.y-35));
      lasers.add(new Laser(s1.x, s1.y-35));
      lasers.add(new Laser(s1.x-30, s1.y-35));
      lasers.add(new Laser(s1.x+30, s1.y-35));
      s1.laserCount-=1;
    }
  }
}
