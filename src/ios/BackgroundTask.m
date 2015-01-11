//
//  BackgroundTask.m
//  Copyright (c) 2015 Andrej Mihajlov
//

#import "Cordova/CDV.h"
#import "Cordova/CDVViewController.h"
#import "BackgroundTask.h"

@implementation BackgroundTask

- (void)begin:(CDVInvokedUrlCommand*)command {
    backgroundTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskId];
        backgroundTaskId = UIBackgroundTaskInvalid;
    }];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)end:(CDVInvokedUrlCommand*)command {

}

@end
