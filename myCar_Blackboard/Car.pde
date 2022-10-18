class Car {
  color c;
  int s;
  float xpos;
  float ypos;
  float xspeed;

  Car(color tempC, int tempS, float tempXpos, float tempYpos, float tempSpeed) {
    c = tempC;
    s = tempS;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempSpeed;
  }

//functionality

void display() {
  stroke(0);
  fill(c);
  rectMode(CENTER);
  rect(xpos,ypos,s,s);
}

//functionality

void drive() {
 xpos = xpos + xspeed;
 if (xpos > width) {
  xpos = 0;
 } 
}

}
