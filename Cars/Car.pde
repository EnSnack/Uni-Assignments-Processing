class Car {
  // fields
  color col;
  int x;
  int y;
  int speed;

  //constructor
  Car () {
    // assign random values to all fields
    col = color(random(256), random(256), random(256));
    speed = int(random(1, 5));
    if (random(1)>0.5) {
      speed = -speed;
    }
    x = int(random(width));
    y = int(random(height));
  }

  // methods
  void draw() {
    // draw car as a box
    noStroke();
    fill(col);
    ellipse(x, y, 10, 10);
  }


  void go() {
    // increase value of x based on speed
    x+= speed;
    // forward cars
    if (x>width && speed>0) {
      x = -20;
    }
    // backward cars
    if (x<0 && speed < 0) {
      x = width+20;
    }
  }
}