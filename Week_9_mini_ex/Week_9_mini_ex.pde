/** Assignment from AP Class
Week 9 Mini Ex - A Calculator
A kind of unorthodox calculator that works a tad differently than it normally would
as you normally would have a function for each calculation and return the value
6th March, 2016
**/

int rectX[]; // The buttons' x values
int rectY[]; // The buttons' y values
int bSize = 30; // Size of the buttons
String firstVal = "0"; // First value in calculation (First number)
String secondVal = "0"; // Second value (second number)
float result = 0; // The result, we make it a float so division works too
int calc = 1; // What calculation is being done.
boolean valC = false; // Is først value calculated?
boolean resOK = false; // Should the result be shown?
float bMidX = bSize/2.5; // X's mid on button
float bMidY = bSize/1.5; // Y's mid on button
String hvadErDet = "+"; // What's been pressed? (+,-,*,/)

// Now we set everything up
void setup() {
  size(300, 300);
  // Here we make the rectangles x values.
  rectX = new int[100];
  rectX[1] = 80;
  // Here the y values.
  rectY = new int[100];
  rectY[1] = 200;
}

// Now we draw
void draw() {
  // Background color is gray
  background(122);
  // We draw the buttons now
  drawButtons();
}

// Function to draw the buttons
void drawButtons() {
  // Draw the buttons to press
  fill(255);
  // Here we draw 9 buttons from 1-9 (we ignore 0 because it gets a unique pos)
  for (int i = 1; i <= 9; i++) {
    // If the rectangle's X value is lower than or equal to 160
    if (rectX[i] <= 160) {
      // Make the next value the value of the current value, plus 40
      // This is to make sure the button is slightly more to the right than the
      // previous button
      rectX[i+1] = rectX[i] + 40;
      // Make Y value the same Y value. (See below for exemption)
      rectY[i+1] = rectY[i];
      // Now we make rectangles
      rect(rectX[i], rectY[i], bSize, bSize);
      fill(0);
      // If i is lower than or equal to 9
      // we make text on the buttons, right in the center.
      if (i <= 9) {
        text(i, rectX[i]+(bSize/2.5), rectY[i]+(bSize/1.5));
      }
      fill(255);
    } else {
      // if the rectangle's x value is bigger than 160, we make it 80 so we start over
      rectX[i] = 80;
      // we decrement i by 1, this is to make sure we don't skip this number,
      // after all, this too needs to get added. If we were to not include this
      // it would ignore one button each time, and therefore we'd only have ~6 buttons.
      i = i-1;
      // here we make the buttons increase a bit.
      rectY[i+1] = rectY[i] - 40;
    }
  }
  // These buttons a bit unorthodox, so we'll have to create them manually
  // Equal
  rect(200, 160, bSize, bSize*2+10);
  fill(0);
  text("=", 200+bMidX, 160+bMidY*2);
  fill(255);
  // Minus
  rect(200, 80, bSize, bSize);
  fill(0);
  text("-", 200+bMidX, 80+bMidY);
  fill(255);
  // Plus
  rect(200, 120, bSize, bSize);
  fill(0);
  text("+", 200+bMidX, 120+bMidY);
  fill(255);
  // 0
  rect(120, 240, bSize, bSize);
  fill(0);
  text("0", 120+bMidX, 240+bMidY);
  fill(255);
  // Times
  rect(160, 80, bSize, bSize);
  fill(0);
  text("*", 160+bMidX, 80+bMidY);
  fill(255);
  // Divide
  rect(120, 80, bSize, bSize);
  fill(0);
  text("/", 120+bMidX, 80+bMidY);
  fill(255);
  // Result screen
  // This is where we show our result value
  rect(80, 0, bSize*5, bSize*2.5);
  fill(0);
  // If value should not be shown, we should rather show what is being calculated
  // right now.
  if (!resOK) {
    text(firstVal + "" + hvadErDet + "" + secondVal, 80+bMidX, 0+bMidY*2);
  } else {
    // Else we show the result that is calculated.
    text(result, 80+bMidX*5.25, 0+bMidY*2);
  }
  fill(255);
}

