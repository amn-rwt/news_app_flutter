//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_web_browser/FlutterWebBrowserPlugin.h>)
#import <flutter_web_browser/FlutterWebBrowserPlugin.h>
#else
@import flutter_web_browser;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterWebBrowserPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterWebBrowserPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
