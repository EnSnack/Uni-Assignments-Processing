//This whole part is more or less self-explanatory, I won't be explaining much
//about this. It's generally the same as the example we got in class.
int balls = 2;
Ball[] bouncingBall = new Ball[balls];
float gravity = 0.10;
float friction = -0.9;

void setup() {
  size(600, 400);
  for (int i = 0; i < bouncingBall.length; i++) {
    bouncingBall[i] = new Ball(color(random(1,100),random(1,100),random(1,100),225), int(30), random(30,40), random(25,height-50), random(2));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < bouncingBall.length; i++) {
    bouncingBall[i].display();
    bouncingBall[i].bounce();
  }
}