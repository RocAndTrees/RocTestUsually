//
//  LXWebConfigModule.m
//  RocUsually
//
//  Created by pxl on 2017/3/8.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "LXWebConfigModule.h"

@implementation LXWebConfigModule


+ (BOOL)externalAppRequiredToOpenURL:(NSURL *)URL{
    NSSet *validSchemes = [NSSet setWithArray:@[@"http", @"https"]];
    return [validSchemes containsObject:URL.scheme];
}

+(UIImage *) getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
    //    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    //    dispatch_async(globalQueue, ^{
    //        UIImage * result;
    //
    //        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    //        result = [UIImage imageWithData:data];
    //
    //        dispatch_queue_t mainQueue = dispatch_get_main_queue();
    //        dispatch_async(mainQueue, ^{
    //            return result;
    //        });
    //    });
    UIImage * result;
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}


@end
