package com.blink.blinkled;

import com.blink.blinkled.R;
import android.app.Activity;
import android.os.ServiceManager;
import android.os.Bundle;
import android.content.Context;
import android.os.IOpersysService;
import android.os.ServiceManager;
import android.os.RemoteException;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;

public class Blink extends Activity {
    private final static String LOG_TAG = "PhuLA HelloOpersysInternal";

    private IOpersysService blinkService = null;

    private Button ledOff = null;
    private Button ledOn = null;

    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        blinkService = IOpersysService.Stub.asInterface(ServiceManager.getService("opersys"));

        Log.i(LOG_TAG, "Blink Activity Created");
    }

    // @Override
    public void clickOn(View v) {
        try {
            String val = "1";
            blinkService.write(val);
        } catch (RemoteException e) {
            Log.e(LOG_TAG, "Remote Exception while writing value to device.");
        }
    }
    // @Override
    public void clickOff(View v) {
        try {
            String val = "0";
            blinkService.write(val);
        } catch (RemoteException e) {
            Log.e(LOG_TAG, "Remote Exception while writing value to device.");
        }
    }
    
}
