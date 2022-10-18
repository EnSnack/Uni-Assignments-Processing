float y = 0; //set y, make float for future calculation
float x = 0; //set x, make float for future calculation
float imgx = 256;
float imgy = 256;
float speedx = 2;
float speedy = 2;
PImage img; //allow image loading

void setup() {
  size(900, 640);  // Make size of window
  img = loadImage("http://www.iconsplace.com/icons/preview/black/dvd-256.png"); //load dvd image

  y = random(0+imgy, height-imgy); // Give y a random value every time the program is started
  x = random(0+imgx, width-imgx); // Give x a random value every time the program is started
}

void draw() { 
  background(255); // Set the background to white so image is visible
  x = speedx + x;
  y = speedy + y;
  image(img, x, y, imgx, imgy); // Display image and set its x and y value to x and y so it can move, limit w+h to 200,100

  if (y > (height - (y - imgy)) || y < (imgy/3)*-1) { //if y's direction is down
    speedy = speedy * -1;
  }

  if (x > (width - imgx) || x < -10) //if x's direction is left
  {
    speedx = speedx * -1;
  }
} 