/*
 Snake i Processing
 Alt nedenstående er kommenteret til et forståeligt niveau.
 Hvis det ikke er kommenteret, så skulle det være forståeligt nok.
 Hvis det ikke er kommenteret og ikke forståeligt, så kan jeg ikke hjælpe.
 Hvis det er forståeligt og forvirrende, så kan jeg ikke hjælpe.
 Hvis der er noget der kan gøres bedre, så godt, men det virker.
 Yderligere informationer gives ikke.
 
 Er spillet kodet optimelt? Nej
 Virker det? Ja
 Er der så problemer? Nej
 
 Held og Lykke!
*/

// Variabler
int psize = 20; // Størrelse af alt (næsten)
int appx[]; // æblers xværdi
int appy[]; // æblers yværdi
int point = 0; // spiller 1 point
int pointt = 0; // spiller 2 point
int rectSizeW = 200; // width (bredden) af rectanglerne
int rectSizeH = 60; // height (højden) af rectanglerne
int rectX = 0; // x værdien af rectanglerne
int rectY = 0; // y værdien af rectanglerne
int bodyx[]; // x værdierne af første spillers slanges krop
int bodyy[]; // y værdierne af første spillers slanges krop
int bodytx[]; // x værdierne af anden spillers slanges krop
int bodyty[]; // y værdierne af anden spillers lange krop 
int body = 2; // antal af kroppe for første spiller hvorfor starter vi på 2?
int bodyt = 2; // antal af kroppe for anden spiller hvem ved?
int pangle = 0; // første spillers retning
int tangle = 90; // anden spillers retning
int time = 0; // tid
boolean menu = true; // menu
boolean game = false; // spil
//boolean difficulty = false; glem den her
boolean tspil = false; // to spillere?
boolean spilOver = false; // er musen over en spiller?
boolean tspilOver = false; // næ den er over to
/*boolean nemOver = false; glem det her
 boolean svaerOver = false; kig ikke på det her igen
 boolean omvendtOver = false; glem at du har set det her
 boolean turboOver = false;*/
boolean apple = false; // er der et æble?
boolean appt = false; // æble til spiller to?
boolean appo = false; // æble til spiller et.
boolean mHover = false; // har musen kørt over en af knapperne?
String line; // jeg ved ikke hvad det her er
String description = "Hello World!"; // deskriptionen for spillet
String scores[]; // det her virker ikke

void setup() { // den værste setup i verden
  size(600, 500);
  // alt nedenunder er total stupidt
  rectX = width/2-rectSizeW/2; // vi sætter størrelsen af vores knappes rectangler
  rectY = height/2-rectSizeH; // både i x og i y
  bodyx=new int[1500]; // indføre tal i vores array
  bodyx[0]=0;
  bodyx[1]=width/2-40; // vi sætter første krop cirka i midten ellers starter den i venstre hjørne
  bodyy=new int[1500];
  bodyy[0]=0;
  bodyy[1]=height/2-30; // det gør vi også med y værdi
  bodytx=new int[1500];
  bodytx[0]=0;
  bodytx[1]=width/2+40; // anden krop
  bodyty=new int[1500];
  bodyty[0]=0;
  bodyty[1]=height/2+30; // og igen
  appx=new int[3]; //æbler, der er ingen grund til at der står 3 der, men der står 3 der.
  appx[0]=0;
  appy=new int[3];
  appy[0]=0;
}

void mousePressed() { // vi tjekker om musen bliver trykket
  if (spilOver && menu) { // tjuhej, det gør den satme, men vi sikre os at den bliver trykket
    // over spilOver (vores knap) og at menu er true, ellers kan man trykke på den skide knap
    // hele tiden
    initiate(true); // vi sender true fordi vi kan
  } 
  if (tspilOver && menu) { // nu bliver to spiller knappen trykket
    initiate(false); // og så sender vi false i stedet
  }
}

void initiate(boolean mode) { // her modtager vi enten true eller false
  game = true; // nu starter spillet de damer og herre
  menu = false; // og nu stopper menuen de damer og herre
  if (mode == true) { // hvis vi modtager true
    tspil = false; // så skal der ikke være multiplayer
  } else { // men hvis vi modtager alt andet end true
    tspil = true; // så skal der være multiplayer
  }
}

void draw() {
  background(0); // farven på min sjæl
  update(); // her opdatere vi, kig længere nede for forklaring
  if (menu && !game) { // vi sikre os at menuen kører når menuen skal køre
    menu(); // hvad er der på menuen
    /*if (difficulty) {
     difficulty();
     }*/
  }
  if (game && !menu) { // vi sikre os at spillet kører når spillet skal køre
    game(); // spil
  }
}

