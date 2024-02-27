package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Changepassword extends AppCompatActivity {
    Button b1;
    EditText cpassword, npassword, repassword;
    String cpass, npass, repass,DBPassword="";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_changepassword);
        b1 = findViewById(R.id.changePasswordButton);
        cpassword = findViewById(R.id.cpassword);
        npassword = findViewById(R.id.npassword);
        repassword = findViewById(R.id.repassword);

        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        String id=sh.getString("id","");

        GetPassword gp = new GetPassword();
        gp.execute(id);


        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                cpass = cpassword.getText().toString();
                npass = npassword.getText().toString();
                repass = repassword.getText().toString();

                if(DBPassword.equals(cpass))
                {
                    if (npass.equals(repass))
                    {
                        ChangePassword l = new ChangePassword();
                        l.execute(id,npass);
                    }
                    else {
                        Toast.makeText(Changepassword.this, "New Password Mismatched", Toast.LENGTH_SHORT).show();
                    }
                }else {
                    Toast.makeText(Changepassword.this, "Current Password Mismatched", Toast.LENGTH_SHORT).show();
                }


            }
        });
    }

    public class GetPassword extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("getPassword");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            DBPassword = s;

        }
    }


    public class ChangePassword extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("ChangePassword ");
            wb.addProperty("id", strings[0]);
            wb.addProperty("password", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            if(s.equals("Password Updated"))
            {
                Toast.makeText(Changepassword.this, s, Toast.LENGTH_SHORT).show();
                Intent i=new Intent(Changepassword.this, Myprofile.class);
                startActivity(i);
            }
            else {
                Toast.makeText(Changepassword.this, s, Toast.LENGTH_SHORT).show();
            }
        }
    }
}