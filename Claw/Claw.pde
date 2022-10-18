void setup() {
  size(900, 640);  // Make size of window

}

void mousePressed() {

}

void draw() {
 background(0);
 update(mouseX, mouseY);
 if(menu == true) {
  menu(); 
 }
 if (game == true) {
  game();
 }
}