package org.apache.cordova.tffcmb;

import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TffCMB extends CordovaPlugin {
    public static final String TAG = "TffConfig";

    private String channel = "";   //app发布渠道

    /**
     * Sets the context of the Command. This can then be used to do things like
     * get file paths associated with the Activity.
     *
     * @param cordova The context of the main Activity.
     * @param webView The CordovaWebView Cordova is running in.
     */
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        channel = webView.getPreferences().getString("TffConfig_Channel", "");
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
        if ("channel".equals(action)) {
            JSONObject r = new JSONObject();
            r.put("channel", channel);
            callbackContext.success(r);
        }
        else {
            return false;
        }
        return true;
    }

    public void test(CallbackContext callbackContext) {
    
    }

}
