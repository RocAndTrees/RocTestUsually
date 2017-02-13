//
//  AFAppNetClient.m
//  yunbo2016
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "AFAppNetClient.h"

static AFAppNetClient *_sharedClient = nil;

@implementation AFAppNetClient

+(instancetype) sharedClient
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[super allocWithZone:NULL]init];
//                         initWithBaseURL:[NSURL URLWithString:MainAPI]];
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.requestSerializer.timeoutInterval = 15.0f;
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    });
//    if (![YHJHelp isReachable]) {
//        [YAlertView showAlertViewWithString:@"您的网络连接有点问题哦~"];
//    }
    
    return _sharedClient;
    
}

@end
