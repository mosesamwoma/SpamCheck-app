package com.example;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class ApiService {

    private static final String API_URL = "https://spam-email-detection-model.onrender.com/docs#/default/predict_predict_post";

    public static String checkSpam(String text) {
        try {
            HttpClient client = HttpClient.newHttpClient();

            JsonObject json = new JsonObject();
            json.addProperty("text", text);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(json.toString()))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            JsonObject resJson = JsonParser.parseString(response.body()).getAsJsonObject();
            return resJson.get("prediction").getAsString();

        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR";
        }
    }
}
