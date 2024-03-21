package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Editprofile extends AppCompatActivity {
    Button button1;
    EditText name,contact,email,address,aadhar,day,month,year;
    ImageView backto;

    String id,uname,ucontact,uemail,uaddress,uaadhar,uday,umonth,uyear;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editprofile);
        button1 = findViewById(R.id.button1);
        name = findViewById(R.id.name);
        contact = findViewById(R.id.contact);
        email = findViewById(R.id.email);
        address = findViewById(R.id.address);
        aadhar = findViewById(R.id.aadhar);
        day=findViewById(R.id.day);
        month=findViewById(R.id.month);
        year=findViewById(R.id.year);
        backto = findViewById(R.id.arrow);
        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        id=sh.getString("id","");
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Editprofile.this, Myprofile .class);
                startActivity(i);
            }
        });
        button1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                uname = name.getText().toString();
                ucontact = contact.getText().toString();
                uemail = email.getText().toString();
                uaadhar = aadhar.getText().toString();
                uaddress = address.getText().toString();
                uday = day.getText().toString();
                umonth = month.getText().toString();
                uyear = year.getText().toString();
                EditProfile l = new EditProfile();
                l.execute(id, uname,ucontact,uaddress,uemail,uaadhar,uday,umonth,uyear);
            }
    });

        ViewProfile sp = new ViewProfile();
        sp.execute(id);
}
    public class ViewProfile extends AsyncTask<String, String, String> {

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
                String Day= jo.getString("day");
                String Month= jo.getString("month");
                String Year= jo.getString("year");

                name.setText(Name);
                email.setText(Email);
                contact.setText(Phone);
                aadhar.setText(Aadhar);
                address.setText(Address);
                day.setText(Day);
                month.setText(Month);
                year.setText(Year);


            } catch (JSONException e) {
                e.printStackTrace();
            }
//                }
        }
    }
    private class EditProfile extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("EditProfile");
            wb.addProperty("id", strings[0]);
            wb.addProperty("name", strings[1]);
            wb.addProperty("contact", strings[2]);
            wb.addProperty("address", strings[3]);
            wb.addProperty("email", strings[4]);
            wb.addProperty("aadhar", strings[5]);
            wb.addProperty("day", strings[6]);
            wb.addProperty("month", strings[7]);
            wb.addProperty("year", strings[8]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            if(s.equals("Profile Updated"))
            {
                Toast.makeText(Editprofile.this, s, Toast.LENGTH_SHORT).show();
                Intent i=new Intent(Editprofile.this, Myprofile.class);
                startActivity(i);
            }
            else {
                Toast.makeText(Editprofile.this, s, Toast.LENGTH_SHORT).show();
            }
        }
    }
}