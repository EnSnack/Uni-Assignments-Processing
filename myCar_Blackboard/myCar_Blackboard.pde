
// step 1. Declare Objects

Car myCar1;
Car myCar2;

void setup() {
 size(600, 400);
//step 2. Initialize object 
 myCar1 = new Car(color(255,0,0), 10, 10, 100, 2);
 myCar2 = new Car(color(0,0,255), 20, 20, 300, 1);
 
}

void draw() {
 background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display(); 
}


