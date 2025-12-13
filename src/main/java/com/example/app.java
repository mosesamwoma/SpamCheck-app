package com.example;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.layout.VBox;

public class App extends Application {

    @Override
    public void start(Stage stage) {

        TextArea input = new TextArea();
        input.setPromptText("Enter message to check...");

        Button button = new Button("Check Spam");

        Label result = new Label("Result will appear here");

        button.setOnAction(e -> {
            result.setText("Checking...");
            new Thread(() -> {
                String prediction = ApiService.checkSpam(input.getText());
                Platform.runLater(() -> result.setText("Result: " + prediction));
            }).start();
        });

        VBox layout = new VBox(10);
        layout.getChildren().addAll(input, button, result);

        Scene scene = new Scene(layout, 400, 300);
        stage.setScene(scene);
        stage.setTitle("Spam Detector");
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
