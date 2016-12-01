package org.apache.cordova.tffcmb;

import android.app.Activity;
import android.content.Intent;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.ProgressBar;

import com.toursforfun.webapp.R;

import org.apache.http.util.EncodingUtils;
import cmb.pb.util.CMBKeyboardFunc;

public class TffCMBActivity extends Activity implements View.OnClickListener {
    private WebView webView;

    //返回图片、招行title
    private ImageView iv;
    //进度条
    private ProgressBar pb;

    //post参数
    private  String url;
    private String jsonRequestData;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tff_cmb);

        Intent i = getIntent();
        url = i.getStringExtra("url");
        jsonRequestData= i.getStringExtra("jsonRequestData");
        Log.i("ddd",jsonRequestData);
        //初始化页面
        initView();
        //加载页面
        postUrl();

    }

    private void initView() {

        iv  = (ImageView) findViewById(R.id.td);
        iv.setOnClickListener(this);

        pb = (ProgressBar) findViewById(R.id.cmb_pb);

        webView = (WebView) findViewById(R.id.yyy);
        WebSettings webSettings = webView.getSettings();
        //设置WebView属性，能够执行Javascript脚本
        webSettings.setJavaScriptEnabled(true);

        webSettings.setSaveFormData(false);
       /* webSettings.setSavePassword(false);*/
        //设置支持缩放
        webSettings.setSupportZoom(false);
        //加载需要显示的网页



        webView.setWebViewClient(new WebViewClient(){
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                CMBKeyboardFunc kbFunc = new CMBKeyboardFunc(TffCMBActivity.this);
                if(kbFunc.HandleUrlCall(view, url) == false)
                {
                    return super.shouldOverrideUrlLoading(view, url);
                }
                else {
                    Log.i("setWeb","1111");
                    return true;
                }
            }
        });

        webView.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                if (newProgress == 100) {
                    pb.setVisibility(View.GONE);
                } else {
                    if (View.GONE == pb.getVisibility()) {
                        pb.setVisibility(View.VISIBLE);
                    }
                    pb.setProgress(newProgress);
                }
                super.onProgressChanged(view, newProgress);
            }

        });

    }

    private void postUrl() {
        try {

            CookieSyncManager.createInstance(TffCMBActivity.this.getApplicationContext());
            CookieManager.getInstance().removeAllCookie();
            CookieSyncManager.getInstance().sync();
        } catch (Exception e) {

        }

        String a = "jsonRequestData=" + jsonRequestData;
        webView.postUrl(url, EncodingUtils.getBytes(a,"base64"));

    }

    @Override
    public void onClick(View v) {

        switch (v.getId()) {
            case R.id.td:
                finish();
                break;
        }
    }
}