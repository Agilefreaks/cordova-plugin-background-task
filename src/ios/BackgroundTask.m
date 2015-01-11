//
//  BackgroundTask.m
//  Copyright (c) 2015 Andrej Mihajlov
//

#import "BackgroundTask.h"

@implementation BackgroundTask

- (void)begin:(CDVInvokedUrlCommand*)command {
    __block UIBackgroundTaskIdentifier taskId;
    
    taskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:taskId];
    }];
    
    // Double should be large enough to accomodate UIBackgroundTaskIdentifier
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:taskId];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)end:(CDVInvokedUrlCommand*)command {
    NSNumber* task = [command argumentAtIndex:0];
    CDVPluginResult* pluginResult;
    
    if([task isKindOfClass:NSNumber.class]) {
        UIBackgroundTaskIdentifier taskId = task.unsignedIntegerValue;
        [[UIApplication sharedApplication] endBackgroundTask:taskId];
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid argument, integer expected."];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
