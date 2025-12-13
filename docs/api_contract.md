# API Contract Documentation

## Overview

This document defines the API contract between the SpamCheck desktop client and the ML-powered spam detection backend service.

**Base URL:** `https://spam-email-detection-model.onrender.com`  
**API Version:** v1  
**Protocol:** HTTPS  
**Content Type:** `application/json`

---

## Endpoints

### 1. Spam Detection Endpoint

**Endpoint:** `/predict`  
**Method:** `POST`  
**Description:** Analyzes text content and returns spam classification result

#### Request

**Headers:**
```
Content-Type: application/json
Accept: application/json
```

**Body Schema:**
```json
{
  "text": "string"
}
```

**Parameters:**

| Parameter | Type   | Required | Description                          | Max Length |
|-----------|--------|----------|--------------------------------------|------------|
| text      | string | Yes      | The email or SMS message to analyze  | 10,000 chars |

**Example Request:**
```json
{
  "text": "Congratulations! You've won a $1000 prize. Click here to claim now!"
}
```

#### Response

**Success Response (200 OK):**

```json
{
  "prediction": "spam",
  "confidence": 0.98,
  "message": "This message is classified as spam",
  "timestamp": "2024-01-15T10:30:45Z"
}
```

**Response Schema:**

| Field      | Type    | Description                                    | Possible Values    |
|------------|---------|------------------------------------------------|--------------------|
| prediction | string  | Classification result                          | "spam", "not_spam" |
| confidence | float   | Model confidence score (0.0 to 1.0)           | 0.0 - 1.0          |
| message    | string  | Human-readable result description              | Any string         |
| timestamp  | string  | ISO 8601 timestamp of the prediction          | ISO 8601 format    |

**Example Responses:**

**Spam Detected:**
```json
{
  "prediction": "spam",
  "confidence": 0.95,
  "message": "This message is classified as spam",
  "timestamp": "2024-01-15T10:30:45Z"
}
```

**Not Spam:**
```json
{
  "prediction": "not_spam",
  "confidence": 0.87,
  "message": "This message is legitimate",
  "timestamp": "2024-01-15T10:30:45Z"
}
```

#### Error Responses

**400 Bad Request - Empty Text:**
```json
{
  "error": "Bad Request",
  "message": "Text field is required and cannot be empty",
  "status": 400
}
```

**400 Bad Request - Invalid JSON:**
```json
{
  "error": "Bad Request",
  "message": "Invalid JSON format",
  "status": 400
}
```

**413 Payload Too Large:**
```json
{
  "error": "Payload Too Large",
  "message": "Text exceeds maximum length of 10,000 characters",
  "status": 413
}
```

**500 Internal Server Error:**
```json
{
  "error": "Internal Server Error",
  "message": "An error occurred while processing your request",
  "status": 500
}
```

**503 Service Unavailable:**
```json
{
  "error": "Service Unavailable",
  "message": "The spam detection service is temporarily unavailable",
  "status": 503
}
```

---

## Rate Limiting

**Current Limits:**
- **Rate:** 100 requests per minute per IP address
- **Burst:** 10 requests per second

**Rate Limit Headers:**
```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1642248645
```

**Rate Limit Exceeded Response (429):**
```json
{
  "error": "Too Many Requests",
  "message": "Rate limit exceeded. Please try again later.",
  "retry_after": 60,
  "status": 429
}
```

---

## Authentication

**Current Version:** No authentication required  
**Future Versions:** API key authentication will be implemented in v2.0

---

## Client Implementation Guidelines

### Request Best Practices

1. **Timeout Settings:**
   - Connection timeout: 10 seconds
   - Read timeout: 30 seconds

2. **Retry Logic:**
   - Implement exponential backoff for 5xx errors
   - Maximum 3 retry attempts
   - Initial retry delay: 1 second

3. **Error Handling:**
   - Always check HTTP status code
   - Parse error response JSON when available
   - Provide user-friendly error messages

4. **Input Validation:**
   - Trim whitespace before sending
   - Check text length client-side
   - Validate JSON format before sending

### Java Client Example

```java
import okhttp3.*;
import com.google.gson.Gson;
import java.io.IOException;

public class SpamCheckClient {
    private static final String API_URL = "https://spam-email-detection-model.onrender.com/predict";
    private static final MediaType JSON = MediaType.get("application/json; charset=utf-8");
    
    private final OkHttpClient client;
    private final Gson gson;
    
    public SpamCheckClient() {
        this.client = new OkHttpClient.Builder()
            .connectTimeout(10, TimeUnit.SECONDS)
            .readTimeout(30, TimeUnit.SECONDS)
            .build();
        this.gson = new Gson();
    }
    
    public PredictionResponse checkSpam(String text) throws IOException {
        // Create request body
        RequestPayload payload = new RequestPayload(text);
        String json = gson.toJson(payload);
        
        RequestBody body = RequestBody.create(json, JSON);
        Request request = new Request.Builder()
            .url(API_URL)
            .post(body)
            .build();
        
        // Execute request
        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected response code: " + response);
            }
            
            String responseBody = response.body().string();
            return gson.fromJson(responseBody, PredictionResponse.class);
        }
    }
    
    private static class RequestPayload {
        private final String text;
        
        public RequestPayload(String text) {
            this.text = text;
        }
    }
    
    public static class PredictionResponse {
        private String prediction;
        private double confidence;
        private String message;
        private String timestamp;
        
        // Getters and setters...
    }
}
```

---

## Testing

### Health Check

**Endpoint:** `/health` (if available)  
**Method:** `GET`  
**Description:** Check if the API is operational

**Response:**
```json
{
  "status": "healthy",
  "version": "1.0.0",
  "uptime": 3600
}
```

### Test Cases

**Test Case 1: Obvious Spam**
```json
{
  "text": "FREE MONEY!!! Click here now to claim your prize! Limited time offer!!!"
}
```
Expected: `prediction: "spam"`, `confidence > 0.9`

**Test Case 2: Legitimate Message**
```json
{
  "text": "Hi John, I wanted to follow up on our meeting yesterday. Can we schedule a call for next week?"
}
```
Expected: `prediction: "not_spam"`, `confidence > 0.8`

**Test Case 3: Edge Case - Short Text**
```json
{
  "text": "ok"
}
```
Expected: Should handle gracefully

**Test Case 4: Edge Case - Empty Text**
```json
{
  "text": ""
}
```
Expected: `400 Bad Request`

---

## API Versioning

**Current Version:** v1 (implicit in base URL)  
**Future Versions:** Will use explicit versioning in URL path (e.g., `/v2/predict`)

**Deprecation Policy:**
- Minimum 6 months notice before deprecating an API version
- Migration guide provided for major version changes

---

## SLA (Service Level Agreement)

**Availability Target:** 99.5% uptime  
**Response Time:** 95th percentile < 2 seconds  
**Support:** Community support via GitHub Issues

---

## Changelog

### Version 1.0.0 (Current)
- Initial API release
- POST /predict endpoint
- Basic error handling
- No authentication required

### Planned for Version 1.1.0
- Confidence score in response
- Timestamp field
- Enhanced error messages

### Planned for Version 2.0.0
- API key authentication
- Batch prediction endpoint
- Webhook support
- Extended rate limits for authenticated users

---

## Contact & Support

**API Issues:** [GitHub Issues](https://github.com/mosesamwoma/spam-email-detection-model/issues)  
**Live API Docs:** [Swagger UI](https://spam-email-detection-model.onrender.com/docs)  
**Developer:** Moses Amwoma

---

*Last Updated: December 2024*