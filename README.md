# 📧 SpamCheck - AI-Powered Spam Detection App

[![Download Windows App](https://img.shields.io/badge/Download-Windows_Installer_(.exe)-0078D4?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/mosesamwoma/SpamCheck-app/releases/tag/v1.0.0)
[![API Status](https://img.shields.io/badge/API-Live_on_Render-46E3B7?style=for-the-badge&logo=render&logoColor=white)](https://spam-email-detection-model.onrender.com/docs#/default/predict_predict_post)
[![Java](https://img.shields.io/badge/Java-21-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://openjdk.org/)
[![JavaFX](https://img.shields.io/badge/JavaFX-Latest-orange?style=for-the-badge&logo=java)](https://openjfx.io/)

> **SpamCheck** is a native Windows desktop application powered by Machine Learning that instantly detects whether an email or SMS message is spam. Built with JavaFX and integrated with a cloud-hosted Python/Flask ML API, this project showcases seamless full-stack integration between a Java desktop client and an AI-powered backend.

---

## 🎯 Key Highlights

- **⚡ Real-time Detection:** Lightning-fast spam analysis powered by a live ML API
- **🎨 Native Windows Experience:** Clean, intuitive interface built with JavaFX
- **🧠 Smart AI Engine:** Advanced pattern recognition identifies spam with high accuracy
- **📦 Ready to Deploy:** Standalone `.exe` installer - no dependencies required
- **🔒 Privacy-First:** Your messages are analyzed securely without storage

---

## 🔗 Project Resources

| Resource | Link |
|----------|------|
| 📥 **Windows Installer** | [Download v1.0.0](https://github.com/mosesamwoma/SpamCheck-app/releases/tag/v1.0.0) |
| 🧠 **ML Model Source** | [Python Repository](https://github.com/mosesamwoma/spam-email-detection-model.git) |
| 🔌 **API Documentation** | [Live Swagger UI](https://spam-email-detection-model.onrender.com/docs#/default/predict_predict_post) |
| 💻 **Desktop App Source** | [GitHub Repository](https://github.com/mosesamwoma/SpamCheck-app) |

---

## 🚀 Features

### Current Version (v1.0.0)
- ✅ **Instant Spam Detection** - Get results in under a second
- ✅ **Cloud-Powered AI** - Leverages a production-grade ML model on Render
- ✅ **Simple & Intuitive** - Paste text, click check, get results
- ✅ **Cross-Platform API** - RESTful backend accessible from any client
- ✅ **Lightweight & Fast** - Minimal resource usage on your machine

---

## 🛠️ Tech Stack

### Frontend (Desktop App)
- **Language:** Java 21
- **UI Framework:** JavaFX
- **Build System:** Maven
- **Packaging:** JPackage (Windows Installer)
- **HTTP Client:** OkHttp
- **JSON Parsing:** Gson

### Backend (ML API)
- **Language:** Python 3.10+
- **Framework:** Flask + Uvicorn
- **ML Library:** Scikit-Learn (Naive Bayes)
- **Hosting:** Render (Cloud Platform)
- **API Docs:** FastAPI/Swagger UI

---

## 📦 Installation & Usage

### For End Users (Recommended)

1. **Download the installer** from the [Releases page](https://github.com/mosesamwoma/SpamCheck-app/releases/tag/v1.0.0)
2. **Run the `.exe` file** and follow the installation wizard
3. **Launch SpamCheck** from your Start Menu or Desktop
4. **Paste your message** into the text area
5. **Click "Check Spam"** and get instant results!

### For Developers (Local Setup)

#### Prerequisites
- Java 21 or higher
- Maven 3.8+
- JavaFX SDK (included in Maven dependencies)

#### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/mosesamwoma/SpamCheck-app.git
   cd SpamCheck-app
   ```

2. **Build the project:**
   ```bash
   mvn clean package
   ```

3. **Build Windows installer (optional):**
   ```bash
   mvn clean package jpackage:jpackage
   ```

---

## 🎨 Screenshots & Demo

*Coming soon! Screenshots will be added in the next update.*

---

## 🧪 How It Works

1. **User Input:** You paste an email or SMS message into the app
2. **API Request:** The app sends the text to the ML backend via HTTPS
3. **AI Analysis:** The Python model (trained on 5,000+ spam samples) analyzes patterns
4. **Classification:** The model returns "Spam" or "Not Spam" with metadata
5. **Display Results:** The JavaFX app shows the verdict in a user-friendly format

---

## 🔮 Roadmap & Future Improvements

### Version 1.1 (In Development)
- 🎨 **Enhanced UI/UX** - Custom FXML layouts and stylesheets
- 🖼️ **Custom App Icon** - Professional branding
- ⚙️ **Application Properties** - Configurable settings file
- 📊 **Confidence Score Display** - Show probability percentage (e.g., "98% Spam")

### Version 1.2 (Planned)
- 📱 **Android Mobile App** - Check spam on the go
- 🌙 **Dark Mode** - Eye-friendly theme for night usage
- 📂 **Batch Processing** - Upload CSV files to check multiple messages
- 📈 **Statistics Dashboard** - View your spam detection history
- 🔔 **Notification System** - Desktop alerts for critical spam

### Version 2.0 (Future Vision)
- 🧩 **Browser Extension** - Check emails directly in Gmail/Outlook
- 🤖 **Advanced ML Models** - Support for transformer-based detection (BERT)
- 🌐 **Multi-Language Support** - Detect spam in Spanish, French, German, etc.
- 🔗 **Email Client Integration** - Direct plugin for Outlook/Thunderbird

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **JavaFX Community** for the excellent UI framework
- **Scikit-Learn** for making ML accessible
- **Render** for reliable cloud hosting
- **Open Source Community** for inspiration and tools

---

## 👨‍💻 About the Author

**Moses Amwoma**  
*Data Science Student & Software Engineer*

I'm passionate about building practical AI applications that solve real-world problems. This project combines my interests in machine learning, software engineering, and user experience design.

[![GitHub](https://img.shields.io/badge/GitHub-mosesamwoma-181717?style=flat&logo=github)](https://github.com/mosesamwoma)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin)](https://linkedin.com/in/mosesamwoma)

---

## 📞 Support & Feedback

- **🐛 Bug Reports:** [Open an Issue](https://github.com/mosesamwoma/SpamCheck-app/issues)
- **💡 Feature Requests:** [Start a Discussion](https://github.com/mosesamwoma/SpamCheck-app/discussions)
- **⭐ Enjoying the app?** Star the repo to show your support!

---

<div align="center">

**Made with ❤️ by Moses Amwoma**

*Part of my portfolio demonstrating full-stack ML application development*

</div>
