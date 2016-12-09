package org.apache.cordova.tffcmb;

import android.content.Intent;
import android.util.Log;
import android.webkit.WebView;

import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TffCMB extends CordovaPlugin {
    public static final String TAG = "TffConfig";
    private CordovaWebView webView;
    private String channel = "";   //app发布渠道
    private CallbackContext callbackContext;

    /**
     * Sets the context of the Command. This can then be used to do things like
     * get file paths associated with the Activity.
     *
     * @param cordova The context of the main Activity.
     * @param webView The CordovaWebView Cordova is running in.
     */
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        this.webView = webView;
    }

    /**
     * Executes the request and returns PluginResult.
     *
     * @param action            The action to execute.
     * @param args              JSONArry of arguments for the plugin.
     * @param callbackContext   The callback id used when calling back into JavaScript.
     * @return                  True if the action was valid, false if not.
     */
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        JSONObject json =  args.getJSONObject(0);
        String url = json.getString("url");
        String jsonRequestData = json.getString("jsonRequestData");

        //得到callbackContext对象
        this.callbackContext =callbackContext;

        Intent intent=new Intent(this.cordova.getActivity(),TffCMBActivity.class);
        intent.putExtra("url",url);
        intent.putExtra("jsonRequestData",jsonRequestData);


        //加入将要传输到activity中的参数
        //启动activity
        this.cordova.startActivityForResult(this, intent, 0);
        return true;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent intent){
        String statusCode;
        switch (requestCode){
            case  0:
                if(resultCode == 1){
                    statusCode = "success";
                    callbackContext.success(statusCode);
                }
                break;
            default:
                break;
        }
    }

}
