PImage portada;
PImage diapo1;
PImage diapo2;
PImage diapo3;
PImage diapo4;

PFont Mitexto;
PFont Mitexto2;
PFont Mitexto3;
PFont Mitexto4;
PFont Mitexto5;

int ancho = 64;
int alto = 48;
int tamañotexto = 10;
int desplazamiento = 0;

boolean empujar = false;
boolean mostrardiapo2 = false;
boolean mostrardiapo3 = false;
boolean mostrardiapo4 = false;

int aparece = 0;
int textoY;
boolean subirtexto = false;
int tiempodiapo2 = 0;
int tiempodiapo3 = 0;
int tiempodiapo4 = 0;

void setup() {
  size(640, 480);
  portada = loadImage("phantom.jpg");
  diapo1 = loadImage("battle.jpg");
  diapo2 = loadImage("stardust.jpg");
  diapo3 = loadImage("diamond.jpg");
  diapo4 = loadImage("golden.jpg");
  Mitexto= loadFont("SitkaDisplay-Italic-48.vlw");
  Mitexto2= loadFont("TimesNewRomanPS-BoldMT-48.vlw");
  Mitexto3= loadFont("SegoeUI-SemilightItalic-48.vlw");
  Mitexto4= loadFont("SimSun-48.vlw");
  Mitexto5= loadFont("Verdana-Italic-48.vlw");

  textAlign(CENTER, CENTER);
  textoY = height + 50;
}

void draw() {
  background(255);

  // Animación de inicio
  if (ancho >= width && alto >= height && tamañotexto >= 25) {
    if (!empujar) {
      empujar = true;
      aparece = frameCount;
    }
  }

  if (empujar && desplazamiento < width) {
    desplazamiento += 2;
  }

  // DIAPO 1
  if (empujar && !mostrardiapo2) {
    int diapo1X = -diapo1.width + desplazamiento;
    image(diapo1, diapo1X, 0);
    textAlign(LEFT, CENTER);
    fill(255);
    textFont(Mitexto2);
    textSize(32);
    text("Es un anime de aventuras y accion \n publicado en 1987", 180, height / 2);

    if (frameCount - aparece > 600) {
      mostrardiapo2 = true;
      subirtexto = true;
      tiempodiapo2 = frameCount;
    }
  }

  // DIAPO 2
  if (mostrardiapo2 && !mostrardiapo3) {
    image(diapo2, 0, 0, width, height);
    if (subirtexto) {
      if (textoY > height / 2) {
        textoY -= 2;
      } else {
        textoY = height / 2;
        subirtexto = false;
      }
    }
    fill(255);
    textFont(Mitexto3);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("El anime trata de \n un linaje el cual enfrenta \n a un enemigo en común, \n DIO, un vampiro que busca \n destruir el linaje y alcanzar la inmortalidad", width / 2, textoY);

    if (frameCount - tiempodiapo2 > 600) {
      mostrardiapo3 = true;
      tiempodiapo3 = frameCount;
    }
  }

  // DIAPO 3
  if (mostrardiapo3 && !mostrardiapo4) {
    image(diapo3, 0, 0, width, height);
    fill(255);
    textFont(Mitexto4);
    textSize(28);
    textAlign(CENTER, CENTER);
    text("El anime tiene poderes \n Como el hamon y los stands ", width / 2, height / 2);

    if (frameCount - tiempodiapo3 > 600) {
      mostrardiapo4 = true;
      tiempodiapo4 = frameCount;
    }
  }

  // DIAPO 4
  if (mostrardiapo4) {
    image(diapo4, 0, 0, width, height);
    fill(255);
    textFont(Mitexto5);
    textSize(26);
    textAlign(CENTER, CENTER);
    text("El anime tiene 6 partes las cuales\n son autoconclusivas entre si y actualmente hay una\n septima parte en desarrollo", width / 2, height - 100);
  }

  // Portada + texto inicial (detrás de todo)
  int x = (width - ancho) / 2 + desplazamiento;
  int y = (height - alto) / 2;
  image(portada, x, y, ancho, alto);

  textAlign(CENTER, CENTER);
  fill(255);
  textFont(Mitexto);
  textSize(tamañotexto);
  text("Jojos bizarre adventure es un anime,\n creado por Hirohiko Araki", width / 2 + desplazamiento, height / 2);

  // Animaciones de zoom
  if (ancho < width) ancho += 4;
  if (alto < height) alto += 3;
  if (tamañotexto < 25) tamañotexto += 1;

  // Botón de reinicio
  if (mostrardiapo4) {
    fill(255, 100);
    rect(width-120, height-60, 100, 40, 10);
    fill(0);
    text("Reiniciar", width-70, height-40);
  }
}

void mousePressed() {
  if (mostrardiapo4 && mouseX > width-120 && mouseX < width-20 &&
    mouseY > height-60 && mouseY < height-20) {
    // Resetear todo
    ancho = 64;
    alto = 48;
    tamañotexto = 10;
    desplazamiento = 0;
    empujar = false;

    mostrardiapo2 = false;
    mostrardiapo3 = false;
    mostrardiapo4 = false;

    aparece = 0;
    textoY = height + 50;
    subirtexto = false;
    tiempodiapo2 = 0;
    tiempodiapo3 = 0;
    tiempodiapo4 = 0;
  }
}
