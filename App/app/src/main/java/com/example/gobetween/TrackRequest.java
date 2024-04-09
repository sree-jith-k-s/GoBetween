package com.example.gobetween;

import static com.example.gobetween.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TrackRequest extends AppCompatActivity {

    String id;

    TextView deliveryDate,deliveryTime,name,vehicle,details,contact,toaddress,tolocation;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_track_request);

        deliveryDate = findViewById(R.id.deliveryDate);
        deliveryTime = findViewById(R.id.deliveryTime);
        name = findViewById(R.id.name);
        vehicle = findViewById(R.id.vehicle);
        details = findViewById(R.id.details);
        contact = findViewById(R.id.contact);
        toaddress = findViewById(R.id.toaddress);
        tolocation = findViewById(R.id.tolocation);


        Intent intent = getIntent();
        id = intent.getStringExtra("id");
        Trackrequest sp = new Trackrequest();
        sp.execute(id);

    }
    public class Trackrequest extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("TrackDetails");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            JSONArray j = null;
            try {
                j = new JSONArray(s);
                JSONObject jo = j.getJSONObject(0);
                deliveryDate.setText(jo.getString("tolocation"));
                deliveryTime.setText(jo.getString("deliveryTime"));
                name.setText(jo.getString("name"));
                vehicle.setText(jo.getString("vehicle"));
                details.setText(jo.getString("details"));
                contact.setText(jo.getString("contact"));
                toaddress.setText(jo.getString("toaddress"));
                tolocation.setText(jo.getString("tolocation"));
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
}