package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CompanyDetails extends AppCompatActivity {
    Button button1;
    TextView name,contact,email,address,location,since;
    ImageView backto;

    String id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_company_details);
        button1 = findViewById(R.id.b1);
        name = findViewById(R.id.companyname);
        location = findViewById(R.id.location);
        contact = findViewById(R.id.contact);
        email = findViewById(R.id.email);
        address = findViewById(R.id.address);
        since=findViewById(R.id.since);
//        backto = findViewById(R.id.arrow);
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(ComplaintDetails.this, Searchcompany .class);
                startActivity(i);
            }
        });
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ComplaintDetails.this,EnquiryForm.class);
                startActivity(i);
            }
        });
        Intent intent = getIntent();
        id = intent.getStringExtra("id");
        Companydetails sp = new Companydetails();
        sp.execute(id);

    }
    //    public boolean onOptionsItemSelected(MenuItem item) {
//        Intent myIntent = new Intent(getApplicationContext(), Myprofile.class);
//        startActivityForResult(myIntent, 0);
//        return true;
//    }
    public class Companydetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("CompanyDetails");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
//                Toast.makeText(Myprofile.this,s,Toast.LENGTH_SHORT).show();

//                if (!s.equals("[]")) {
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                JSONObject jo = j.getJSONObject(0);
                String Name= jo.getString("name");
                String Email = jo.getString("email");
                String Phone= jo.getString("contact");
                String Location= jo.getString("location");
                String Address= jo.getString("address");
                String Since= jo.getString("since");

                name.setText(Name);
                email.setText(Email);
                contact.setText(Phone);
                location.setText(Location);
                address.setText(Address);
                since.setText(Since);


            } catch (JSONException e) {
                e.printStackTrace();
            }
//                }
        }
    }
}