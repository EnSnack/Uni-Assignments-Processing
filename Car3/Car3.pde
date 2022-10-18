UpperPartCar myUpperPartCar;
BottonPartCar myBottonPartCar;
Wheel mywheel1;
Wheel mywheel2;
float carY = 100;
float carX = 100;
float xSpeed = 2;
float widthCar = 350;

void setup() {
  size(600,800);
  myUpperPartCar = new UpperPartCar(color(255,225,0), carX, carY, widthCar, xSpeed);
  myBottonPartCar = new BottonPartCar(color(255,225,0), carX, carY, widthCar, xSpeed);
  mywheel1 = new Wheel(color(0), 19, 125, xSpeed);
  mywheel2 = new Wheel(color(0), 189, 125, xSpeed);
}

void draw() {
  background(255);
  myUpperPartCar.drive();
  myUpperPartCar.display();
  myBottonPartCar.drive();
  myBottonPartCar.display();
  mywheel1.drive();
  mywheel1.display();
  mywheel2.display();
  mywheel2.drive();
}