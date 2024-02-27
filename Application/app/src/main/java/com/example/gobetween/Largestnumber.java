package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class Largestnumber extends AppCompatActivity {
    Button b1;
    EditText n1,n2,n3,result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_largestnumber);
        b1=findViewById(R.id.b1);
        n1=findViewById(R.id.n1);
        n2=findViewById(R.id.n2);
        n3=findViewById(R.id.n3);
        result=findViewById(R.id.result);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a=Integer.parseInt(String.valueOf(n1.getText()));
                int b=Integer.parseInt(String.valueOf(n2.getText()));
                int c=Integer.parseInt(String.valueOf(n3.getText()));
                 if(a<b)
                 {
                     if(b<c)
                     {
                         int d=c;
                         result.setText(String.valueOf(d));
                     }
                     else
                     {
                         int d=b;
                         result.setText(String.valueOf(d));
                     }

                 }
                 else if (b<a)
                 {
                     if(a<c)
                     {
                         int d=c;
                         result.setText(String.valueOf(d));
                     }
                     else
                     {
                         int d=a;
                         result.setText(String.valueOf(d));
                     }
                 }
            }
        });
    }
}