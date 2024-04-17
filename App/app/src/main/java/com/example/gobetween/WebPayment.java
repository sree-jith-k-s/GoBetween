package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

public class WebPayment extends AppCompatActivity {
    WebView webview;


    private String Url,Id,sid,status,amount;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_web_payment);

//        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
//        Id = sh.getString("id","");
        Intent intent = getIntent();
        sid = intent.getStringExtra("id");
        status = intent.getStringExtra("status");
        amount = intent.getStringExtra("amount");


        Url = "http://"+ WebServiceCaller.ip +":8084/GoBetween/payment.jsp?id="+sid+"&amount="+amount;


        webview = findViewById(R.id.webview);
        webview.loadUrl(Url);

        webview.getSettings().setJavaScriptEnabled(true);
        webview.setWebViewClient(new WebViewClient()
        {
            public boolean shouldOverrideUrlLoading(WebView view , String url){
                String uri = "http://"+ WebServiceCaller.ip +":8084/GoBetween/payment.jsp";
                if(url.equals(uri))
                {
//                    Toast.makeText(WebPayment.this, Url, Toast.LENGTH_SHORT).show();
                    Intent i = new Intent(WebPayment.this, MyRequest.class);
                    startActivity(i);
                }
                view.loadUrl(url);
                return true;
            }
        });

    }
    private void triggerFunction() {
        // Add your code here to handle the button click action
        // For example, show a toast message
        Toast.makeText(this, "Button Clicked on JSP Page", Toast.LENGTH_SHORT).show();
    }
    @Override
    public void onBackPressed() {
        if(webview.canGoBack())
        {
            webview.goBack();
        }
        else
            super.onBackPressed();
    }
}