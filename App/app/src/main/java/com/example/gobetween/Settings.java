package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

public class Settings extends AppCompatActivity {
    CardView viewfeedback,viewcomplaint,logout;
    ImageView backto;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);
        backto = findViewById(R.id.arrow);
        viewfeedback = findViewById(R.id.viewfeedback);
        viewcomplaint = findViewById(R.id.viewcomplaint);
        logout = findViewById(R.id.logout);
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Settings.this, Dashboard.class);
                startActivity(i);
            }
        });
        viewfeedback.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Settings.this, Feedback.class);
                startActivity(i);
            }
        });
        viewcomplaint.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Settings.this, ViewComplaint.class);
                startActivity(i);
            }
        });
        logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                logout();
            }
        });
    }
    private void logout() {
        // Clear user session data
        clearUserData();

        // Redirect to login activity
        Intent intent = new Intent(Settings.this, Login.class);
        startActivity(intent);
        finish(); // Close current activity
    }

    private void clearUserData() {
        SharedPreferences preferences = getSharedPreferences("user", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = preferences.edit();
        editor.clear();
        editor.apply();
    }
}