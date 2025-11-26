# Smart QR Scanner & Generator

A comprehensive Flutter application that not only scans QR codes and Barcodes but also generates specialized QR codes with smart action buttons. The app is deeply integrated with the device operating system for seamless sharing and scanning from external apps, and includes customizable user feedback.

## 🚀 Key Features

### 🔍 Advanced Scanning
* **Real-time Camera Scan:** Instant detection of QR and Barcodes using the device camera.
* **Gallery Scan:** Ability to pick an image from the device gallery to decode QR codes.
* **Flashlight & Zoom:** Integrated controls for low-light environments and distance scanning.

### 💡 Smart Generation & Actions
The app creates actionable QR codes for quick execution:

* **📶 WiFi QR Generator:**
    * Generates codes with network details (SSID, Password, Encryption).
    * **Smart Action:** Includes a button to **automatically save and connect** to the WiFi network when in range.
* **💬 SMS QR Generator:**
    * Pre-fills phone numbers and message bodies.
    * **Smart Action:** One-tap button to launch the messaging app with the text pre-filled.
* **📧 Email QR Generator:**
    * Creates codes with Recipient, Subject, and Body.
    * **Smart Action:** Instantly opens the default mail app with all fields populated.
* **📝 Text & URL:** Standard generation for plain text and website links.

### ⚙️ System Integration & User Experience
The application offers deep OS integration and custom user controls:

* **📥 Intent Sharing Support:**
    * **Receive Images:** Share an image from external apps (e.g., Gallery, File Explorer) directly to this app for immediate QR/Barcode scanning.
    * **"Open With" Action:** Tap on an image file to open it directly with the app, initiating an automatic scan.
* **📤 QR Code Sharing:** Dedicated **Share** button to send generated or scanned QR/Barcode images to other installed applications.
* **Custom Scan Feedback (Settings):**
    * **Haptic Feedback:** Toggle vibration upon successful scan.
    * **Custom Sound Alert:** Unique **"Quack" notification sound** upon successful code detection.

## 📸 Screenshots

| Camera Scan | WiFi Generator | Settings Screen |
|:---:|:---:|:---:|
| ![Camera Scan](https://github.com/user-attachments/assets/f32212bb-0cfd-49fd-9de2-ab7db954daeb) | ![WiFi Gen](https://github.com/user-attachments/assets/18db81bd-83e5-4f4a-a6a8-5de688ed0d58) | ![Settings](https://github.com/user-attachments/assets/4cf9d688-fd80-4130-a2e9-cee8a46f125d) |
| *Scanning UI* | *QR Code with Connect Action* | *Toggle Controls* |
|:---:|:---:|:---:|
| **QR Code Generator** | **History Support** | **Intent Sharing Example** |
| ![QR Generate](https://github.com/user-attachments/assets/b1026260-0970-45c6-a029-a62626242974) | ![History](https://github.com/user-attachments/assets/6f6cc90a-8184-4ff6-9b91-bd8be0b65f13) | ![Share Intent](https://github.com/user-attachments/assets/a25850d9-954d-4b9b-938d-2f3bf6a00a0d) |
| *SMS/Email Generator* | *Scan History List* | *Scanning Shared Image* |

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** [Dart](https://dart.dev/)
* **Key Packages (Likely):**
    * `qr_code_scanner` / `mobile_scanner` (Scanning)
    * `qr_flutter` (QR Generation)
    * `image_picker` (Gallery selection)
    * `share_plus` (Sharing generated/scanned images)
    * `receive_sharing_intent` (Handling incoming shared images)
    * `url_launcher` (Handling SMS/Email intents)
    * `wifi_iot` (or similar for WiFi connection logic)

## ⬇️ Installation

1.  **Clone the repository**
    ```bash
    git clone [https://github.com/MuhammedHelal/qr_scanner.git](https://github.com/MuhammedHelal/qr_scanner.git)
    ```
2.  **Navigate to the project directory**
    ```bash
    cd qr_scanner
    ```
3.  **Install dependencies**
    ```bash
    flutter pub get
    ```
4.  **Run the application**
    ```bash
    flutter run
    ```
    > *Note: Intent sharing requires native configuration (e.g., AndroidManifest.xml and Info.plist).*

## 📱 How to Use

### Scanning & Intent
* Simply open the app and point your camera.
* Alternatively, go to your phone's gallery, share an image to the app, and it will immediately scan.

### Generating & Actions
* Go to the **Generate** tab and select your required type (WiFi, SMS, Email).
* Fill out the form to generate the code. Use the **Smart Action** button below the generated QR code for instant operations (Connect, Send, etc.).

## 🤝 Contributing

Contributions are welcome! If you have ideas for new "Smart Actions" or UI improvements:

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/NewFeature`)
3.  Commit your Changes (`git commit -m 'Add NewFeature'`)
4.  Push to the Branch (`git push origin feature/NewFeature`)
5.  Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📧 Contact

**Muhammed Helal** - [GitHub Profile](https://github.com/MuhammedHelal)

Project Link: [https://github.com/MuhammedHelal/qr_scanner](https://github.com/MuhammedHelal/qr_scanner)
