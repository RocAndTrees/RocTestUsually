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

@end
