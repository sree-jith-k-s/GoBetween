package com.example.gobetween;

import static com.example.gobetween.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RequestDetails extends AppCompatActivity {

    String id,sheduleStatus,requestStatus,sid,amount;

    TextView companyName,pickupLocation,pickupDate,description,deliveryAddress,status;

    ImageView companyImage;
    Button buttonPay,buttonPay2,buttonTrack;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_request_details);

        companyName = findViewById(R.id.companyName);
        pickupLocation = findViewById(R.id.pickupLocation);
        pickupDate = findViewById(R.id.pickupDate);
        description = findViewById(R.id.description);
        deliveryAddress = findViewById(R.id.deliveryAddress);
        status = findViewById(R.id.status);
        companyImage = findViewById(R.id.companyImage);
        buttonPay = findViewById(R.id.buttonPay);
        buttonPay2 = findViewById(R.id.buttonPay2);
        buttonTrack = findViewById(R.id.buttonTrack);


        Intent intent = getIntent();
        id = intent.getStringExtra("id");
        Requestdetails sp = new Requestdetails();
        sp.execute(id);
        buttonTrack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(RequestDetails.this, TrackRequest.class);
//                Toast.makeText(RequestDetails.this, "hello", Toast.LENGTH_SHORT).show();
                i.putExtra("id",sid);
                startActivity(i);

            }
        });
        buttonPay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(RequestDetails.this, WebPayment .class);
//                Toast.makeText(RequestDetails.this, "hi", Toast.LENGTH_SHORT).show();
                i.putExtra("id",sid);
                i.putExtra("status",sheduleStatus);
                i.putExtra("amount",amount);
                startActivity(i);
            }
        });
        buttonPay2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(RequestDetails.this, WebPayment2 .class);
//                Toast.makeText(RequestDetails.this, "hi", Toast.LENGTH_SHORT).show();
                i.putExtra("id",sid);
                i.putExtra("status",sheduleStatus);
                i.putExtra("amount",amount);
                startActivity(i);
            }
        });
    }
    public class Requestdetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("RequestDetails");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            JSONArray j = null;
            try {
                j = new JSONArray(s);
                JSONObject jo = j.getJSONObject(0);
                companyName.setText(jo.getString("companyName"));
                pickupLocation.setText(jo.getString("pickupLocation"));
                pickupDate.setText(jo.getString("pickupDate"));
                description.setText(jo.getString("description"));
                deliveryAddress.setText(jo.getString("deliveryAddress"));
                requestStatus=jo.getString("status");
                sheduleStatus=jo.getString("sheduleStatus");
                sid=jo.getString("sid");
                amount=jo.getString("amount");
                Picasso.get().load("http://"+ip+jo.getString("companyImage")).into(companyImage);
                int statusInt = Integer.parseInt(requestStatus);
                int shedulestatusInt = Integer.parseInt(sheduleStatus);
                if (statusInt==3)
                {
                    if(shedulestatusInt==0)
                    {
                        status.setText("Pay 25% Amount");
                        buttonPay2.setVisibility(View.VISIBLE);
                        buttonTrack.setVisibility(View.GONE);
                        buttonPay.setVisibility(View.GONE);
                    }
                    else if(shedulestatusInt==2)
                    {
                        buttonPay2.setVisibility(View.GONE);
                        buttonPay.setVisibility(View.GONE);
                        buttonTrack.setVisibility(View.GONE);
                        status.setText("Processing...");
                    }
                    else if (shedulestatusInt==3)
                    {
                        status.setText("Not Yet Started...");
                        buttonPay2.setVisibility(View.GONE);
                        buttonTrack.setVisibility(View.GONE);
                        buttonPay.setVisibility(View.GONE);
                    }
                    else if (shedulestatusInt==4)
                    {
                        status.setText("Out For Delivery");
                        buttonPay2.setVisibility(View.GONE);
                        buttonTrack.setVisibility(View.VISIBLE);
                        buttonPay.setVisibility(View.GONE);
                    }
                    else if (shedulestatusInt==5)
                    {
                        status.setText("Pay the Balance Amount");
                        buttonPay2.setVisibility(View.GONE);
                        buttonTrack.setVisibility(View.GONE);
                        buttonPay.setVisibility(View.VISIBLE);

                    }
                    else if (shedulestatusInt==6)
                    {
                        status.setText("Delivered");
                        buttonPay2.setVisibility(View.GONE);
                        buttonTrack.setVisibility(View.GONE);
                        buttonPay.setVisibility(View.GONE);

                    }
                }
                else if(statusInt==2)
                {
                    status.setText("Rejected");
                    buttonPay2.setVisibility(View.GONE);
                    buttonTrack.setVisibility(View.GONE);
                    buttonPay.setVisibility(View.GONE);
                }
                else if(statusInt==1)
                {
                    status.setText("Vehicle Not Assigned");
                    buttonPay2.setVisibility(View.GONE);
                    buttonTrack.setVisibility(View.GONE);
                    buttonPay.setVisibility(View.GONE);
                }
                else if(statusInt==0)
                {
                    status.setText("Pending");
                    buttonPay2.setVisibility(View.GONE);
                    buttonTrack.setVisibility(View.GONE);
                    buttonPay.setVisibility(View.GONE);
                }

            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
    @Override
    public void onBackPressed() {
        // Create an intent to navigate to the target activity
        Intent intent = new Intent(this, MyRequest.class);
        // Add flags to clear the activity stack up to the target activity
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        startActivity(intent); // Start the target activity
        finish();
        super.onBackPressed();// Finish the current payment activity
    }

}