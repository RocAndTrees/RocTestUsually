//
//  PXWeexEventModule.m
//  RocUsually
//
//  Created by pxl on 2017/2/7.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "PXWeexEventModule.h"
#import "WXDemoViewController.h"
#import <WeexSDK/WXBaseViewController.h>

@implementation PXWeexEventModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openURL:))

- (void)openURL:(NSString *)url
{
    NSLog(@"%@", url);
    
}





@end
