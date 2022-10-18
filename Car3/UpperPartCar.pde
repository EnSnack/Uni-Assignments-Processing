class UpperPartCar {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  UpperPartCar(color tempC, float tempXpos, float tempYpos, float tempWidthCar, float tempXspeed){
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  xspeed = tempXspeed;
  widthCar = tempWidthCar;
  }

  void drive() {
  xpos = xpos + xspeed;
  if (xpos > width) {
    xpos = 0;
    }  
  }  

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos-50, widthCar/2, 60);
  }
}