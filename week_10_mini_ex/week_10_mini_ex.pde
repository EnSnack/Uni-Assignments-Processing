PFont f;
String message[];
int time = 0;
int level = 1;

void setup() {
  size(400, 150);
  f = createFont("Courier New", 20, true);
  frameRate(3);   //default 60
  message = new String[5];
  message[0] = "Hello...";
  message[1] = "How are you?";
  message[2] = "I'm fine. Thanks for asking.";
}

void draw() { 
  time+=1;
  loadtextfile();
  background(255);
  textFont(f);         
  int x = 10;
  if ((time % 1) == 0) {
    for (int i = 0; i < time; i++) {
      fill(0);
      text(message[level].charAt(i), x, height/2);
      x += textWidth(message[level].charAt(i)); 
      if (time > message[level].length()) {
        noLoop();
        delay(1000);
        loop();
        level++;
        time = 0;
      }
    }
  }
}

void loadtextfile() {
  String [] lines = loadStrings("questions.txt"); 
  println("there are " + lines.length + " lines"); 
  for (int i = 0 ; i < lines.length; i++) { 
    println(lines[i]);
   }  
}