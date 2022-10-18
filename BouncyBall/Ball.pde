//The whole beginning of this is generally the same as the example.
class Ball {
  color c;
  int s;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  Ball(color tempC, int tempS, float tempXpos, float tempYpos, float tempSpeed) {
    c = tempC;
    s = tempS;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempSpeed;
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(xpos, ypos, s, s);
  }
  void bounce() {
    //here's our bouncing
    yspeed += gravity; // we add gravity to yspeed
    xpos += xspeed; // we add xspeed to xpos
    ypos += yspeed; // and yspeed to ypos
    if (xpos > width-s/2) { // this whole thing below we check for corners or sides
    // if the balls hit one of the 4 sides, it's position will be set slightly
    // before as to avoid it being stuck in the wall, then the speed will be timed
    // with the friction, so that it will bounce back.
    // This can for example be seen by starting it and seeing how it bounces back
    // regardless. The balls will always be moving sideways due to the xspeed that's
    // been added above.
    // Not much else to say.
      xpos = width - s/2;
      xspeed *= friction;
    } else if (xpos < s) {
      xpos = s;
      xspeed *= friction;
    }
    if (ypos > height-s/2) {
      ypos = height - s/2;
      yspeed *= friction;
    } else if (ypos < s) {
      ypos = s;
      yspeed *= friction;
    }
  }
}