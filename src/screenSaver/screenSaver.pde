Line l1,l2;
void setup() {
  background(0);
  size(displayWidth, displayHeight);
  l1 = new Line(random(width), random(height));
  l2 = new Line(random(width), random(height));
  
}

void draw() {
  l1.display();
  l2.display();


}