void generate() { // vi laver æbler
  if (appo && appt && tspil) { // laver æbler til multiplayer
    for (int i=0; i<2; i++) { // her gør vi farverne forskellige per æble
      if (i == 0) { // hvis i er 0
        fill(255, 0, 0); // så skal den være rød
      } else if (i == 1) { // hvis i er 1
        fill(0, 0, 255); // så skal den være blå
      }
      rect(appx[i], appy[i], psize, psize); // lave æble
    }
  } else if (apple && !tspil) { // lave æbler til spiller 1
    fill(255, 0, 0); // de skal bare være røde
    rect(appx[0], appy[0], psize, psize); // lave æble
  } else
  {
    for (int i=0; i<2; i++) { // her sikre vi os at der bliver lavet nye æbler 
      // så længe at der er æbler der skal laves
      appy[i] = 20 * int(random(0, (height-psize)/20)); // det skal jo være tilfældigt ikke?
      // vi dividere og ganger med 20 for at sikre os at æblet landet på noget der kan divideres med 20
      // det gør altså at æblet altid lander på noget der kan divideres med 20
      appx[i] = 20 * int(random(0, (width-psize)/20)); // hej
    }
    apple = true; // nu hvor vi har lavet æbler
    appo = true; // viser vi at æbler er lavet
    appt = true;
  }
}

// nedenstående er en fiasko, glem det.
/*void difficulty() {
 background(0,0,0);
 fill(255, 255, 255);
 textSize(50);
 textAlign(CENTER, BOTTOM);
 text("Sværhedsgrad", width*0.5, height/5);
 textSize(15);
 text(description, width/2-100, height/2-50);
 if (nemOver) {
 fill(color(150));
 } else {
 fill(color(255));
 }
 rect(rectX+75, rectY-75, rectSizeW, rectSizeH);
 if (svaerOver) {
 fill(color(150));
 } else
 {
 fill(color(255));
 }
 rect(rectX+75, rectY, rectSizeW, rectSizeH);
 if (omvendtOver) {
 fill(color(150));
 } else
 {
 fill(color(255));
 }
 rect(rectX+75, rectY+75, rectSizeW, rectSizeH);
 if (turboOver) {
 fill(color(150));
 } else
 {
 fill(color(255));
 }
 rect(rectX+75, rectY+150, rectSizeW, rectSizeH);
 textSize(25);
 fill(0, 0, 0);
 text("Nemt", rectX+75+(rectSizeW/2), rectY-75+(rectSizeH*0.75));
 text("Svært", rectX+75+(rectSizeW/2), rectY+(rectSizeH*0.75));
 text("Omvendt", rectX+75+(rectSizeW/2), rectY+75+(rectSizeH*0.75));
 text("Turbo", rectX+75+(rectSizeW/2), rectY+150+(rectSizeH*0.75));
 }*/

