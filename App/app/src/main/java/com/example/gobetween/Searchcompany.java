package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;
import androidx.loader.content.AsyncTaskLoader;

import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
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

    String state,district;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_searchcompany);


        spinnerState = findViewById(R.id.state);
        spinnerDistrict = findViewById(R.id.district);
        spinnerLocation = findViewById(R.id.location);

        GetState state = new GetState();
        state.execute();

        spinnerState.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String stateID = stateId[position];
                GetDistrict gd = new GetDistrict();
                gd.execute(stateID);

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                Toast.makeText(Searchcompany.this, "Not Selected", Toast.LENGTH_SHORT).show();
            }
        });
        spinnerDistrict.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String districtID = districtId[position];
                GetPlace gd = new GetPlace();
                gd.execute(districtID);
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
            Toast.makeText(Searchcompany.this, s, Toast.LENGTH_SHORT).show();
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
            Toast.makeText(Searchcompany.this, s, Toast.LENGTH_SHORT).show();
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
            Toast.makeText(Searchcompany.this, s, Toast.LENGTH_SHORT).show();
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

}