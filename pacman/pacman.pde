// Variabler
int psize = 20; // Størrelse af alt (næsten)
int appx[]; // æblers xværdi
int appy[]; // æblers yværdi
int point = 0; // spiller 1 point
int rectSizeW = 200; // width (bredden) af rectanglerne
int rectSizeH = 60; // height (højden) af rectanglerne
int rectX = 0; // x værdien af rectanglerne
int rectY = 0; // y værdien af rectanglerne
int bodyx = 0; // x værdierne af første spillers slanges krop
int bodyy = 0; // y værdierne af første spillers slanges krop
int pangle = 0; // første spillers retning
int time = 0; // tid
boolean menu = true; // menu
boolean game = false; // spil
boolean spilOver = false; // er musen over en spiller?
boolean mHover = false; // har musen kørt over en af knapperne?
String description = "";

void setup() { // den værste setup i verden
  size(600, 500);
  // alt nedenunder er total stupidt
  rectX = width/2-rectSizeW/2; // vi sætter størrelsen af vores knappes rectangler
  rectY = height/2-rectSizeH; // både i x og i y
}

void mousePressed() { // vi tjekker om musen bliver trykket
  if (spilOver && menu) { // tjuhej, det gør den satme, men vi sikre os at den bliver trykket
    // over spilOver (vores knap) og at menu er true, ellers kan man trykke på den skide knap
    // hele tiden
    initiate(); // vi sender true fordi vi kan
  }
}

void initiate() { // her modtager vi enten true eller false
  game = true; // nu starter spillet de damer og herre
  menu = false; // og nu stopper menuen de damer og herre
}

void draw() {
  background(0); // farven på min sjæl
  update(); // her opdatere vi, kig længere nede for forklaring
  if (menu && !game) { // vi sikre os at menuen kører når menuen skal køre
    menu(); // hvad er der på menuen
  }
  if (game && !menu) { // vi sikre os at spillet kører når spillet skal køre
    game(); // spil
  }
}

void generate() { // vi laver æbler
}

// nu starter spillet endeligt
void game() {
  generate(); // lav æbler
  time+=1; // tiden starter, hver frame øger vi time med 1
  fill(255, 255, 255); // gør hvid
  //textSize(20); // tekst størrelse
  // vi vil spille multiplayer
  // vi viser point
  //text(point, width/2, height/4);

  // så laver vi slange
  fill(255, 255, 0);
  ellipse(bodyx+(psize/2), bodyy+(psize/2), psize, psize);
  fill(0,0,255);
  rect(0,0,width,20);
  rect(0,0,20,height);
  rect(width-20,0,20,height);
  rect(0,height-20,width,20);

  // her må man ikke røre væggen   
  if (bodyx > width-psize || bodyx < 0 || bodyy > height-psize || bodyy < 0) {
  }

  // hvis du får æble
  /*if (bodyx == appx[0] && bodyy[1] == appy[0]) {
   addLife(0); // så får du liv
   }*/

  textSize(30);
  textAlign(CENTER, BOTTOM);
  //text(int(scores[0]), width/2, height/6);
  if ((time % 10)==0) // det her giver effekten af at slangen bevæger sig langsomt
  {
    travel(); // se nede for forklaring
  }
}

void addLife() { // her tjekker vi hvem der fik
}

void menu() { // menuen
  fill(255, 255, 255); // fyld med hvid
  textSize(100);
  textAlign(CENTER, BOTTOM);
  text("PACMAN", width*0.5, height/4);
  textSize(15);
  text(description, width/2, height/2+100); // vores forklaring af spil
  if (spilOver) { // hvis musen er over spil ændre vi farven
    fill(color(150));
  } else {
    fill(color(255));
  }
  rect(rectX, rectY-75, rectSizeW, rectSizeH); // og laver firkanten
  textSize(25);
  fill(0, 0, 0);
  text("Spil", rectX+(rectSizeW/2), rectY-75+(rectSizeH*0.75)); // her er teksten
  text("To spillere", rectX+(rectSizeW/2), rectY+(rectSizeH*0.75)); // og igen
}

void travel() { // den interessante del
  switch(pangle) // vi kigger efter pangle og dets ændringer
  {
  case 0: // hvis pangle er 0
    bodyy += 20; // så øger vi y værdien med 20
    break; // og stopper indtil anden er fortalt
  case 90: // hvis pangle er 90
    bodyy -= 20;
    break;
  case 180: // hvis pangle er 180
    bodyx -= 20; // så øger vi x værdien med 20
    break;
  case 270: // hvis pangle er 270
    bodyx += 20;
    break;
  }
}

void update() { // vores funktion der håndtere menuen
  // menu
  if ( overRect(rectX, rectY-75, rectSizeW, rectSizeH) && menu ) { // hvis musen er over den rektangel
    spilOver = true;
    mHover = true;
    description = "Én spiller. WASD for at spille, fang de røde æbler for at blive størrere!\n"; // så ændre vi deskriptionen
    description += "Væggene dræber!"; // her tilføjer vi \n betyder ny linje
  } else {
    spilOver = false;
    if (!mHover) {
      description = "Kør over en af de to knapper for at få information omkring det spil!";
    } else {
      description = "Held og lykke!";
    }
  }
}

void keyPressed() { // hvis en knappe  bliver trykket
  if (key == 'w' || key == 'W' || keyCode == UP) { // hvis knappen er w eller W (hvis nu man har caps på)
    pangle = 90; // så ændre vi pangle til 90
    // pangle != 0 betyder at man ikke kan kigge nedad og så bare trykke w for at vende sig rundt 180 grader
    // det ville være skørt
    // (bodyy[1]-20)!=bodyy[2] sikre at man ikke kommer til at ramme sig selv ved at trykke for hurtigt
    // men det virker sku ikke
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    pangle = 0;
  }
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    pangle = 180;
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    pangle = 270;
  }
  // hvis man trykker escape
  if (key == ESC) {
    loop(); // vi starter igen, men det her virker ikke
    key = 0; // så escape ikke lukker programmet
    game = false; // vi stopper spillet
    menu = true; // starter menuen
    setup();
  }
}

boolean overRect(int x, int y, int width, int height) { // en funktion der holder øje med
  if (mouseX >= x && mouseX <= x+width && // om musen er indenfor x og y værdien
    mouseY >= y && mouseY <= y+height) { // så passer det hele ind
    return true; // ja det er den
  } else {
    return false; // nej det er den ikke
  }
}