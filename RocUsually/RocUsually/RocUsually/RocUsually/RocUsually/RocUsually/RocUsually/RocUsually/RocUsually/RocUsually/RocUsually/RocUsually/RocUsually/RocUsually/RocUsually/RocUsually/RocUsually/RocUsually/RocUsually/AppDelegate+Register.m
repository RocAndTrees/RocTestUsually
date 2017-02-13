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
#import "WXEventModule.h"
#import "WXSyncTestModule.h"
@implementation AppDelegate (Register)

-(void)registerWeex{
    [WXAppConfiguration setAppGroup:@"AliApp"];
    [WXAppConfiguration setAppName:@"WeexDemo"];
    [WXAppConfiguration setExternalUserAgent:@"ExternalUA"];
    
    [WXSDKEngine initSDKEnvironment];
    
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
    [WXSDKEngine registerHandler:[WXEventModule new] withProtocol:@protocol(WXEventModuleProtocol)];
    
    [WXSDKEngine registerComponent:@"select" withClass:NSClassFromString(@"WXSelectComponent")];
    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
    [WXSDKEngine registerModule:@"syncTest" withClass:[WXSyncTestModule class]];
    
#if !(TARGET_IPHONE_SIMULATOR)
//    [self checkUpdate];
#endif
    
#ifdef DEBUG
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
