/* Assignment from AP Class
Week 7 Mini Ex
A rectangle in the center of the screen that slowly gradiates color as it spins around.
21st February, 2016
*/

// Below we do variable stuff
float colour = 0; // Name is colour because color is a function so I can't use that (also british english)
float num = 180;
int colorA = #fed36d;
int colorB = #47b2f1;
int colorC = #fe926e;
int colorD = #6ae381;

void setup() {
  size(300, 300); // size of window
  // COMMENT BELOW FOR ALTERNATIVE VERSION
  rectMode(CENTER); // we change the mode of rectangles
}

void draw () {
  background(255); // background color
  inc(colour, 0.023, 1); // call function inc (short for increment) with colour, the value 0.023 and 1, explanation in function

  pushMatrix(); // we push the matrix
  translate(width / 2, height / 2); // we translate to get in center
  float rot = -360/num*(frameCount%num); // the rotate variable where we rotate rather slowly
  if (rot == -92 || rot == -182 || rot == -272 || rot == -2) { // make sure the square stops at intervals, numbers are 2 higher because
    noLoop(); // of the slow delay below. Here we stop the loop (make the whole thing stop)
    delay(500); // 500 milliseconds delay.
    loop(); // start loop again to continue
  } else {
    rotate(radians(rot)); // we rotate here as long as the value isn't mentioned above
    if (rot < -90 && rot > -180 || rot == -90) { // the whole thing below from here just gradiates the color
      color interA = lerpColor(colorC, colorA, colour); // this function (lerpColor) allows gradiant coloring from one color to another
      // by that it means a color changes from one color to another, from A to B. The third parameter means where it changes
      // like if you put 0, it would be more towards colorC than colorA, where if 0.5 would be 50% of each color
      // and 1 would be more colorA than colorC. I've made this a variable to slowly gradiate from one color to another
      // using the float colour, that slowly increments from 0 to 1 between rotating.
      fill(interA);
      // and here we just fill it.
    } else if (rot < -180 && rot > -270 || rot == -180) {
      color interB = lerpColor(colorA, colorB, colour);
      fill(interB);
    } else if (rot < 0 && rot > -90 || rot == 0) {
      color interD = lerpColor(colorD, colorC, colour);
      fill(interD);
    } else if (rot < -270 && rot > -360 || rot == -270) {
      color interC = lerpColor(colorB, colorD, colour);
      fill(interC);
    }
  }
  rect(0, 0, 40, 40); // the rectangle we change the color of
  popMatrix(); // and then pop the matrix
}

float inc(float number, float inc, int limit) { // our function I'll explain each part seperately
  if (number < limit) { // if our number (colour which is 0) is lower than limit (1)
    number = number + inc; // we increment it with the value we also receive. Here 0.023, this specific number is picked because
    // it fit my code better. You can put anything, 1, 0.5, 0.1, etc.
  } else if (number >= limit) { // if our number then gets higher than or equal to 1, set it to 0 to restart
   number = 0;
  }
  colour = number; // this is rather inconvenient, but it works.
  return colour; // return our number so it works
}