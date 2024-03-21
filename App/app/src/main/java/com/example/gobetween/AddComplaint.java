package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AddComplaint extends AppCompatActivity {
    ArrayAdapter<String> typeAdapter;
    Spinner spinnertype;
    String complaintId[], complaintName[];
    EditText complaint;
    Button submitButton;
    String complaintMessage,typeid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_complaint);
        spinnertype = findViewById(R.id.complainttype);
        complaint = findViewById(R.id.complaint);
        submitButton = findViewById(R.id.b1);
        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
        String id=sh.getString("id","");
        Complainttype type = new Complainttype();
        type.execute();
        spinnertype.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
//                if (position != 0) {
//                    String complaintID = complaintId[position];
//                    GetComplaint gt = new GetComplaint();
//                    gt.execute(complaintId, "0","0");
//                }

            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        submitButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // Get the feedback message from the EditText
                complaintMessage = complaint.getText().toString();
                int typePosition = spinnertype.getSelectedItemPosition();
                typeid = complaintId[typePosition];




                // Check if the feedback message is empty
                if (!complaintMessage.isEmpty()) {
                    // If not empty, submit the feedback
                    Submitcomplaint submitcomplaint = new Submitcomplaint();
                    submitcomplaint.execute(id,complaintMessage,typeid);
                } else {
                    // If empty, display a toast message
                    Toast.makeText(AddComplaint.this, "Please enter your complaint", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
            public class Complainttype extends AsyncTask<String, String, String> {

                @Override
                protected String doInBackground(String... strings) {
                    WebServiceCaller wb = new WebServiceCaller();
                    wb.setSoapObject("Complainttype");
                    wb.callWebService();
                    return wb.getResponse();

                }

                @Override
                protected void onPostExecute(String s) {
                    super.onPostExecute(s);
                    JSONArray j = null;
                    try {
                        j = new JSONArray(s);
                        complaintId = new String[j.length() + 1];
                        complaintName = new String[j.length() + 1];
                        complaintName[0] = "--Select--";
                        complaintId[0] = "";
                        for (int i = 0; i < j.length(); i++) {
                            JSONObject jo = j.getJSONObject(i);
                            complaintId[i + 1] = jo.getString("cid");
                            complaintName[i + 1] = jo.getString("cname");

                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }


                    typeAdapter = new ArrayAdapter<String>(AddComplaint.this, android.R.layout.simple_spinner_item, complaintName);
                    typeAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
                    spinnertype.setAdapter(typeAdapter);

                }
            }
    private class Submitcomplaint extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Submitcomplaint");
            wb.addProperty("id", strings[0]);
            wb.addProperty("message", strings[1]);
            wb.addProperty("type", strings[2]);

            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute(String message) {
            message=complaintMessage;
            // Display a toast message with the submitted feedback
            Toast.makeText(AddComplaint.this, "Complaint submitted: " + message, Toast.LENGTH_SHORT).show();
            Intent i = new Intent(AddComplaint.this,Dashboard.class);
            startActivity(i);
            execute(message);
        }
    }
}