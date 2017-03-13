/**
 * Created by Weex.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the Apache Licence 2.0.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import "WXSyncTestModule.h"

@implementation WXSyncTestModule
@synthesize weexInstance;

WX_EXPORT_METHOD_SYNC(@selector(getString))
WX_EXPORT_METHOD_SYNC(@selector(getNumber))
WX_EXPORT_METHOD_SYNC(@selector(getArray))
WX_EXPORT_METHOD_SYNC(@selector(getObject))

- (NSString *)getString
{
    return @"testString";
}

- (NSUInteger)getNumber
{
    NSDictionary * dic = @{@"12":@"34"};
    //传一个dic到weex
    [weexInstance fireGlobalEvent:@"toast" params:dic];

    return arc4random() % 3;
}

- (NSArray *)getArray
{
    return @[@(111111),@"testString",@"testString2"];
}

- (NSDictionary *)getObject
{
    return @{@"number":@(111111), @"string1":@"testString",@"string2":@"testString2"};
}

@end
