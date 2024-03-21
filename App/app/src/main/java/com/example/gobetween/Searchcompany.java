package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;
import androidx.loader.content.AsyncTaskLoader;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Searchcompany extends AppCompatActivity {

    Spinner spinnerState,spinnerDistrict,spinnerLocation;
    ArrayAdapter<String> stateAdapter;
    ArrayAdapter<String> districtAdapter;
    ArrayAdapter<String> locationAdapter;

    String districtId[], districtName[];
    String stateId[], stateName[];
    String locationId[], locationName[];
    RecyclerView recycleview1;
    String id[],company[],logo[],logourl[];

    ImageView backto;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_searchcompany);
        backto = findViewById(R.id.arrow);
        recycleview1=findViewById(R.id.recycleview1);
        spinnerState = findViewById(R.id.state);
        spinnerDistrict = findViewById(R.id.district);
        spinnerLocation = findViewById(R.id.location);
        backto.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Searchcompany.this, Dashboard.class);
                startActivity(i);
            }
        });

        GetState state = new GetState();
        state.execute();



        spinnerState.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
               if(position!=0)
               {
                   String stateID = stateId[position];
                   GetDistrict gd = new GetDistrict();
                   gd.execute(stateID);
                   GetCompany gt = new GetCompany();

                   gt.execute("0", "0",stateID);
               }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        spinnerDistrict.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position!=0) {
                    String districtID = districtId[position];
                    GetPlace gd = new GetPlace();
                    gd.execute(districtID);
                    GetCompany gt = new GetCompany();

                    gt.execute("0", districtID,"0");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });

        spinnerLocation.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position!=0) {
                    String locationID = locationId[position];
                    GetCompany gt = new GetCompany();

                    gt.execute(locationID, "0","0");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });




    }
    public class GetState extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GetState");
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                stateId = new String[j.length() + 1];
                stateName = new String[j.length() + 1];
                stateName[0] = "--Select--";
                stateId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    stateId[i + 1] = jo.getString("sid");
                    stateName[i + 1] = jo.getString("sname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            stateAdapter = new ArrayAdapter<String>(Searchcompany.this, android.R.layout.simple_spinner_item, stateName);
            stateAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnerState.setAdapter(stateAdapter);

        }
    }


    public class GetDistrict extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GetDistrict");
            wb.addProperty("stateid", strings[0]);
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                districtId = new String[j.length() + 1];
                districtName = new String[j.length() + 1];
                districtName[0] = "--Select--";
                districtId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    districtId[i + 1] = jo.getString("did");
                    districtName[i + 1] = jo.getString("dname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            districtAdapter = new ArrayAdapter<String>(Searchcompany.this, android.R.layout.simple_spinner_item, districtName);
            districtAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnerDistrict.setAdapter(districtAdapter);

        }
    }
    public class GetPlace extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GetPlace");
            wb.addProperty("districtid", strings[0]);
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                locationId = new String[j.length() + 1];
                locationName = new String[j.length() + 1];
                locationName[0] = "--Select--";
                locationId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    locationId[i + 1] = jo.getString("lid");
                    locationName[i + 1] = jo.getString("lname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            locationAdapter = new ArrayAdapter<String>(Searchcompany.this, android.R.layout.simple_spinner_item, locationName);
            locationAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnerLocation.setAdapter(locationAdapter);

        }
    }
    public class GetCompany extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Search");
            wb.addProperty("lid",strings[0]);
            wb.addProperty("did",strings[1]);
            wb.addProperty("sid",strings[2]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            super.onPostExecute(s);
            Toast.makeText(Searchcompany.this, s, Toast.LENGTH_SHORT).show();
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                id = new String[j.length()];
                company = new String[j.length()];
                logo = new String[j.length()];
                logourl = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    id[i]= jo.getString("cid");
                    company[i] = jo.getString("company");
                    logo[i] = jo.getString("logo");;
                    logourl[i] = jo.getString("logourl");;

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            SearchAdapter searchAdapter = new SearchAdapter(Searchcompany.this,company,logo,logourl);
            SearchAdapter.setOnItemClickListener(new SearchAdapter.OnItemClickListener() {
                @Override
                public void onItemClick(int position) {
                    Intent i = new Intent(Searchcompany.this,CompanyDetails.class);
                    i.putExtra("id", id[position]);
                    startActivity(i);
                }
            });

            recycleview1.setAdapter(searchAdapter);
            recycleview1.setLayoutManager(new LinearLayoutManager(Searchcompany.this));
        }



    }
}