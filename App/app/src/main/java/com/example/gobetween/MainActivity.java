package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    Button b1,b2,b3,b4,next;
    EditText n1,n2,result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        b1=findViewById(R.id.b1);
        b2=findViewById(R.id.b2);
        b3=findViewById(R.id.b3);
        b4=findViewById(R.id.b4);
        next=findViewById(R.id.next);
        n1=findViewById(R.id.n1);
        n2=findViewById(R.id.n2);
        result=findViewById(R.id.result);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a=Integer.parseInt(String.valueOf(n1.getText()));
                int b=Integer.parseInt(String.valueOf(n2.getText()));
                int c=a+b;
                result.setText(String.valueOf(c));
            }

        });
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a=Integer.parseInt(String.valueOf(n1.getText()));
                int b=Integer.parseInt(String.valueOf(n2.getText()));
                int c=a-b;
                result.setText(String.valueOf(c));
            }
        });
        b3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a=Integer.parseInt(String.valueOf(n1.getText()));
                int b=Integer.parseInt(String.valueOf(n2.getText()));
                int c=a*b;
                result.setText(String.valueOf(c));
            }
        });
        b4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a=Integer.parseInt(String.valueOf(n1.getText()));
                int b=Integer.parseInt(String.valueOf(n2.getText()));
                int c=a/b;
                result.setText(String.valueOf(c));
            }
        });
        next.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(MainActivity.this,Largestnumber.class);
                startActivity(i);
            }
        });

    }
}