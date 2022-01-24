import UIKit
import Flutter
import Kevin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        initializeKevinSDK()
        setSdkFlutterHandler(controller)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func initializeKevinSDK() {
        KevinAccountsPlugin.shared.configure(
            KevinAccountsConfiguration.Builder(
                callbackUrl: URL(string: "https://redirect.kevin.eu/authorization.html")!
            ).build()
        )
        KevinInAppPaymentsPlugin.shared.configure(
            KevinInAppPaymentsConfiguration.Builder(
                callbackUrl: URL(string: "https://redirect.kevin.eu/payment.html")!
            ).build()
        )
    }
    
    private func setSdkFlutterHandler(_ controller: FlutterViewController) {
        KevinHandler.shared.flutterController = controller

        let sdkChannel = FlutterMethodChannel(
            name: "eu.kevin.kevin_demo_app/sdkChannel",
            binaryMessenger: controller.binaryMessenger
        )

        sdkChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            KevinHandler.shared.handle(call: call, result: result)
        })
    }
}
