package org.apache.cordova.tffcmb;

import android.app.Activity;
import android.content.Intent;

import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.ProgressBar;


import com.toursforfun.webapp.R;

import org.apache.http.util.EncodingUtils;

import java.io.IOException;

public class TffCMBActivity extends Activity implements View.OnClickListener {
    private WebView webView;

    //返回图片、招行title
    private ImageView iv;
    //进度条
    private ProgressBar pb;

    //post参数
    private  String url;
    private String jsonRequestData;

    // private AppClientDao appClientDao =new AppClientDao();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tff_cmb);

        Intent i = getIntent();
        url = i.getStringExtra("url");
        jsonRequestData= i.getStringExtra("jsonRequestData");

        //初始化页面
        initView();

      /*  MyThread m = new MyThread();
        m.start();*/

    }

    private Handler mHandler = new Handler() {
        public void handleMessage(android.os.Message msg) {
            switch (msg.what) {
                case 1:

                    break;
                case 0:
                    break;

            }
        }
    };


    private void initView() {

        iv  = (ImageView) findViewById(R.id.td);
        iv.setOnClickListener(this);

        pb = (ProgressBar) findViewById(R.id.cmb_pb);

        webView = (WebView) findViewById(R.id.yyy);
        WebSettings webSettings = webView.getSettings();
        //设置WebView属性，能够执行Javascript脚本
        webSettings.setJavaScriptEnabled(true);
        //设置支持缩放
        webSettings.setBuiltInZoomControls(true);

        String a = "jsonRequestData" + "=" + jsonRequestData;
        //加载需要显示的网页
        webView.postUrl(url, EncodingUtils.getBytes(a,"base64"));

        webView.setWebViewClient(new WebViewClient(){
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {

                view.loadUrl(url);

                return true;
            }

          /*  //页面开始加载
            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
                pd.show();//加载的ProgressDialog 显示
            }

            //加载结束 （其实页面404等等错误的情况也算加载完成）
            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                pd.dismiss();//对话框消失 显示页面
            }*//**//*
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                if (newProgress == 100) {
                    pb.setVisibility(View.INVISIBLE);
                } else {
                    if (View.INVISIBLE == bar.getVisibility()) {
                        pb.setVisibility(View.VISIBLE);
                    }
                    pb.setProgress(newProgress);
                }
                super.onProgressChanged(view, newProgress);
            }*/
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

    @Override
    public void onClick(View v) {

        switch (v.getId()){
            case R.id.td:
                finish();
                break;
        }
    }

    // class  MyThread extends Thread{
    //     public void run(){
    //         try {
    //             appClientDao.postCMB_1(url, jsonRequestData);

    //         } catch (IOException e) {
    //             e.printStackTrace();
    //         }
    //     }
    // }

}