// nu starter spillet endeligt
void game() {
  generate(); // lav æbler
  time+=1; // tiden starter, hver frame øger vi time med 1
  fill(255, 255, 255); // gør hvid
  textSize(20); // tekst størrelse
  // vi vil spille multiplayer
  if (tspil) {
    // her vil vi have at spilleren kan se sine point
    fill(255, 0, 0);
    text(point + "/20", width/3-50, height/5);
    fill(0, 0, 255);
    text(pointt + "/20", width/2+125, height/5);

    // så laver vi spillerneskroppe
    fill(255, 0, 0); // rød farve til rød spiller
    rect(bodyx[1], bodyy[1], psize, psize); // vi starter fra 1 fordi det sjovt
    for (int i = 1; i < body; i++) { // vi laver en krop for hver tal der er i body
      rect(bodyx[i], bodyy[i], psize, psize); // og så laver vi dem
    }
    // vi gør det samme nedenunder
    fill(0, 0, 255);
    rect(bodytx[1], bodyty[1], psize, psize);
    for (int i = 1; i < bodyt; i++) {
      rect(bodytx[i], bodyty[i], psize, psize);
    }

    // for at vinde
    if (point >= 20) { // hvis point er størrere end 20 så vinder spiller 1
      textSize(30);
      fill(255, 0, 0);
      text("Red won!", width/2, height/4);
      noLoop();
    } else if (pointt >= 20) { // hvis pointt er størrere end 20 så vinder spiller 2
      textSize(30);
      fill(0, 0, 255);
      text("Blue won!", width/2, height/4);
      noLoop();
    }

    // her lader vi slangerne teleportere hvis de rør væggene
    // til rød
    if (bodyx[1] > width-psize) { // hvis hovedet er størrere en bredden
      bodyx[1] = 0; // sæt til nul
    } else if (bodyx[1] < 0) { // osv
      bodyx[1] = width-psize;
    }
    if (bodyy[1] > height-psize) {
      bodyy[1] = 0;
    } else if (bodyy[1] < 0) {
      bodyy[1] = height-psize;
    }

    // blå
    if (bodytx[1] > width-psize) {
      bodytx[1] = 0;
    } else if (bodytx[1] < 0) {
      bodytx[1] = width-psize;
    }
    if (bodyty[1] > height-psize) {
      bodyty[1] = 0;
    } else if (bodyty[1] < 0) {
      bodyty[1] = height-psize;
    }
    // kunne dette gøres lettere?
    // ja
    // gør jeg det lettere?
    // næ

    // at få æbler
    if (bodyx[1] == appx[0] && bodyy[1] == appy[0]) {
      addLife(1); // vi kalder addLife med 1
    } else if (bodytx[1] == appx[1] && bodyty[1] == appy[1]) {
      addLife(2); // nu med 2
    }

    // dræbe slanger hvis de rør hinanden
    for (int i = 1; i < body; i++) { // vi starter på 1
      if (bodyx[1] == bodyx[i+1] && bodyy[1] == bodyy[i+1]) { // hvis og hvis min røv er
        textSize(30);
        text("Blue won!", width/2, height/4);
        noLoop();
      }
      for (int j = 1; j < bodyt; j++) {
        if (bodyx[1] == bodytx[j] && bodyy[1] == bodyty[j]) {
          textSize(30);
          text("Blue won!", width/2, height/4);
          noLoop();
        }
      }
    }
    for (int i = 1; i < bodyt; i++) {
      if (bodytx[1] == bodytx[i+1] && bodyty[1] == bodyty[i+1]) {
        textSize(30);
        text("Red won!", width/2, height/4);
        noLoop();
      }
      for (int j = 1; j < body; j++) {
        if (bodytx[1] == bodyx[j] && bodyty[1] == bodyy[j]) {
          textSize(30);
          text("Red won!", width/2, height/4);
          noLoop();
        }
      }
    }

    // hvis det ikke er multiplayer aka singleplayer aka spille alene
  } else if (!tspil) {
    // vi viser point
    text(point, width/2, height/4);

    // så laver vi slange
    fill(255, 255, 255);
    rect(bodyx[1], bodyy[1], psize, psize);
    for (int i = 1; i < body; i++) {
      rect(bodyx[i], bodyy[i], psize, psize);
    }

    // her må man ikke røre væggen   
    if (bodyx[1] > width-psize || bodyx[1] < 0 || bodyy[1] > height-psize || bodyy[1] < 0) {
      textSize(30);
      text("You lost!", width/2, height/5);
      noLoop();
    }

    // hvis du får æble
    if (bodyx[1] == appx[0] && bodyy[1] == appy[0]) {
      addLife(0); // så får du liv
    }

    // hvis du rør dig selv
    for (int i = 2; i < body; i++) {
      if (bodyx[1] == bodyx[i] && bodyy[1] == bodyy[i]) {
        textSize(30);
        text("You lost!", width/2, height/5); // så dør du
        noLoop();
      }
    }
  }
  textSize(30);
  textAlign(CENTER, BOTTOM);
  //text(int(scores[0]), width/2, height/6);
  if ((time % 5)==0) // det her giver effekten af at slangen bevæger sig langsomt
  {
    travel(); // se nede for forklaring
  }
}

void addLife(int whoGot) { // her tjekker vi hvem der fik
  if (whoGot == 1) { // hvis det var 1 (spiller 1)
    appo = false; // så fjerner vi æblet
    body++; // øger størrelsen
    point++; // og giver point
  } else if (whoGot == 2) { // hvis det var 2 (spiller 2)
    appt = false;
    bodyt++;
    pointt++;
  } else { // hvis det var 0 (spiller 1 alene)
    apple = false;
    body++;
    point++;
  }
}

