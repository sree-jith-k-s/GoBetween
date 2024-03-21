package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class EnquiryForm extends AppCompatActivity {
    Spinner spinnerState,spinnerDistrict,spinnerLocation,spinnerCategory,spinnertoState,spinnertoDistrict,spinnertoLocation;
    ArrayAdapter<String> stateAdapter;
    ArrayAdapter<String> districtAdapter;
    ArrayAdapter<String> locationAdapter;
    ArrayAdapter<String> categoryAdapter;
    ArrayAdapter<String> tostateAdapter;
    ArrayAdapter<String> todistrictAdapter;
    ArrayAdapter<String> tolocationAdapter;

    String districtId[], districtName[];
    String stateId[], stateName[];
    String locationId[], locationName[];
    String todistrictId[], todistrictName[];
    String tostateId[], tostateName[];
    String tolocationId[], tolocationName[];

    String categoryId[], categoryName[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_enquiry_form);
        spinnerState = findViewById(R.id.state);
        spinnerDistrict = findViewById(R.id.district);
        spinnerLocation = findViewById(R.id.location);
        spinnerCategory = findViewById(R.id.category);
        spinnertoState = findViewById(R.id.tostate);
        spinnertoDistrict = findViewById(R.id.todistrict);
        spinnertoLocation = findViewById(R.id.tolocation);
        GetCategory category = new GetCategory();
        category.execute();
        GetState state = new GetState();
        state.execute();
        GettoState tostate = new GettoState();
        tostate.execute();
        spinnerState.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position!=0)
                {
                    String stateID = stateId[position];
                    GetDistrict gd = new GetDistrict();
                    gd.execute(stateID);

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
//                    Searchcompany.GetCompany gt = new GetCompany();

//                    gt.execute(locationID, "0","0");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
        spinnerCategory.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position!=0)
                {
                    String categoryID = categoryId[position];
//                    GetCategory gd = new GetCategory();
//                    gd.execute(categoryID);

                }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        spinnertoState.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position!=0)
                {
                    String tostateID = tostateId[position];
                    GettoDistrict gd = new GettoDistrict();
                    gd.execute(tostateID);

                }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        spinnertoDistrict.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position!=0) {
                    String todistrictID = todistrictId[position];
                    GettoPlace gd = new GettoPlace();
                    gd.execute(todistrictID);
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
        spinnertoLocation.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if(position!=0) {
                    String tolocationID = tolocationId[position];
//                    Searchcompany.GetCompany gt = new GetCompany();

//                    gt.execute(locationID, "0","0");
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


            stateAdapter = new ArrayAdapter<String>(EnquiryForm.this, android.R.layout.simple_spinner_item, stateName);
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


            districtAdapter = new ArrayAdapter<String>(EnquiryForm.this, android.R.layout.simple_spinner_item, districtName);
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


            locationAdapter = new ArrayAdapter<String>(EnquiryForm.this, android.R.layout.simple_spinner_item, locationName);
            locationAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnerLocation.setAdapter(locationAdapter);

        }
    }
    public class GetCategory extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GetCategory");
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                categoryId = new String[j.length() + 1];
                categoryName = new String[j.length() + 1];
                categoryName[0] = "--Select--";
                categoryId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    categoryId[i + 1] = jo.getString("cid");
                    categoryName[i + 1] = jo.getString("cname");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            categoryAdapter = new ArrayAdapter<String>(EnquiryForm.this, android.R.layout.simple_spinner_item, categoryName);
            categoryAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnerCategory.setAdapter(categoryAdapter);
        }
    }
    public class GettoState extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GettoState");
            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                tostateId = new String[j.length() + 1];
                tostateName = new String[j.length() + 1];
                tostateName[0] = "--Select--";
                tostateId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    tostateId[i + 1] = jo.getString("tsid");
                    tostateName[i + 1] = jo.getString("tsname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            tostateAdapter = new ArrayAdapter<String>(EnquiryForm.this, android.R.layout.simple_spinner_item, tostateName);
            tostateAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnertoState.setAdapter(tostateAdapter);

        }
    }
    public class GettoDistrict extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GettoDistrict");
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
                todistrictId = new String[j.length() + 1];
                todistrictName = new String[j.length() + 1];
                todistrictName[0] = "--Select--";
                todistrictId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    todistrictId[i + 1] = jo.getString("tdid");
                    todistrictName[i + 1] = jo.getString("tdname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            todistrictAdapter = new ArrayAdapter<String>(EnquiryForm.this, android.R.layout.simple_spinner_item, todistrictName);
            todistrictAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnertoDistrict.setAdapter(todistrictAdapter);

        }
    }
    public class GettoPlace extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("GettoPlace");
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
                tolocationId = new String[j.length() + 1];
                tolocationName = new String[j.length() + 1];
                tolocationName[0] = "--Select--";
                tolocationId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    tolocationId[i + 1] = jo.getString("tlid");
                    tolocationName[i + 1] = jo.getString("tlname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            tolocationAdapter = new ArrayAdapter<String>(EnquiryForm.this, android.R.layout.simple_spinner_item, tolocationName);
            tolocationAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnertoLocation.setAdapter(tolocationAdapter);

        }
    }
}