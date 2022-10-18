int cars = 100; // number of cars
int curCars = 0;
Car[] myCars; // array for cars

void setup() {
  size(500, 500);
  smooth();
  myCars = new Car[cars]; // init array
  // instantiate all cars
  for (int i =0; i<cars; i++) {
    myCars[i] = new Car();
  }
}

void draw() {
  background(0);
  // draw and move cars
  for (int i =0; i<curCars; i++) {
    myCars[i].draw();
    myCars[i].go();
  }
  fill(255);
  text(curCars, 50, 50);
}

void keyPressed() {
  if (key == 'a' && curCars <= 98) {
    curCars+=1;
    myCars[curCars] = new Car();
  }
  if (key == 's' && curCars >= 1) {
    curCars-=1;
    myCars[curCars] = new Car();
  }
}