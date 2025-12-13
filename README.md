# 📧 SpamCheck - AI-Powered Spam Detection App

[![Download Windows App](https://img.shields.io/badge/Download-Windows_Installer_(.exe)-blue?style=for-the-badge&logo=windows)](https://github.com/mosesamwoma/SpamCheck-app/releases/tag/v1.0.0)
[![API Status](https://img.shields.io/badge/API-Live_on_Render-success?style=for-the-badge&logo=render)](https://spam-email-detection-model.onrender.com/docs#/default/predict_predict_post)

**SpamCheck** is a native Windows desktop application that uses Machine Learning to detect whether an email or SMS message is "Spam" or "Not Spam" in real-time.

Built with **JavaFX** and integrated with a **Python/Flask ML API**, this project demonstrates full-stack integration between a Java desktop client and a cloud-hosted AI model.

## 🔗 Project Resources
* **📥 Download App:** [Get the Windows Installer (v1.0.0)](https://github.com/mosesamwoma/SpamCheck-app/releases/tag/v1.0.0)
* **🧠 ML Model Repository:** [View the Python Source Code](https://github.com/mosesamwoma/spam-email-detection-model.git)
* **🔌 Live API Docs:** [Swagger UI / API Endpoint](https://spam-email-detection-model.onrender.com/docs#/default/predict_predict_post)

## 🚀 Features
* **Real-time Analysis:** Connects to a live Machine Learning API.
* **Native Windows UI:** Clean, responsive interface built with JavaFX.
* **Smart Detection:** Identifies spam keywords and patterns instantly.
* **Portable:** Deployed as a standalone `.exe` installer.

## 🛠️ Tech Stack
* **Frontend:** JavaFX, Java 21
* **Backend (API):** Python, Flask, Scikit-Learn (hosted on Render)
* **Build Tools:** Maven, JPackage
* **Libraries:** Gson (JSON parsing), OkHttp (API requests)

## 📦 How to Run Locally (Developer Mode)
1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/mosesamwoma/SpamCheck.git](https://github.com/mosesamwoma/SpamCheck.git)
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd SpamCheck
    ```
3.  **Build the project using Maven:**
    ```bash
    mvn clean package
    ```
4.  **Run the application:**
    ```bash
    java --module-path "path/to/javafx/lib" --add-modules javafx.controls -jar target/SpamDetector-1.0.0.jar
    ```

## 📷 Usage
1.  Open the installed **SpamCheck** app.
2.  Paste the email or SMS message you want to check.
3.  Click **"Check Spam"**.
4.  The AI will analyze the text and return the result (Spam / Not Spam).

## 🔮 Future Improvements
We are actively working on the next version! Upcoming features include:
* 📱 **Mobile App:** An Android version to check spam on the go.
* 📂 **Batch Processing:** Upload a CSV file to check multiple messages at once.
* 📊 **Confidence Score:** Displaying the probability percentage (e.g., "98% Spam").
* 🌙 **Dark Mode:** Improved UI for better accessibility.

## 👨‍💻 Author
**Moses Amwoma** - Data Science Student & Software Engineer

---
*This project is part of my portfolio demonstrating software engineering and data science integration.*
