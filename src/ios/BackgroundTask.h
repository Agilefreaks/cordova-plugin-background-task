//
//  BackgroundTask.h
//  Copyright (c) 2015 Andrej Mihajlov
//

#import "Foundation/Foundation.h"
#import "Cordova/CDV.h"

@interface BackgroundTask : CDVPlugin

- (void)begin:(CDVInvokedUrlCommand*)command;
- (void)end:(CDVInvokedUrlCommand*)command;

@end
