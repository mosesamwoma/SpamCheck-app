# 🧱 SpamCheck System Architecture

This document describes the architecture of the **SpamCheck desktop application** and its interaction with the Machine Learning backend.

---

## 📌 Architecture Overview

SpamCheck uses a **client–server architecture**, separating the desktop client and the ML backend API.  
The desktop app handles UI, sends requests, and displays results, while the backend API handles prediction logic.

---

## 🧩 Components

### 1️⃣ JavaFX Desktop Client
**Responsibilities:**
- Collect user input (email/SMS)
- Display predictions and errors
- UI state management

**Technologies:**
- Java 21
- JavaFX
- Maven

---

### 2️⃣ Service Layer
**Responsibilities:**
- Send HTTP requests to API
- Parse JSON responses
- Handle network errors

**Key Class:**
- `ApiService`

**Libraries:**
- OkHttp
- Gson

---

### 3️⃣ Machine Learning API
**Responsibilities:**
- Preprocess text messages
- Run spam detection model
- Return prediction with confidence

**Technologies:**
- Python
- Flask
- Scikit-learn
- Hosted on Render

---

## 🔄 Data Flow

```text
User Input
   ↓
JavaFX UI
   ↓
ApiService (HTTP Request)
   ↓
ML API (/predict)
   ↓
Prediction Result (JSON)
   ↓
JavaFX UI (Display Result)

📦 Deployment Architecture
+-----------------------+
| Windows Desktop (.exe)|
| JavaFX Application    |
+-----------+-----------+
            |
            | HTTPS
            |
+-----------v-----------+
| ML API (Flask)        |
| Hosted on Render      |
+-----------------------+
🧠 Design Decisions

Thin client — logic mostly in API

REST API — language-agnostic integration

MVC pattern — UI separated from logic

Cloud-hosted ML backend — scalable and accessible

🔮 Future Enhancements

Authentication for API requests

Offline fallback model

Mobile client integration

Caching predictions locally
📎 Related Documents

API Contract: docs/api-contract.md

README: Project overview and usage

---

If you want, I can also provide a **terminal command** that will **automatically create `docs/architecture.md`** with this content in your project so you don’t have to copy-paste.  

Do you want me to do that?
