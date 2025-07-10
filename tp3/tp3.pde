// https://youtu.be/v2LSIYSzD94
PImage referencia;
boolean coloresInvertidos = false;

void setup() {
  size(800, 400);
  referencia = loadImage("referencia.jpg");
}

void draw() {
  if (coloresInvertidos) {
    background(0);
    stroke(255);
  } else {
    background(255);
    stroke(0);
  }

  image(referencia, 0, 0, 400, 400);

  drawObra();
}

// Función que NO retorna valor y recibe parámetros
void drawObra() {
  int cantidad = 10;
  float startX = 400;
  float endX = 720;
  float espacioX = (endX - startX) / float(cantidad - 1);
  float maxOffset = 30;
  float offset = 0;

  // Determinar el offset en función del mouse
  if (mouseX > 380) {
    if (mouseX < 400) {
      offset = map(mouseX, 380, 400, -maxOffset, 0);
    } else {
      offset = map(mouseX, 400, width, 0, maxOffset);
    }
  } else {
    offset = 0;
  }

  float grosorMax = 12;
  float grosorMin = 5;

  // Dibujar las líneas
  for (int i = 0; i < cantidad; i++) {
    float x = startX + i * espacioX;
    float xMedioBase = 500 + map(i, 0, cantidad - 1, 0, 120);
    float xMedio = xMedioBase + offset;

    float yMedio;
    if (offset < 0) {
      yMedio = map(i, 0, cantidad - 1, 180, 270);
    } else if (offset > 0) {
      yMedio = map(i, 0, cantidad - 1, 270, 180);
    } else {
      yMedio = 225;
    }

    // Llamar a la función que calcula el grosor
    float grosor = calcularGrosor(i, cantidad, offset, grosorMin, grosorMax);

    strokeWeight(grosor);

    // Ciclo for anidado para dibujar dos líneas cercanas
    for (int j = -1; j <= 0; j++) {
      float desplazamientoY = j * 3;
      line(x, 0 + desplazamientoY, xMedio, yMedio + desplazamientoY);
      line(x, height + desplazamientoY, xMedio, yMedio + desplazamientoY);
    }
  }
}

// Función que retorna un valor (grosor de la línea) y recibe parámetros
float calcularGrosor(int i, int cantidad, float offset, float grosorMin, float grosorMax) {
  if (offset < 0) {

    return map(i, 0, cantidad - 1, grosorMax, grosorMin);
  } else if (offset > 0) {

    return map(i, 0, cantidad - 1, grosorMin, grosorMax);
  } else {

    return (grosorMax + grosorMin) / 2;
  }
}

void mousePressed() {
  coloresInvertidos = !coloresInvertidos;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    coloresInvertidos = false;
  }
}
