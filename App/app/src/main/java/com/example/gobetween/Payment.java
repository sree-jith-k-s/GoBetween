package com.example.gobetween;

import static com.example.gobetween.WebServiceCaller.ip;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Payment extends AppCompatActivity {
    String sid,status;
    String fullName,lastName,email,day,month,year,gender,card,cardNumber,cvv,expyear,expmonth,totalAmount;
    EditText Fullname,Lastname,Email,Day,Month,Year,Cardnumber,Cvv,Expyear,Expmonth,Totalamount;
    RadioGroup Gender,Card;
    Button buttonpay;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);
        buttonpay = findViewById(R.id.buttonpay);
        Fullname = findViewById(R.id.full_name);
        Lastname = findViewById(R.id.last_name);
        Email = findViewById(R.id.email);
        Day = findViewById(R.id.day);
        Month = findViewById(R.id.month);
        Year = findViewById(R.id.year);
        Cardnumber = findViewById(R.id.card_number);
        Cvv = findViewById(R.id.cvv);
        Expmonth = findViewById(R.id.expmonth);
        Expyear = findViewById(R.id.expyear);
        Gender = findViewById(R.id.gender);
        Card = findViewById(R.id.card);
        Totalamount = findViewById(R.id.total_amount);


        Intent intent = getIntent();
        sid = intent.getStringExtra("id");
        status = intent.getStringExtra("status");
        buttonpay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                fullName = Fullname.getText().toString();
                lastName = Lastname.getText().toString();
                email = Email.getText().toString();
                day = Day.getText().toString();
                month = Month.getText().toString();
                year = Year.getText().toString();
                cardNumber = Cardnumber.getText().toString();
                cvv = Cvv.getText().toString();
                expmonth = Expmonth.getText().toString();
                expyear = Expyear.getText().toString();
//                if (status.equals("0"))
//                {
//                }
                if (!fullName.isEmpty()&&!lastName.isEmpty()&&!email.isEmpty()&&!day.isEmpty()&&!month.isEmpty()&&!year.isEmpty()&&!cardNumber.isEmpty()&&!cvv.isEmpty()&&!expyear.isEmpty()&&!expmonth.isEmpty()){
                    payment sp = new payment();
                    sp.execute(sid, status);
                    Intent i = new Intent(Payment.this, RequestDetails.class);
                    i.putExtra("id",sid);
                    startActivity(i);
                } else {
                    // If empty, display a toast message
                    Toast.makeText(Payment.this, "Please enter your details", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
    public class payment extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("payment");
            wb.addProperty("id", strings[0]);
            wb.addProperty("status", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }
        protected void onPostExecute(String message) {
            // Display a toast message with the submitted feedback
            Toast.makeText(Payment.this, "Payment Successful", Toast.LENGTH_SHORT).show();
        }
    }
}