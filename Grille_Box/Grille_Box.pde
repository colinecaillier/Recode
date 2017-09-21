// inspiration  http://recodeproject.com/artwork/v3n1p196a
boolean isSave = false;

Float R_x =0.0;
Float R_y =0.0;
Float R_z = 0.0;

Float R_x1=0.0;
Float R_y1=0.0;
Float R_z1= 0.0;

int BoxSize = 350;
float SclBox = 0.8;

PGraphics renderTarget;
PGraphics renderTarget2;
PGraphics renderTarget11;
PGraphics renderTarget22;



void setup() {
  size(700, 700, P3D);
  renderTarget = createGraphics(width, height/2, P3D);
  renderTarget2 = createGraphics(width, height/2, P3D);
  renderTarget11 = createGraphics(width, height/2, P3D);
  renderTarget22 = createGraphics(width, height/2, P3D);
}




void draw() {
  background(0);
  //translate(width/2,0,0);
  translate(10, 0, 0);
  //scale(0.3);

  blendMode(ADD);

  drawBox1(renderTarget);
  drawBox2(renderTarget2);
  drawBox11(renderTarget11);
  drawBox22(renderTarget22);
  scale(0.9);
  //drawBox2();

  stroke(255);
  strokeWeight(2);

  scale(0.18);
  pushMatrix();
  for (int fx = 0; fx<4; fx++) {
    translate(width, 0);
    for (int i = 0; i<6; i++) {
      line(0, height/2, width, height/2);
      line(width/2, 0, width/2, height);

      pushMatrix();
      image(renderTarget, 0, i);
      image(renderTarget11, 0, i );

      translate(0, height/2);
      image(renderTarget2, 0, i);
      image(renderTarget22, 0, i);
      popMatrix();
      translate(0, height);
    }
    // rotate(90);

    translate(0, -6*height);
    // rotate(90);
    //translate(100,0);
  } 
  popMatrix();





  if (isSave) {
    saveFrame("Recode"+"-"+year()+month()+day()+"-"+hour()+minute()+second()+".png");
    isSave = false;
  }
}


void drawBox1(PGraphics rt) { // parametre Box superieur / grande
  rt.beginDraw();
  rt.lights();
  rt.background(0);

  rt.pushMatrix();
  rt.translate(width/2, height/2-height/14, 0);
  // rt.fill(0);
  rt.noFill();
  rt.stroke(255);
  rt.strokeWeight(3);
  rt.scale(SclBox);
  rt.rotateY(R_y);
  rt.rotateX(R_x);
  rt.rotateZ(R_z);
  rt.box(BoxSize);

  R_y+=0.01;
  R_x+=0.01;
  R_z+=0.001;
  // println(R_x + " " +R_y);
  if (R_x >=25.0) {
    R_x=0.0;
    R_y = 0.0;
  }


  rt.popMatrix();
  rt.endDraw();
}


void drawBox11(PGraphics rt) {// parametre Box superieur / petite
  rt.beginDraw();
  rt.lights();
  rt.background(0);

  rt.pushMatrix();
  rt.translate(width/2, height/2, 0);

  rt.fill(255);

  //rt.noFill();
  //rt.stroke(255);
  // rt.strokeWeight(5);
  rt.scale(SclBox);
  rt.rotateY(R_y);
  rt.rotateX(R_x);
  rt.box(BoxSize*0.8);

  R_y+=0.01;
  R_x+=0.01;
  // println(R_x + " " +R_y);
  if (R_x >=25.0) {
    R_x=0.0;
    R_y = 0.0;
  }


  rt.popMatrix();
  rt.endDraw();
}



void drawBox2(PGraphics rt) {// parametre Box inferieure / grande
  rt.beginDraw();
  rt.lights();

  rt.background(0);

  rt.pushMatrix();
  rt.translate(width/2, height/14);
  rt.fill(255);

  //rt.noFill();
  //rt.background(0,0,255);
  //rt.strokeWeight(2);

  rt.stroke(255);
  rt.scale(SclBox);
  rt.rotateY(R_y1);
  rt.rotateX(R_x1);
  rt.rotateZ(R_z1);

  rt.box(BoxSize*0.8);

  R_y1 -= 0.015;
  R_x1 -= 0.01;
  R_z1 -= 0.001;
  if (R_x1 <= -25.0) {
    R_x1 = 0.0;
    R_y1 = 0.0;
  }

  rt.popMatrix();
  rt.endDraw();
}

void drawBox22(PGraphics rt) {// parametre Box inferieure / petite
  rt.beginDraw();
  rt.lights();

  rt.background(0);

  rt.pushMatrix();
  rt.translate(width/2, 0);
  //rt.fill(255);
  rt.noFill();
  //rt.background(0,0,255); // aide position 

  rt.stroke(255);
  rt.scale(SclBox);
  rt.strokeWeight(5);
  rt.rotateY(R_y1);
  rt.rotateX(R_x1);

  rt.box(BoxSize);

  R_y1 -= 0.015;
  R_x1 -= 0.01;
  if (R_x1 <= -25.0) {
    R_x1 = 0.0;
    R_y1 = 0.0;
  }

  rt.popMatrix();
  rt.endDraw();
}




void keyPressed() {
  if (key == 's') {
    isSave = true;
  }
}