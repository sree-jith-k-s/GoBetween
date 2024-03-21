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

public class Myprofile extends AppCompatActivity {
        Button button1;
        TextView name,pchange,contact,email,address,aadhar,dob;
    ImageView backto;

        String id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_myprofile);
        button1 = findViewById(R.id.button1);
        name = findViewById(R.id.name);
        pchange = findViewById(R.id.pchange);
        contact = findViewById(R.id.contact);
        email = findViewById(R.id.email);
        address = findViewById(R.id.address);
        aadhar = findViewById(R.id.aadhar);
        dob=findViewById(R.id.dob);
        backto = findViewById(R.id.arrow);
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Myprofile.this, Dashboard .class);
                startActivity(i);
            }
        });
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Myprofile.this,Editprofile.class);
                startActivity(i);
            }
        });
        pchange.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Myprofile.this, Changepassword.class);
                startActivity(i);
            }
        });

        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
         id=sh.getString("id","");
        MyProfile sp = new MyProfile();
        sp.execute(id);

    }
//    public boolean onOptionsItemSelected(MenuItem item) {
//        Intent myIntent = new Intent(getApplicationContext(), Myprofile.class);
//        startActivityForResult(myIntent, 0);
//        return true;
//    }
        public class MyProfile extends AsyncTask<String, String, String> {

            @Override
            protected String doInBackground(String... strings) {
                WebServiceCaller wb = new WebServiceCaller();
                wb.setSoapObject("MyProfile");
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
                        String Aadhar= jo.getString("aadhar");
                        String Address= jo.getString("address");
                        String DOB= jo.getString("dob");

                        name.setText(Name);
                        email.setText(Email);
                        contact.setText(Phone);
                        aadhar.setText(Aadhar);
                        address.setText(Address);
                        dob.setText(DOB);


                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
//                }
            }
    }
}