void menu() { // menuen
  fill(255, 255, 255); // fyld med hvid
  textSize(100);
  textAlign(CENTER, BOTTOM);
  text("SNAKE", width*0.5, height/4);
  textSize(15);
  text(description, width/2, height/2+100); // vores forklaring af spil
  if (spilOver) { // hvis musen er over spil ændre vi farven
    fill(color(150));
  } else {
    fill(color(255));
  }
  rect(rectX, rectY-75, rectSizeW, rectSizeH); // og laver firkanten
  if (tspilOver) { // igen bare med over to spillere
    fill(color(150));
  } else
  {
    fill(color(255));
  }
  rect(rectX, rectY, rectSizeW, rectSizeH);
  textSize(25);
  fill(0, 0, 0);
  text("Spil", rectX+(rectSizeW/2), rectY-75+(rectSizeH*0.75)); // her er teksten
  text("To spillere", rectX+(rectSizeW/2), rectY+(rectSizeH*0.75)); // og igen
}

void travel() { // den interessante del
  for (int i=body; i > 0; i--) { // det her gør at kroppen bevæger sig langsomt en kasse af gangen
    if (i!=1) { // vi vil selvfølgelig ikke have at kroppe 1 gør det
      bodyx[i]=bodyx[i-1]; // både x og y
      bodyy[i]=bodyy[i-1];
    } else
    {
      switch(pangle) // vi kigger efter pangle og dets ændringer
      {
      case 0: // hvis pangle er 0
        bodyy[1] += 20; // så øger vi y værdien med 20
        break; // og stopper indtil anden er fortalt
      case 90: // hvis pangle er 90
        bodyy[1] -= 20;
        break;
      case 180: // hvis pangle er 180
        bodyx[1] -= 20; // så øger vi x værdien med 20
        break;
      case 270: // hvis pangle er 270
        bodyx[1] += 20;
        break;
      }
    }
  }
  if (tspil) { // hvis der er to spillere gør vi det samme bare med spiller to også
    for (int i=bodyt; i > 0; i--) {
      if (i!=1) {
        bodytx[i]=bodytx[i-1];
        bodyty[i]=bodyty[i-1];
      } else
      {
        switch(tangle)
        {
        case 0:
          bodyty[1] += 20;
          break;
        case 90:
          bodyty[1] -= 20;
          break;
        case 180:
          bodytx[1] -= 20;
          break;
        case 270:
          bodytx[1] += 20;
          break;
        }
      }
    }
  }
}

void update() { // vores funktion der håndtere menuen
  // menu
  if ( overRect(rectX, rectY-75, rectSizeW, rectSizeH) && menu ) { // hvis musen er over den rektangel
    spilOver = true;
    mHover = true;
    description = "Én spiller. WASD for at spille, fang de røde æbler for at blive størrere!\n"; // så ændre vi deskriptionen
    description += "Væggene dræber!"; // her tilføjer vi \n betyder ny linje
  } else if (overRect(rectX, rectY, rectSizeW, rectSizeH) && menu) { // hvis musen er over dén rektangel
    tspilOver = true;
    mHover = true;
    description = "To spillere. Spiller 1 bruger WASD, spiller 2 bruger piletasterne!\n";
    description += "Spiller 1 skal fange de røde æbler, spiller 2 de blå!\n";
    description += "Her er væggene ikke farlige! Først til 20 vinder!";
  } else {
    spilOver = tspilOver = false;
    if (!mHover) {
      description = "Kør over en af de to knapper for at få information omkring det spil!";
    } else {
      description = "Held og lykke!";
    }
  }
}

void keyPressed() { // hvis en knappe  bliver trykket
  if (pangle != 0 && key == 'w' || key == 'W'  && (bodyy[1]-20)!=bodyy[2]) { // hvis knappen er w eller W (hvis nu man har caps på)
    pangle = 90; // så ændre vi pangle til 90
    // pangle != 0 betyder at man ikke kan kigge nedad og så bare trykke w for at vende sig rundt 180 grader
    // det ville være skørt
    // (bodyy[1]-20)!=bodyy[2] sikre at man ikke kommer til at ramme sig selv ved at trykke for hurtigt
    // men det virker sku ikke
  }
  if (pangle != 90 && key == 's' || key == 'S' && (bodyy[1]+20)!=bodyy[2]) {
    pangle = 0;
  }
  if (pangle != 270 && key == 'a' || key == 'A' && (bodyx[1]+20)!=bodyx[2]) {
    pangle = 180;
  }
  if (pangle != 180 && key == 'd' || key == 'D' && (bodyx[1]-20)!=bodyx[2]) {
    pangle = 270;
  }
  if (tspil) { // til spiller 2
    if (keyCode == UP && tangle != 0) {
      tangle = 90;
    }
    if (keyCode == DOWN && tangle != 90) {
      tangle = 0;
    }
    if (keyCode == LEFT && tangle != 270) {
      tangle = 180;
    }
    if (keyCode == RIGHT && tangle != 180) {
      tangle = 270;
    }
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