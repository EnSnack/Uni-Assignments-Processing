class BottonPartCar {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  BottonPartCar(color tempC, float tempXpos, float tempYpos, float tempWidthCar, float tempXspeed){
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
    rect(xpos,ypos,widthCar,60);
  }
}