// If mouse is pressed.
void mousePressed() {
  // Check every button so we know what is being clicked
  for (int i = 0; i <= 9; i++) {
    // We call the overRect function, I have used this function before
    // but you can scroll down to the function to read an explanation of it
    if (overRect(rectX[i], rectY[i], bSize, bSize)) {
      // if first value is not done yet, and its length is lower than 9.
      // I use valC to allow people to use more than just one number.
      // With this, they can put numbers up till 9 in length.
      if (!valC && firstVal.length() < 9) {
        // if the first value is 0, we should replace it so it doesn't become
        // 09999 for example, instead of 9999.
        if (firstVal == "0") {
          firstVal = str(i);
        } else {
          // but if first value is not 0, we just add numbers onto.
          firstVal += i;
        }
        // Make sure result should not be shown.
        resOK = false;
        // else if valC is true (allows us to change to second number)
      } else if (valC && secondVal.length() < 9) {
        // we do the same here, not much to say.
        if (secondVal == "0") {
          secondVal = str(i);
        } else {
          secondVal += i;
        }
      }
    }
    // If the 0 button is being clicked
    if (overRect(120, 240, bSize, bSize)) {
      // if valC is false (to make sure to add to first value)
      // and firstValue is not already 0
      // we add a 0 to first value.
      if (!valC && firstVal != "0") {
        firstVal += "0";
        break;
        // we add a 0 to second value
      } else if (valC && secondVal != "0") {
        secondVal += "0";
        break;
      }
    }
  }
  // if the mouse is over + and is clicked, we call the value function
  // with the value 1
  if (overRect(200, 120, bSize, bSize)) {
    value(1);
  }
  // if the mouse is over = and is clicked, we call the calculate function
  if (overRect(200, 160, bSize, bSize*2+10)) {
    calculate();
  }
  // call value function 2 if over -
  if (overRect(200, 80, bSize, bSize)) {
    value(2);
  }
  // call value function 3 if over *
  if (overRect(160, 80, bSize, bSize)) {
    value(3);
  }
  // call value function 4 if over /
  if (overRect(120, 80, bSize, bSize)) {
    value(4);
  }
}

// This checks if the mouse is above a certain place.
// I use x and y for the mouse values, which means it checks
// if x and y is inbetween width and height (which here means
// the values that are sent, aka if you send it 100 and 200
// it checks if the mouse is inbetween 100 and 200, then returns
// true.)
boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

// this is our value function, we use mode as a check
// to see what we should be calculating and what mode
// we're running.
void value(int mode) {
  // calc is set to mode
  calc = mode;
  // valC is set to true so second value should be changed instead
  // of first value.
  valC = true;
  // this is a switch statement
  // its kind of a long if statement.
  // cases mean if mode is 1 we do one thing
  // but if mode is 2 we do another
  // we break so it doesn't continue
  switch(mode) {
  // if mode is 1
  case 1:
    // set hvadErDet to "+" so it shows "+" instead of something else
    hvadErDet = "+";
    // break it, so it doesn't do every other case too.
    break;
  case 2:
    hvadErDet = "-";
    break;
  case 3:
    hvadErDet = "*";
    break;
  case 4:
    hvadErDet = "/";
    break;
  }
  // if resOK is true
  if (resOK) {
    // set it to false
    resOK = false;
    // set first value to result, this means if you have calculated something
    // say 2+2, and click plus again. It allows you to continue your calculation
    // so you can do 4+2 instead of having to type that in. You just click
    // plus, then click your new number.
    firstVal = str(result);
    // set valC to true, so we change second value.
    valC = true;
  }
}

// here we calculate.
void calculate() {
  // another switch statement, look above for explanation for switch statements
  switch(calc) {
  // since we start at 1 and above, 0 should never happen, if it does
  // we catch an error and tell the user that an error has happened.
  case 0:
    println("ERROR");
    break;
  // if calc is 1, set result to be the first value plus the second value.
  // we continue this downwards with different calculations.
  case 1:
    result = int(firstVal) + int(secondVal);
    break;
  case 2:
    result = int(firstVal) - int(secondVal);
    break;
  case 3:
    result = int(firstVal) * int(secondVal);
    break;
  // here we float instead of int, because we want decimal numbers.
  case 4:
    result = float(firstVal) / float(secondVal);
    break;
  }
  // set first value to 0
  firstVal = "0";
  // set second value to 0
  secondVal = "0";
  // show result
  resOK = true;
  // set valC to false, so first number will be edited if someone is changing something
  valC = false;
}