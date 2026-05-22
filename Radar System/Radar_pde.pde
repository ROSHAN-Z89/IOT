import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;

Serial myPort;

String angle     = "";
String distance  = "";
String data      = "";
String noObject  = "";
float  pixsDistance;
int    iAngle, iDistance;
int    index1 = 0;

void setup() {
  size(1200, 700);
  smooth();

  println("Available ports:");
  println(Serial.list());

  try {
    myPort = new Serial(this, "COM8", 9600);
    myPort.bufferUntil('.');
    println("Serial connected on COM8");
  }
  catch (Exception e) {
    println("ERROR: " + e.getMessage());
    println("Check COM port and close Arduino IDE");
  }
}

void draw() {
  noStroke();
  fill(0, 4);
  rect(0, 0, width, height - height * 0.065);

  fill(98, 245, 31);
  drawRadar();
  drawLine();
  drawObject();
  drawText();
}

void serialEvent(Serial myPort) {
  data = myPort.readStringUntil('.');
  if (data == null || data.length() < 2) return;

  data   = data.substring(0, data.length() - 1);
  index1 = data.indexOf(',');
  if (index1 == -1) return;

  angle    = data.substring(0, index1);
  distance = data.substring(index1 + 1, data.length());

  iAngle    = int(angle);
  iDistance = int(distance);
}

void drawRadar() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);

  arc(0, 0, width - width * 0.0625, width - width * 0.0625, PI, TWO_PI);
  arc(0, 0, width - width * 0.27,   width - width * 0.27,   PI, TWO_PI);
  arc(0, 0, width - width * 0.479,  width - width * 0.479,  PI, TWO_PI);
  arc(0, 0, width - width * 0.687,  width - width * 0.687,  PI, TWO_PI);

  line(-width / 2, 0, width / 2, 0);
  line(0, 0, (-width/2) * cos(radians(30)),  (-width/2) * sin(radians(30)));
  line(0, 0, (-width/2) * cos(radians(60)),  (-width/2) * sin(radians(60)));
  line(0, 0, (-width/2) * cos(radians(90)),  (-width/2) * sin(radians(90)));
  line(0, 0, (-width/2) * cos(radians(120)), (-width/2) * sin(radians(120)));
  line(0, 0, (-width/2) * cos(radians(150)), (-width/2) * sin(radians(150)));
  popMatrix();
}

void drawObject() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);
  strokeWeight(9);
  stroke(255, 10, 10);

  pixsDistance = iDistance * ((height - height * 0.1666) * 0.025);

  if (iDistance > 0 && iDistance < 40) {
    line(
      pixsDistance * cos(radians(iAngle)),
      -pixsDistance * sin(radians(iAngle)),
      (width - width * 0.505) * cos(radians(iAngle)),
      -(width - width * 0.505) * sin(radians(iAngle))
    );
  }
  popMatrix();
}

void drawLine() {
  pushMatrix();
  translate(width / 2, height - height * 0.074);
  strokeWeight(9);
  stroke(30, 250, 60);
  line(0, 0,
    (height - height * 0.12) * cos(radians(iAngle)),
    -(height - height * 0.12) * sin(radians(iAngle))
  );
  popMatrix();
}

void drawText() {
  if (iDistance <= 0 || iDistance > 40) {
    noObject = "Out of Range";
  } else {
    noObject = "In Range";
  }

  noStroke();
  fill(0);
  rect(0, height - height * 0.0648, width, height * 0.0648);

  fill(98, 245, 31);
  textSize(25);
  text("10cm", width - width * 0.3854, height - height * 0.0833);
  text("20cm", width - width * 0.281,  height - height * 0.0833);
  text("30cm", width - width * 0.177,  height - height * 0.0833);
  text("40cm", width - width * 0.0729, height - height * 0.0833);

  textSize(40);
  text("Vicky's Radar",            width - width * 0.800, height - height * 0.0200);
  text("Angle: " + iAngle + " °", width - width * 0.48,  height - height * 0.0277);
  text(noObject,                   width - width * 0.26,  height - height * 0.0277);
  if (iDistance > 0 && iDistance < 40) {
    text(iDistance + " cm",        width - width * 0.100, height - height * 0.0277);
  }

  float cx = width / 2;
  float cy = height - height * 0.074;
  float r  = width / 2;
  textSize(25);
  fill(98, 245, 60);

  pushMatrix();
  translate(cx + r * cos(radians(30)), cy - r * sin(radians(30)));
  rotate(radians(-60));
  text("30°", 0, 0);
  popMatrix();

  pushMatrix();
  translate(cx + r * cos(radians(60)), cy - r * sin(radians(60)));
  rotate(radians(-30));
  text("60°", 0, 0);
  popMatrix();

  pushMatrix();
  translate(cx + r * cos(radians(90)), cy - r * sin(radians(90)));
  rotate(radians(0));
  text("90°", 0, 0);
  popMatrix();

  pushMatrix();
  translate(cx + r * cos(radians(120)), cy - r * sin(radians(120)));
  rotate(radians(30));
  text("120°", 0, 0);
  popMatrix();

  pushMatrix();
  translate(cx + r * cos(radians(150)), cy - r * sin(radians(150)));
  rotate(radians(60));
  text("150°", 0, 0);
  popMatrix();
}
