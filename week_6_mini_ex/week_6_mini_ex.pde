/** Assignment from AP class
Week 6 Mini Ex
Randomly generate lines based on width (since width and height is same value)
14th February 2016
**/

int[] ra = new int[4]; // Make integer array for random numbers
void setup() { size(600, 600); }  // Make size of window
void draw() {
  if(keyPressed == true) { // Make sure a key is pressed, any key
    for (int i = 0; i < 4; i++) { // Fill array using a for statement
      int r = int(random(width)); // Generate random numbers, convert to int so it looks nice.
      ra[i] = r; // Fill ra array with r values
    }
    line(ra[0], ra[1], ra[2], ra[3]); // Make random lines using ra's values
}}