class Wheel {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Wheel(color tempC, float tempXpos, float tempYpos, float tempXspeed){
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  xspeed = tempXspeed;
  }

  void drive() {
  xpos = xpos + xspeed;
  if (xpos > width) {
    xpos = 0;
    }  
  }  

  void display() {
    ellipseMode(CENTER);
    fill(c);
    ellipse(xpos,ypos,50,50);
  }
}