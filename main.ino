const int sensorPin = 3;
const int buzzer = 2;


void setup() {
  pinMode(sensorPin, INPUT);
  pinMode(buzzer, OUTPUT);
}

void loop() {
  int sensorValue = digitalRead(sensorPin);

  if (sensorValue == HIGH) {
    Serial.println("Object detected");
    digitalWrite(buzzer, LOW);
    delay(100);
  } else {
    Serial.println("No object detected");
    // digitalWrite(buzzer, HIGH);
    tone(buzzer, 1000);
    delay(100);
  }

  delay(500);
}