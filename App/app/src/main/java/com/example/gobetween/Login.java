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

public class Login extends AppCompatActivity {
    Button b1;
    EditText email,password;
    String Email,Password,id,name;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        b1 = findViewById(R.id.b1);
        email = findViewById(R.id.email);
        password = findViewById(R.id.password);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Email = email.getText().toString();
                Password = password.getText().toString();
                LoginDetails l = new LoginDetails();
                l.execute(Email, Password);

            }
        });
    }

    public class LoginDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("LoginDetails");
//            Log.d("TAG", strings[0]);
            wb.addProperty("email", strings[0]);
            wb.addProperty("password", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
//            Toast.makeText(Login.this, s, Toast.LENGTH_SHORT).show();
            if (!s.equals("[]")) {
                JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);
                    id = jo.getString("id");
                    name = jo.getString("name");

                    Toast.makeText(Login.this, "success", Toast.LENGTH_SHORT).show();


                    SharedPreferences.Editor sh = getSharedPreferences("user", MODE_PRIVATE).edit();
                    sh.putString("id", id);
                    sh.putString("name", name);
                    sh.apply();

                } catch (JSONException e) {
                    e.printStackTrace();
                }

                Intent i=new Intent(Login.this, Dashboard.class);
                startActivity(i);


            } else {
                Toast.makeText(Login.this, "faild", Toast.LENGTH_SHORT).show();

            }
        }


    }
}