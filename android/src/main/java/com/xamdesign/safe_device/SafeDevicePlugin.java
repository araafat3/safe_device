package com.xamdesign.safe_device;

import android.content.Context;
import androidx.annotation.NonNull;

import com.xamdesign.safe_device.Emulator.EmulatorCheck;
import com.xamdesign.safe_device.Rooted.RootedCheck;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** SafeDevicePlugin */
public class SafeDevicePlugin implements FlutterPlugin, MethodCallHandler {
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    this.context = binding.getApplicationContext();
    final MethodChannel channel = new MethodChannel(
            binding.getBinaryMessenger(),
            "s"
    );
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    context = null;
  }

  @Override
  public void onMethodCall(MethodCall call, final Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("n")) {
      result.success(RootedCheck.isJailBroken(context));
    }else if (call.method.equals("r")) {
      result.success(!EmulatorCheck.isEmulator());
    }else {
      result.notImplemented();
    }
  }
}
