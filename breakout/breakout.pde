int pox = 0;
int ballx = 0;
int bally = 0;
int life = 0;
int rectSizeW = 200;
int rectSizeH = 60;
int rectX = 0;
int[] rectY;
int boxY = 200;
int[] boxX;
float bspeedy = 0;
float bspeedx = 0;
boolean aleneOver = false;
boolean menu = true;
boolean game = false;
boolean level = false;
boolean[] keys;
boolean[] boxBeat;

void setup() {
  size(800, 640);  // Make size of window
  rectX = width/2-rectSizeW/2;
  rectY=new int[3];
  rectY[0]=height/2-rectSizeH-75;
  rectY[1]=height/2-rectSizeH;
  rectY[2]=height/2-rectSizeH+75;
  keys=new boolean[4];
  keys[0]=false;
  keys[1]=false;
  keys[2]=false;
  keys[3]=false;
  boxX=new int[21];
  boxX[0]=-40;
  boxBeat=new boolean[21];
}

void mousePressed() {
  if (aleneOver && menu == true) {
    initiate();
  }
}

void initiate() {
  game = true;
  menu = false;
  ballx = width/2;
  bally = height-50;
  pox = width/2;
  bspeedx = width/200;
  bspeedy = height/200;
  for (int i=0; i < boxX.length; i++) {
    boxBeat[i] = false;
  }
}


void draw() {
  background(0);
  update(mouseX, mouseY);
  if (menu == true) {
    menu();
  }
  if (game == true) {
    game();
  }
}

void levelGenerate() {
  for (int i=1; i < boxX.length; i++) {
    boxX[i] = boxX[i-1] + 40;
  }

  for (int i=1; i < boxX.length; i++) {
    if (boxBeat[i] != true) {
      rect(boxX[i], boxY, 40, 25);
    }
  }
}

void game() {
  levelGenerate();
  fill(255, 255, 255);
  rect(pox, height-40, width/10, 10);
  ballx = int(bspeedx + ballx);
  bally = int(bspeedy + bally);
  ellipse(ballx, bally, 10, 10);
  textSize(10);
  textAlign(TOP, BOTTOM);
  text((height-boxY)-25, 25, 25);
  text(height-boxY, 25, 35);
  if (ballx > pox && ballx < pox+width/10) {
    if (bally > height-50 && bally < height-40) {
      bspeedy = bspeedy * -1;
    }
  }
  for (int i=1; i < boxX.length; i++) {
    if (bally > (height-boxY)-25 && bally < height-boxY) {
      if (ballx < boxX[i] && ballx > boxX[i]-2 || ballx > boxX[i]+40 && ballx < boxX[i]+38) {
        bspeedx = bspeedx * -1;
      }
    }
  }
  for (int i=1; i < boxX.length; i++) {
    if (ballx > boxX[i] && ballx < boxX[i]+40) {
      if (bally > boxY && bally < boxY+30) {
        if (boxBeat[i] == false) {
          bspeedy = bspeedy * -1;
          boxBeat[i] = true;
        }
      }
    }
  }
  if (ballx > width) {
    bspeedx = bspeedx * -1;
  }
  if (ballx < 0) {
    bspeedx = bspeedx * -1;
  }
  if (bally < 0) {
    bspeedy = bspeedy * -1;
  }
  if (bally > height) {
    bspeedy = bspeedy * -1;
  }
  if (keys[0] && pox > 0) {
    pox -= 8;
  }
  if (keys[1] && pox < width-(width/10)) {
    pox += 8;
  }
}

void menu() {
  fill(255, 255, 255);
  textSize(100);
  textAlign(CENTER, BOTTOM);
  text("Breakout", width*0.5, height/4);
  if (aleneOver) {
    fill(color(150));
  } else {
    fill(color(255));
  }
  rect(rectX, rectY[0], rectSizeW, rectSizeH);
  textSize(25);
  fill(0, 0, 0);
  text("Alene", rectX+(rectSizeW/2), rectY[0]+(rectSizeH*0.75));
}

void update(int x, int y) {
  if ( overRect(rectX, rectY[0], rectSizeW, rectSizeH) ) {
    aleneOver = true;
  } else {
    aleneOver = false;
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    keys[0]=true;
  }
  if (key == 'd' || key == 'D') {
    keys[1]=true;
  }
  if (key == ESC) {
    key = 0;
    game = false;
    menu = true;
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') {
    keys[0]=false;
  }
  if (key == 'd' || key == 'D') {
    keys[1]=false;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}