package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

public class EnquiryForm extends AppCompatActivity {
    Spinner spinnerState,spinnerDistrict,spinnerLocation,spinnerCategory,spinnertoState,spinnertoDistrict,spinnertoLocation;
    ArrayAdapter<String> stateAdapter;
    ArrayAdapter<String> districtAdapter;
    ArrayAdapter<String> locationAdapter;
    ArrayAdapter<String> categoryAdapter;
    ArrayAdapter<String> tostateAdapter;
    ArrayAdapter<String> todistrictAdapter;
    ArrayAdapter<String> tolocationAdapter;

    EditText pday,pmonth,pyear,dday,dmonth,dyear,description,quantity,pickupAddress,deliveryAddress;
    String Pday,Pmonth,Pyear,Dday,Dmonth,Dyear,Hour,Minute,Meridiem,Description,Quantity,PickupAddress,DeliveryAddress,cid,plid,dlid;
    String coid;
    Button submitbutton;
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
        pday = findViewById(R.id.pday);
        pmonth = findViewById(R.id.pmonth);
        pyear = findViewById(R.id.pyear);
        dday = findViewById(R.id.dday);
        dmonth = findViewById(R.id.dmonth);
        dyear = findViewById(R.id.dyear);
        description = findViewById(R.id.description);
        quantity = findViewById(R.id.quantity);
        pickupAddress = findViewById(R.id.pickupAddress);
        deliveryAddress = findViewById(R.id.deliveryAddress);

        spinnerState = findViewById(R.id.state);
        spinnerDistrict = findViewById(R.id.district);
        spinnerLocation = findViewById(R.id.location);
        spinnerCategory = findViewById(R.id.category);
        spinnertoState = findViewById(R.id.tostate);
        spinnertoDistrict = findViewById(R.id.todistrict);
        spinnertoLocation = findViewById(R.id.tolocation);
        submitbutton = findViewById(R.id.submitbutton);
        SharedPreferences sh = getSharedPreferences("user", MODE_PRIVATE);
        String id = sh.getString("id", "");
        GetCategory category = new GetCategory();
        category.execute();
        GetState state = new GetState();
        state.execute();
        GettoState tostate = new GettoState();
        tostate.execute();

        Spinner hourSpinner = findViewById(R.id.hour);

        List<String> hourList = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            String time = String.format("%02d", i);
            hourList.add(time);
        }

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, hourList);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        hourSpinner.setAdapter(adapter);
        Spinner minuteSpinner = findViewById(R.id.minute);

        List<String> minuteList = new ArrayList<>();
        for (int i = 0; i < 60; i += 1) {
            String time = String.format("%02d", i);
            minuteList.add(time);
        }

        ArrayAdapter<String> adapter2 = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, minuteList);
        adapter2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        minuteSpinner.setAdapter(adapter2);

        Spinner meridiemSpinner = findViewById(R.id.meridiem);
        List<String> meridiemList = new ArrayList<>();
        meridiemList.add("AM");
        meridiemList.add("PM");


        ArrayAdapter<String> adapter3 = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, meridiemList);
        adapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        meridiemSpinner.setAdapter(adapter3);

        Intent intent = getIntent();
        coid = intent.getStringExtra("coid");
        submitbutton.setOnClickListener(new View.OnClickListener() {


            @Override
            public void onClick(View v) {
                // Get the feedback message from the EditText
                Pday = pday.getText().toString();
                Pmonth= pmonth.getText().toString();
                Pyear= pyear.getText().toString();
                Dday= dday.getText().toString();
                Dmonth= dmonth.getText().toString();
                Dyear= dyear.getText().toString();
                Description= description.getText().toString();
                Quantity= quantity.getText().toString();
                PickupAddress= pickupAddress.getText().toString();
                DeliveryAddress= deliveryAddress.getText().toString();
                int typePosition = spinnerLocation.getSelectedItemPosition();
                plid = locationId[typePosition];
                int typePosition1 = spinnertoLocation.getSelectedItemPosition();
                dlid = tolocationId[typePosition1];
                int typePosition2 = spinnerCategory.getSelectedItemPosition();
                cid = categoryId[typePosition2];
                int typePosition3 = hourSpinner.getSelectedItemPosition();
                Hour= hourList.get(typePosition3);
                int typePosition4 = minuteSpinner.getSelectedItemPosition();
                Minute= minuteList.get(typePosition4);
                int typePosition5 = meridiemSpinner.getSelectedItemPosition();
                Meridiem= meridiemList.get(typePosition5);

                if (!Pday.isEmpty()&&!Pmonth.isEmpty()&&!Pyear.isEmpty()&&!Dday.isEmpty()&&!Dmonth.isEmpty()&&!Dyear.isEmpty()&&!Hour.isEmpty()&&!Minute.isEmpty()&&!Description.isEmpty()&&!Quantity.isEmpty()&&!PickupAddress.isEmpty()&&!DeliveryAddress.isEmpty()&&!cid.isEmpty()&&!plid.isEmpty()&&!dlid.isEmpty()){
                    EnQuiry enQuiry = new EnQuiry();
                    enQuiry.execute(Pday,Pmonth,Pyear,Dday,Dmonth,Dyear,Hour,Minute,Description,Quantity,PickupAddress,DeliveryAddress,cid,plid,dlid,id,coid);
                    Intent i = new Intent(EnquiryForm.this,Searchcompany.class);
                    startActivity(i);
                } else {
                    Toast.makeText(EnquiryForm.this, "Please enter details", Toast.LENGTH_SHORT).show();
                }
            }
        });

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
    private class EnQuiry extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... strings) {
            System.out.println("inside doInBackground"+ Arrays.toString(strings));
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Enquiry");
            wb.addProperty("Pday", strings[0]);
            wb.addProperty("Pmonth", strings[1]);
            wb.addProperty("Pyear", strings[2]);
            wb.addProperty("Dday", strings[3]);
            wb.addProperty("Dmonth", strings[4]);
            wb.addProperty("Dyear", strings[5]);
            wb.addProperty("Hour", strings[6]);
            wb.addProperty("Minute", strings[7]);
            wb.addProperty("Description", strings[8]);
            wb.addProperty("Quantity", strings[9])
            ;wb.addProperty("PickupAddress", strings[10]);
            wb.addProperty("DeliveryAddress", strings[11]);
            wb.addProperty("cid", strings[12]);
            wb.addProperty("plid", strings[13]);
            wb.addProperty("dlid", strings[14]);
            wb.addProperty("id", strings[15]);
            wb.addProperty("coid", strings[16]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute(String message) {
            // Display a toast message with the submitted feedback
            Toast.makeText(EnquiryForm.this, "Application submitted: ", Toast.LENGTH_SHORT).show();
        }
    }
}