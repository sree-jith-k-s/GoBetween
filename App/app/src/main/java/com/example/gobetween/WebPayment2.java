package com.example.gobetween;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

public class WebPayment2 extends AppCompatActivity {
    WebView webview;


    private String Url,Id,sid,status,amount;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_web_payment2);

//        SharedPreferences sh=getSharedPreferences("user",MODE_PRIVATE);
//        Id = sh.getString("id","");
        Intent intent = getIntent();
        sid = intent.getStringExtra("id");
        status = intent.getStringExtra("status");
        amount = intent.getStringExtra("amount");


        Url = "http://"+ WebServiceCaller.ip +":8084/GoBetween/payment2.jsp?id="+Id+"&amount="+amount;

        webview = findViewById(R.id.webview);
        webview.loadUrl(Url);

        webview.getSettings().setJavaScriptEnabled(true);
        webview.setWebViewClient(new WebViewClient()
        {
            public boolean shouldOverrideUrlLoading(WebView view , String url){
                String uri = "http://"+ WebServiceCaller.ip +":8084/GoBetween/payment2.jsp";
                if(url.equals(uri))
                {
                    Intent i = new Intent(WebPayment2.this, MyRequest.class);
                    startActivity(i);
                }
                view.loadUrl(url);
                return true;
            }
        });

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