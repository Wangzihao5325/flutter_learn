import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.dev/test",
                                              binaryMessenger: controller.binaryMessenger)

        batteryChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
      guard call.method == "testFun" else {
        result(FlutterMethodNotImplemented)
        return
      }
            receiveBatteryLevel(call:call, result: result)
    })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private func receiveBatteryLevel(call: FlutterMethodCall, result: FlutterResult) {
    let paramArr = call.arguments
    let arrayStr : String! = (paramArr as! Array<String>).joined(separator: ",")
    let flutterPlugin = FlutterNativePlugin();
    let res = flutterPlugin.ocFunction(arrayStr)//swift 调oc
    result(res)
    //result(arrayStr)  dart 调swift
}
