package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class UserRegistration extends AppCompatActivity {
    Spinner spinnerState,spinnerDistrict,spinnerLocation;
    ArrayAdapter<String> stateAdapter;
    ArrayAdapter<String> districtAdapter;
    ArrayAdapter<String> locationAdapter;
    String districtId[], districtName[];
    String stateId[], stateName[];
    String locationId[], locationName[];
    TextView logintext;
    EditText uname,ucontact,uemail,uaadhar,uday,umonth,uyear,uaddress,upassword;
    Button signbutton;
    String name,contact,email,aadhar,day,month,year,address,password,lid;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_registration);
        uname = findViewById(R.id.name);
        ucontact = findViewById(R.id.contact);
        uemail = findViewById(R.id.email);
        uaadhar = findViewById(R.id.aadhar);
        uday = findViewById(R.id.day);
        umonth = findViewById(R.id.month);
        uyear = findViewById(R.id.year);
        uaddress = findViewById(R.id.address);
        upassword = findViewById(R.id.password);

        spinnerState = findViewById(R.id.state);
        spinnerDistrict = findViewById(R.id.district);
        signbutton = findViewById(R.id.signbutton);
        spinnerLocation = findViewById(R.id.location);

        GetState state = new GetState();
        state.execute();

        logintext=findViewById(R.id.logintext);
        logintext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(UserRegistration.this, Login.class);
                startActivity(i);
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
//                    GetCompany gt = new GetCompany();
//                    gt.execute("0", "0",stateID);
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
//                    GetCompany gt = new GetCompany();
//                    gt.execute("0", districtID,"0");
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
//                   GetCompany gt = new GetCompany();
//                    gt.execute(locationID, "0","0");
                }
            }
            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        signbutton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // Get the feedback message from the EditText
                name = uname.getText().toString();
                contact = ucontact.getText().toString();
                email= uemail.getText().toString();
                aadhar= uaadhar.getText().toString();
                day = uday.getText().toString();
                month = umonth.getText().toString();
                year = uyear.getText().toString();
                address = uaddress.getText().toString();
                password = upassword.getText().toString();
                int typePosition = spinnerLocation.getSelectedItemPosition();
                lid = locationId[typePosition];
                if (!name.isEmpty()){
                    SignUp signUp = new SignUp();
                    signUp.execute(name,contact,email,aadhar,lid,day,month,year,password,address);
                } else {
                    // If empty, display a toast message
                    Toast.makeText(UserRegistration.this, "Please enter your details", Toast.LENGTH_SHORT).show();
                }
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
                stateName[0] = "--Select State--";
                stateId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    stateId[i + 1] = jo.getString("sid");
                    stateName[i + 1] = jo.getString("sname");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            stateAdapter = new ArrayAdapter<String>(UserRegistration.this, android.R.layout.simple_spinner_item, stateName);
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
                districtName[0] = "--Select District--";
                districtId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    districtId[i + 1] = jo.getString("did");
                    districtName[i + 1] = jo.getString("dname");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            districtAdapter = new ArrayAdapter<String>(UserRegistration.this, android.R.layout.simple_spinner_item, districtName);
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
                locationName[0] = "--Select Location--";
                locationId[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    locationId[i + 1] = jo.getString("lid");
                    locationName[i + 1] = jo.getString("lname");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            locationAdapter = new ArrayAdapter<String>(UserRegistration.this, android.R.layout.simple_spinner_item, locationName);
            locationAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            spinnerLocation.setAdapter(locationAdapter);
        }
    }
    private class SignUp extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("SignUp");
            wb.addProperty("name", strings[0]);
            wb.addProperty("contact", strings[1]);
            wb.addProperty("email", strings[2]);
            wb.addProperty("aadhar", strings[3]);
            wb.addProperty("location", strings[4]);
            wb.addProperty("day", strings[5]);
            wb.addProperty("month", strings[6]);
            wb.addProperty("year", strings[7]);
            wb.addProperty("password", strings[8]);
            wb.addProperty("address", strings[9]);


            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute(String message) {
            // Display a toast message with the submitted feedback
            Toast.makeText(UserRegistration.this, "Application submitted: ", Toast.LENGTH_SHORT).show();
            Intent i = new Intent(UserRegistration.this,Login.class);
            startActivity(i);
            execute(message);
        }
    }
}
