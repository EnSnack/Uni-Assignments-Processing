/** Assignment from AP class
week_12_mini_ex (A simple parallax)
A simple never-ending parallax with randomly generated clouds (cloud).
The generativity is in generating a never-ending "tunnel".
The 27th of March, 2016
Inspiration of data is from the old Super Mario World games.
**/

PImage back, middle, front, cloud; // Our images that we load
PVector vback, vmiddle, vfront, vcloud; // Our vectors, we're going to make
// a bunch of 2D vectors later on, some have position in 0, as they're as big as
// the size of the screen, therefore it is not suggested to change the size of
// the screen, it can be done and it still works, but it won't work as optimally.
float speed = 0;

void setup(){
  // here we initialize the images
  back = loadImage("back.png");
  middle = loadImage("middle.png");
  front = loadImage("front.png");
  cloud = loadImage("cloud.png");
  
  // here we initialize the vectors
  size(640, 420);
  vback = new PVector(0, 0); // the back (check data)
  vmiddle = new PVector(0, 90); // the middle
  vfront = new PVector(0, 115); // and the front
  // these position will get fixed to the size.
  vcloud = new PVector(random(0,width), random(0,height-150));
  // this cloud will get a random position rather than a fixed one.
  frameRate(30);
  // make framerate 30 so it looks just a bit interesting, the higher framerate
  // the less interesting.
}

void paraDraw(PImage img, PVector pos, float vel){ // our draw function
  pos.sub(vel, 0, 0); // here we substract the speed (third parametre) from
  // the position of the vector (second parametre) this way we can make an illusion
  // of the vector moving every second. Putting different velocity (vel) (or speed)
  // allows the images to move independently of each other, as this is called for
  // each individual picture.
  
  int r = int(pos.x)+img.width; // here we make an r function
  // this function serves to help us to repeatedly create an illusion
  // of an infinitely long image.

  if(r < width && img != cloud) image(img, r, pos.y); // this creates the illusion
  // we have excluded the cloud as it would also be infinitely made, which we don't want
  // as the cloud needs to be randomly generated.
  if(pos.x < width && img != cloud) image(img, pos.x-img.width, pos.y);  
  // Same thing here basically. Except this keeps the current image so it doesn't
  // fade to white after we passed it.
  if(pos.x < -img.width) { pos.x = width; if(img == cloud) pos.y = random(0,height-150); }
  // here we generate once we hit the wall
  //println("r: " + r + ", pos.x: " +pos.x);
  // we can print the r and pos.x value in case we need it.
  
  image(img, pos.x, pos.y);
  // create image on the position
  //fill(#ff0000);
  //rect(pos.x, 0, img.width, img.height);
}

void draw(){
  background(255); // our background color (doesn't really matter at all)
  float normCursor = int((mouseX/float(width))*5); // this uses the cursor to
  // make a movement. We divide to make it not move too quickly, but also to
  // make it dependent on the width.
  
  paraDraw(back, vback, normCursor+1);
  paraDraw(middle, vmiddle, normCursor+2);
  paraDraw(front, vfront, normCursor+3);
  paraDraw(cloud, vcloud, normCursor+4);
  // All our draw functions, heres an example:
  // paraDraw(image, vector, movement (velocity));
  // velocity for example uses our normCursor variable to move depending
  // on the mouse, and the further to the width it is, the quicker it moves.
}