color[] Color;
int time = 0;
int colorTime = 1;
int sqrW = 0;
int sqrH = 0;
int veOpY = 0;
int hoOpY = 0;
int hoOpX = 0;

int level = 1;

void setup() {
  size(900, 600); 
  Color = new color[4];
  Color[0] = 0;
  Color[1] = 0;
  Color[2] = 0;
  Color[3] = 0;
  sqrW = width/2;
  sqrH = height/2;
  veOpY = (height/4)-20; 
  hoOpY = (height/4);
  hoOpX = (width/2)+width/4;
}

void draw() {
  background(255);
  levelSetup();
  addPlay();
  addEnemies();
}

void levelSetup() {
  time += 1;
  for (int i = 0; i < colorTime; i++) {
    color gradColor = 1;
    if ((time % 2) == 0 && Color[i] <= 254) {
      gradColor += 1;
      Color[i] += gradColor;
    }
    if ((time % 100) == 0 && colorTime < level) {
       colorTime = colorTime+1; 
    }
  }
  if ((time % 500) == 0 && level <= 3) {
   level++; 
  }
  fill(Color[0]);
  rect(0, 0, sqrW, sqrH);
  fill(Color[1]);
  rect(width/2, 0, sqrW, sqrH);
  fill(Color[2]);
  rect(0, height/2, sqrW, sqrH);
  fill(Color[3]);
  rect(width/2, height/2, sqrW, sqrH);
}

void addPlay() {
  if (level >= 1) {
    fill(Color[0]);
    for (int i = -60; i < 40; i = i + 20) {
      rect(((width/4)-10), ((height/4)+i), 10, 20);
    }
    fill(0, 0, Color[0]);
    rect(((width/4)-10), (veOpY), 10, 20);
    
    println(Color[0]);
    fill(0,0,Color[0]);
    ellipse(hoOpX, hoOpY, 25, 25);
  }
}

void addEnemies() {
  
}

void keyReleased() {
  if (veOpY <= 150 && key == 's') {
    veOpY += 20;
  } else if (veOpY >= 110 && key == 'w') {
   veOpY -= 20; 
  }
}