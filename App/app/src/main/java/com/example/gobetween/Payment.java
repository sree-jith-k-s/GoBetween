package com.example.gobetween;

import static com.example.gobetween.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Payment extends AppCompatActivity {
    String sid;
    Button buttonpay;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);
        buttonpay = findViewById(R.id.buttonpay);

        Intent intent = getIntent();
        sid = intent.getStringExtra("id");
        payment sp = new payment();
        sp.execute(sid);
        buttonpay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Payment.this, RequestDetails.class);
                i.putExtra("id",sid);
                startActivity(i);
            }
        });
    }
    public class payment extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("payment");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }
    }
}