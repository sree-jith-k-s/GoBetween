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

public class OngoingRequest extends AppCompatActivity {

    RecyclerView recycleview1;
    String company[],logo[],logourl[],status[],Id[];
    String id;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ongoing_request);
        recycleview1=findViewById(R.id.recycleview1);
        OngoingRequest.Requesttracking s = new OngoingRequest.Requesttracking();
        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        id=sh.getString("id","");
        s.execute(id);
    }
    public class Requesttracking extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("RequestTracking");
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
                status = new String[j.length()];
                Id = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    company[i] = jo.getString("company");
                    logo[i] = jo.getString("logo");;
                    logourl[i] = jo.getString("logourl");;
                    status[i] = jo.getString("status");
                    Id[i] = jo.getString("id");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            OngoingAdapter ongoingAdapter = new OngoingAdapter(OngoingRequest.this,status,company,logo,logourl);
            ongoingAdapter.setOnItemClickListener(new OngoingAdapter.OnItemClickListener(){
                @Override
                public void onItemClick(int position) {
                    Intent i = new Intent(OngoingRequest.this,TrackRequest.class);
                    i.putExtra("id",Id[position]);
                    startActivity(i);
                }
            });

            recycleview1.setAdapter(ongoingAdapter);
            recycleview1.setLayoutManager(new LinearLayoutManager(OngoingRequest.this));
        }



    }

}