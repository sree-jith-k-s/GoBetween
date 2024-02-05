package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Myprofile extends AppCompatActivity {
        Button button1;
        TextView textView21;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_myprofile);
        button1=findViewById(R.id.button1);
        textView21=findViewById(R.id.textView21);

        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Myprofile.this, Editprofile.class);
                startActivity(i);
            }
        });
        textView21.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Myprofile.this, Changepassword.class);
                startActivity(i);
            }
        });
    }
}