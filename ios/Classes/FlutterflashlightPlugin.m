#import "FlutterflashlightPlugin.h"
#if __has_include(<flutterflashlight/flutterflashlight-Swift.h>)
#import <flutterflashlight/flutterflashlight-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutterflashlight-Swift.h"
#endif

@implementation FlutterFlashlightPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterFlashlightPlugin registerWithRegistrar:registrar];
}
@end
