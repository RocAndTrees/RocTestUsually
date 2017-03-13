//
//  AppDelegate+Register.m
//  RocUsually
//
//  Created by pxl on 2017/2/6.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "AppDelegate+Register.h"

#import "WXImgLoaderDefaultImpl.h"
#import "WXEventModule.h"
 #import "WXSyncTestModule.h"
#import "PXWeexEventModule.h"
#import <TBWXDevTool/WXDevTool.h>
@implementation AppDelegate (Register)

-(void)registerWeex{
    [WXAppConfiguration setAppGroup:@"AliApp"];
    [WXAppConfiguration setAppName:@"WeexDemo"];
    [WXAppConfiguration setExternalUserAgent:@"ExternalUA"];
    
    [WXSDKEngine initSDKEnvironment];
    
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
    [WXSDKEngine registerHandler:[WXEventModule new] withProtocol:@protocol(WXEventModuleProtocol)];
    
//    [WXSDKEngine registerComponent:@"select" withClass:NSClassFromString(@"WXSelectComponent")];
    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
    [WXSDKEngine registerModule:@"syncTest" withClass:[WXSyncTestModule class]];
    [WXSDKEngine registerModule:@"pxevent" withClass:[PXWeexEventModule class]];
    
    [WXSDKEngine registerComponent:@"radia" withClass:NSClassFromString(@"PXRadialMenuComponet")];
    [WXSDKEngine registerModule:@"homeEvent" withClass:[WXEventModule class]];

#if !(TARGET_IPHONE_SIMULATOR)
//    [self checkUpdate];
#endif
    
#ifdef DEBUG
//    [WXDevTool setDebug:YES];
    [WXDevTool launchDevToolDebugWithUrl:@"ws://192.168.0.123:8088/debugProxy/native"];

//    [self atAddPlugin];
    [WXDebugTool setDebug:YES];
    [WXLog setLogLevel:WXLogLevelLog];
    
#ifndef UITEST
//    [[ATManager shareInstance] show];
#endif
#else
    [WXDebugTool setDebug:NO];
    [WXLog setLogLevel:WXLogLevelError];
#endif
    
}



@end
