<div align="center">

<img src="https://media0.giphy.com/media/AdtB8TtizElk0OrRGR/giphy.gif" width="100%" height="260px" style="object-fit:cover; border-radius:10px;" />

# 🌐 IoT Smart System

**A collection of IoT projects combining hardware, computer vision, and real-time sensing.**

[![Arduino](https://img.shields.io/badge/Arduino-00979D?style=for-the-badge&logo=arduino&logoColor=white)](https://www.arduino.cc/)
[![ESP32](https://img.shields.io/badge/ESP32-black?style=for-the-badge&logo=espressif&logoColor=white)](https://www.espressif.com/)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![OpenCV](https://img.shields.io/badge/OpenCV-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white)](https://opencv.org/)
[![License](https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge)](LICENSE)

</div>

---

## 📂 Projects

This repository is a hub for standalone IoT projects. Each folder is a self-contained system with its own hardware setup, code, and documentation.

---

### 🎯 Object Detection Alert

> Real-time object detection using computer vision — triggers hardware alerts when a target object is detected.

| Detail | Info |
|--------|------|
| **Core Tech** | Python, OpenCV, ESP32 / Arduino |
| **Input** | Webcam or IP camera stream |
| **Output** | Serial/GPIO alert to hardware (buzzer, LED, relay) |
| **Use Case** | Intrusion detection, motion-triggered alerts, smart surveillance |

**How it works:**
1. Python + OpenCV processes the camera feed frame-by-frame
2. On detection of a target object/motion, a signal is sent over serial to the microcontroller
3. The ESP32/Arduino triggers a connected alert (buzzer, LED, relay)

📁 [`/Object Detection Alert`](./Object%20Detection%20Alert)

---

### 📡 Radar System

> A visual radar system using an ultrasonic sensor and servo motor — sweeps an area and displays detected objects on a radar-style screen.

| Detail | Info |
|--------|------|
| **Core Tech** | Arduino, HC-SR04 Ultrasonic Sensor, Servo Motor, Processing IDE |
| **Input** | Ultrasonic distance readings across a 180° sweep |
| **Output** | Real-time radar visualization on PC |
| **Use Case** | Proximity detection, obstacle mapping, robotics sensing |

**How it works:**
1. Servo motor rotates from 0° to 180°, sweeping the area
2. HC-SR04 measures distance at each angle
3. Angle + distance data is sent over serial to a Processing sketch
4. Processing renders a live radar display with detected objects plotted

📁 [`/Radar System`](./Radar%20System)

---

## 🛠️ Common Tech Stack

| Layer | Tools |
|-------|-------|
| **Microcontroller** | Arduino Uno, ESP32, ESP8266 |
| **Sensors** | HC-SR04 Ultrasonic, DHT11/22, PIR |
| **Actuators** | Servo Motor, Buzzer, LED, Relay |
| **Software** | Python 3, OpenCV, Arduino IDE, Processing IDE |
| **Communication** | Serial (USB), MQTT (Wi-Fi), GPIO |

---

## ⚙️ General Hardware Requirements

- Arduino Uno or ESP32/ESP8266
- HC-SR04 Ultrasonic Sensor *(Radar System)*
- Servo Motor SG90 *(Radar System)*
- Webcam or USB Camera *(Object Detection Alert)*
- Buzzer / LED / Relay module *(Object Detection Alert)*
- Breadboard + Jumper Wires
- USB Cable / 5V Power Supply

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/ROSHAN-Z89/IOT.git
cd IOT
```

### 2. Navigate to a Project

```bash
cd "Object Detection Alert"
# or
cd "Radar System"
```

### 3. Follow the Project-Specific README

Each sub-folder contains its own setup instructions, wiring diagram references, and code walkthrough.

---

## 📁 Repository Structure

```
IOT/
├── Object Detection Alert/
│   ├── detection.py          # Main Python detection script
│   ├── arduino_alert/        # Arduino sketch for hardware alert
│   └── README.md
│
├── Radar System/
│   ├── radar.ino             # Arduino sketch (servo + ultrasonic)
│   ├── radar_display/        # Processing sketch for visualization
│   └── README.md
│
└── README.md                 # ← You are here
```

---

## 🗺️ Roadmap

- [x] Ultrasonic Radar System with live visualization
- [x] Object Detection with hardware alert trigger
- [ ] MQTT-based sensor dashboard (ESP32 + cloud)
- [ ] Drone with camera control + AI object tracking
- [ ] Multi-node IoT monitoring platform

---

## 🤝 Contributing

1. Fork this repository
2. Create a branch: `git checkout -b feature/your-idea`
3. Commit your changes: `git commit -m "Add: your feature"`
4. Push and open a Pull Request

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

---

<div align="center">

Built with ⚡ by [ROSHAN-Z89](https://github.com/ROSHAN-Z89)

⭐ Star this repo if it was useful to you!

</div>
