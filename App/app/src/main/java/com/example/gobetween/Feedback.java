package com.example.gobetween;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import org.json.JSONException;
import org.json.JSONObject;

public class Feedback extends AppCompatActivity {
    EditText feedbackEditText;
    Button submitButton;
ImageView backto;
String feedbackMessage;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feedback);
        backto = findViewById(R.id.arrow);

        // Initialize views
        feedbackEditText = findViewById(R.id.feedback);
        submitButton = findViewById(R.id.b1);

        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        String id=sh.getString("id","");
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Feedback.this, Settings.class);
                startActivity(i);
            }
        });

        // Set click listener for the submit button
        submitButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // Get the feedback message from the EditText
                 feedbackMessage = feedbackEditText.getText().toString();

                // Check if the feedback message is empty
                if (!feedbackMessage.isEmpty()) {
                    // If not empty, submit the feedback
                    SubmitFeedbackTask submitFeedbackTask = new SubmitFeedbackTask();
                    submitFeedbackTask.execute(id,feedbackMessage);
                } else {
                    // If empty, display a toast message
                    Toast.makeText(Feedback.this, "Please enter your feedback", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    // AsyncTask to submit feedback
    private class SubmitFeedbackTask extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Submitfeedback");
            wb.addProperty("id", strings[0]);
            wb.addProperty("message", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute(String message) {
            message=feedbackMessage;
            // Display a toast message with the submitted feedback
            Toast.makeText(Feedback.this, "Feedback submitted: " + message, Toast.LENGTH_SHORT).show();
            Intent i = new Intent(Feedback.this,Settings.class);
            startActivity(i);
            execute(message);
        }
    }
}
