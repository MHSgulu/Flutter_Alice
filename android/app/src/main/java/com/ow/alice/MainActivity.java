package com.ow.alice;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;

import org.jetbrains.annotations.NotNull;

import java.util.Objects;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

/**
 * 请注意，local_auth插件需要使用FragmentActivity而不是Activity。
 * 通过切换到清单中的FlutterActivity而不是FlutterActivity，可以很容易地做到这一点
 * （如果要扩展基类，则可以使用自己的Activity类）。
 */
//此类中的许多方法与FlutterActivity具有相同的实现。
// 出于可读性目的，复制了这些方法。
// 一定还要在FlutterActivity中复制此类中的所有更改。
public class MainActivity extends FlutterFragmentActivity {

  private static final String TAG = "MainActivity";
  private BinaryMessenger binaryMessenger;
  private static final String CHANNEL = "samples.flutter.io/battery";
  private static final String CHANNEL_1 = "com.ow.alice/android-version";

  private MethodChannel methodChannel;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }


  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    /*if(null != getFlutterEngine()){
      binaryMessenger = getFlutterEngine().getDartExecutor().getBinaryMessenger();
      //获取手机电量
      new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
        @Override
        public void onMethodCall(@NotNull MethodCall call, @NotNull MethodChannel.Result result) {
          if (call.method.equals("getBatteryLevel")) {
            int batteryLevel = getBatteryLevel();

            if (batteryLevel != -1) {
              result.success(batteryLevel);
            } else {
              result.error("UNAVAILABLE", "Battery level not available.", null);
            }
          }
          else {
            //处理对未实现方法的调用。
            result.notImplemented();
          }

        }
      });
      //获取手机安卓系统版本
      new MethodChannel(binaryMessenger,CHANNEL_1).setMethodCallHandler((call, result) -> {
        if (call.method.equals("getAndroidVersion")){
          result.success("Android " + android.os.Build.VERSION.RELEASE);
        }
        else {
          result.notImplemented();
        }
      });
    } else{
      Log.e(TAG, "getFlutterEngine(): " + getFlutterEngine());
    }*/

  }



  //获取手机电量 具体实现
  private int getBatteryLevel() {
    int batteryLevel = -1;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).
              registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
              intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }

    return batteryLevel;
  }

}
