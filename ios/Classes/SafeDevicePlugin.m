#import "SafeDevicePlugin.h"
#import <DTTJailbreakDetection/DTTJailbreakDetection.h>

@implementation SafeDevicePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"s"
            binaryMessenger:[registrar messenger]];
  SafeDevicePlugin* instance = [[SafeDevicePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"n" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:[self isJailBroken]]);
  }else if ([@"r" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:[self isRealDevice]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (BOOL)isJailBroken{
//    return [self checkPaths] || [self checkSchemes] || [self canViolateSandbox];
    return [DTTJailbreakDetection isJailbroken];
}

- (BOOL) isRealDevice{
    return !TARGET_OS_SIMULATOR;
}
@end
