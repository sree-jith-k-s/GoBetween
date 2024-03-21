package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MyRequest extends AppCompatActivity {

    RecyclerView recycleview1;
    ImageView backto;
    String company[],logo[],logourl[],time[];
    String id;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_request);
        backto = findViewById(R.id.arrow);
        recycleview1=findViewById(R.id.recycleview1);
        MyRequest.Myrequest s = new MyRequest.Myrequest();
        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        id=sh.getString("id","");
        s.execute(id);
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(MyRequest.this, Dashboard.class);
                startActivity(i);
            }
        });

    }
    public class Myrequest extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("MyRequest");
            wb.addProperty("id",strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                company = new String[j.length()];
                logo = new String[j.length()];
                logourl = new String[j.length()];
                time = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    company[i] = jo.getString("company");
                    logo[i] = jo.getString("logo");;
                    logourl[i] = jo.getString("logourl");;
                    time[i] = jo.getString("time");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            RequestAdapter requestAdapter = new RequestAdapter(MyRequest.this,time,company,logo,logourl);
            requestAdapter.setOnItemClickListener(new RequestAdapter.OnItemClickListener(){
                @Override
                public void onItemClick(int position) {
                    Intent i = new Intent(MyRequest.this, RequestDetails.class);
                    startActivity(i);
                }
            });

            recycleview1.setAdapter(requestAdapter);
            recycleview1.setLayoutManager(new LinearLayoutManager(MyRequest.this));
        }



    }

}