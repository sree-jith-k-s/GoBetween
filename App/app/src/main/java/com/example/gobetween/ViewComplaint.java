package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ViewComplaint extends AppCompatActivity {

    RecyclerView recyclerView;
    String content[],type[],reply[];
    ImageView backto;
    String id;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_complaint);

        recyclerView=findViewById(R.id.recyclerview);
        backto = findViewById(R.id.arrow);
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(ViewComplaint.this, Settings.class);
                startActivity(i);
            }
        });
        ViewComplaint.Viewcomplaint s = new ViewComplaint.Viewcomplaint();
        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        id=sh.getString("id","");
        s.execute(id);

    }
    public class Viewcomplaint extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Viewcomplaint");
            wb.addProperty("id",strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            Log.d("Data", String.valueOf(s.length()));
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                type = new String[j.length()];
                content = new String[j.length()];
                reply = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    type[i] = jo.getString("type");
                    content[i] = jo.getString("content");
                    reply[i] = jo.getString("reply");


                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            ComplaintAdapter complaintAdapter = new ComplaintAdapter(ViewComplaint.this,type,content,reply);
            recyclerView.setAdapter(complaintAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(ViewComplaint.this));
        }



    }

}