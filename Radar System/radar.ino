#include <Servo.h>

const int trigPin  = 10;
const int echoPin  = 11;
const int servoPin = 9;

Servo radarServo;
long duration;
int distance;
int angle   = 15;
int stepDir = 1;

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
  radarServo.attach(servoPin);
  radarServo.write(15);
  delay(1000);
}

void loop() {
  radarServo.write(angle);
  delay(30);

  distance = measureDistance();

  Serial.print(angle);
  Serial.print(",");
  Serial.print(distance);
  Serial.print(".");

  angle += stepDir;
  if (angle >= 165) stepDir = -1;
  if (angle <= 15)  stepDir =  1;
}

int measureDistance() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH, 30000);
  if (duration == 0) return 41;
  return (int)(duration * 0.034 / 2);
}
