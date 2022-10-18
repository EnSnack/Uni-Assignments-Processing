int poy = 0;
int pty = 0;
int ballx = 0;
int bally = 0;
int pointo = 0;
int pointt = 0;
int streak = 0;
int rectSizeW = 200;
int rectSizeH = 60;
int rectX = 0;
int[] rectY;
float bspeedy = 0;
float bspeedx = 0;
boolean ai = false;
boolean pws = false;
boolean aleneOver = false;
boolean computerOver = false;
boolean spillerOver = false;
boolean menu = true;
boolean game = false;
boolean[] keys;

void setup() {
  size(900, 640);  // Make size of window
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
}

void mousePressed() {
  if (aleneOver && menu == true) {
    pointo = 10;
    pointt = 10;
    initiate();
    pws = true;
  }
  if (computerOver && menu == true) {
    pointo = 0;
    pointt = 0;
    initiate();
    ai = true;
  }
  if (spillerOver && menu == true) {
    pointo = 0;
    pointt = 0;
    initiate();
  }
}

void initiate() {
  game = true;
  menu = false;
  ballx = width/2;
  bally = height/2;
  poy = height/2;
  pty = height/2;
  bspeedx = width/200;
  bspeedy = height/200;
  ai = false;
  pws = false;
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

void game() {
  fill(255,255,255);
  rect(40, poy, 10, height/10);
  rect(width-50, pty, 10, height/10);
  ballx = int(bspeedx + ballx);
  bally = int(bspeedy + bally);
  ellipse(ballx, bally, 10, 10);
  textSize(100);
  textAlign(TOP, BOTTOM);
  text(pointo, width/4.5, height/6.4);
  text(pointt, width-300, height/6.4);
  if (streak > 3) {
    textAlign(CENTER, BOTTOM);
    textSize(10);
    text(streak, width/2, height/6, 4);
  }
  if (bally < 0 || bally > height) {
    bspeedy = int(bspeedy * -1);
  }
  if (ballx > 35 && ballx < 60) {
    if (bally > poy && bally < poy+(height/10)) {
      bspeedx = bspeedx * -1.05;
      if (pws == true) {
        streak++;
      }
    }
  }
  if (ballx < (width-35) && ballx > (width-60)) {
    if (bally > pty && bally < pty+(height/10)) {
      bspeedx = bspeedx * -1.05;
      if (pws == true) {
        streak++;
      }
    }
  }
  if (ballx > width) {
    ballx = width/2;
    bally = height/2;
    streak = 0;
    if (pws == true) {
      pointo = pointo - 1;
      pointt = pointt - 1;
    } else {
      pointo++;
    }
    bspeedx = 4;
  } else if (ballx < 0) {
    ballx = width/2;
    bally = height/2;
    streak = 0;
    if (pws == true) {
      pointt--;
      pointo--;
    } else {
      pointt++;
    }
    bspeedx = -4;
  }
  if (pointo == 10 && pws == false || pws == true && pointo == 0) {
    //exit();
  } else if (pointt == 10 && pws == false) {
    //exit();
  }
  if (keys[0] && poy > 0) {
    poy -= 8;
    if (pws == true) {
      pty -= 8;
    }
  }
  if (keys[1] && poy < height-(height/10)) {
    poy += 8;
    if (pws == true) {
      pty += 8;
    }
  }
  if (keys[2] && pty > 0 && ai == false && pws == false) {
    pty -= 8;
  }
  if (keys[3] && pty < height-(height/10) && ai == false && pws == false) {
    pty += 8;
  }
  if (ai == true && pty > bally+5 && pty > 0) {
    pty -= 3.5;
  } else if (ai == true && pty < bally+5 && pty < height-(height/10)) {
    pty += 3.5;
  }
}

void menu() {
 fill(255,255,255);
 textSize(100);
 textAlign(CENTER, BOTTOM);
 text("Ping Pong", width*0.5, height/4);
 if (aleneOver) {
   fill(color(150));
 } else {
   fill(color(255));
 }
 rect(rectX, rectY[0], rectSizeW, rectSizeH);
  if (computerOver) {
   fill(color(150));
 } else {
   fill(color(255));
 }
 rect(rectX, rectY[1], rectSizeW, rectSizeH);
  if (spillerOver) {
   fill(color(150));
 } else {
   fill(color(255));
 }
 rect(rectX, rectY[2], rectSizeW, rectSizeH);
 textSize(25);
 fill(0,0,0);
 text("Alene", rectX+(rectSizeW/2), rectY[0]+(rectSizeH*0.75));
 text("Mod Computer", rectX+(rectSizeW/2), rectY[1]+(rectSizeH*0.75));
 text("Mod Spiller", rectX+(rectSizeW/2), rectY[2]+(rectSizeH*0.75));
}

void update(int x, int y) {
  if ( overRect(rectX, rectY[0], rectSizeW, rectSizeH) ) {
    aleneOver = true;
    computerOver = false;
    spillerOver = false;
  } else if ( overRect(rectX, rectY[1], rectSizeW, rectSizeH) ) {
    computerOver = true;
    aleneOver = false;
    spillerOver = false;
  } else if ( overRect(rectX, rectY[2], rectSizeW, rectSizeH) ) {
    spillerOver = true;
    computerOver = false;
    aleneOver = false;
  } else {
    aleneOver = computerOver = spillerOver = false;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    keys[0]=true;
  }
  if (key == 's' || key == 'S') {
    keys[1]=true;
  }
  if (keyCode == UP && ai == false && pws == false) {
    keys[2]=true;
  }
  if (keyCode == DOWN && ai == false && pws == false) {
    keys[3]=true;
  }
  if (key == ESC) {
   key = 0;
   game = false;
   menu = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    keys[0]=false;
  }
  if (key == 's' || key == 'S') {
    keys[1]=false;
  }
  if (keyCode == UP && ai == false && pws == false) {
    keys[2]=false;
  }
  if (keyCode == DOWN && ai == false && pws == false) {
    keys[3]=false;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}