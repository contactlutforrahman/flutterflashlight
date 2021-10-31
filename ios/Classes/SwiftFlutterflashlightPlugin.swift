import Flutter
import UIKit

public class SwiftFlutterFlashlightPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutterflashlight", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterFlashlightPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
    case "hasFlashlight":
        result(self.hasFlashlight())
        break
    case "lightOn":
        self.toggleFlash(on: true)
        result(nil)
        break
    case "lightOff":
        self.toggleFlash(on: false)
        result(nil)
        break
    default:
        result(FlutterMethodNotImplemented)
        break
    }
  }

  private func toggleFlash(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }
        
        do {
            try device.lockForConfiguration()
            if (on && device.torchMode == AVCaptureDevice.TorchMode.off) {
                do {
                    try device.setTorchModeOn(level: 1.0)
                } catch {
                    print(error)
                }
            } else if (!on && device.torchMode == AVCaptureDevice.TorchMode.on) {
                device.torchMode = AVCaptureDevice.TorchMode.off
            }
            
            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
}
