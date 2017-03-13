/**
 * Created by Weex.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the Apache Licence 2.0.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import "WXEventModule.h"
#import <WeexSDK/WXBaseViewController.h>

//#import "RechargeableViewController.h"
//#import "MyParkingSpaceViewCtrl.h"


@implementation WXEventModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openURL:))
WX_EXPORT_METHOD(@selector(pushviewControll:))
WX_EXPORT_METHOD(@selector(clean:))
WX_EXPORT_METHOD(@selector(parking:))
WX_EXPORT_METHOD(@selector(area:))
WX_EXPORT_METHOD(@selector(qrcode:))
WX_EXPORT_METHOD(@selector(recharge:))

//---test
WX_EXPORT_METHOD_SYNC(@selector(getString))
WX_EXPORT_METHOD_SYNC(@selector(getNumber))
WX_EXPORT_METHOD_SYNC(@selector(getArray))
WX_EXPORT_METHOD_SYNC(@selector(getObject))



- (void)openURL:(NSString *)url
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        // relative path
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    
}

#pragma mark ----- 界面跳转--------
//本地控制器
- (void)pushviewControll:(NSString *)viewController
{
    [[weexInstance.viewController navigationController] pushViewController:[[NSClassFromString(viewController) alloc] init] animated:YES];
}

//跳转到洗车界面
-(void)clean:(NSString *)pram
{
    //WashCarViewController
    [self pushviewControll:@"WashCarViewController"];
}

//跳转到泊车界面
-(void)parking:(NSString *)pram
{
    //ParkViewController
    [self pushviewControll:@"ParkViewController"];
    NSLog(@"跳转到泊车界面");
}

//选择区域
-(void)area:(NSString *)pram
{
    [self pushviewControll:@"ChooseCityViewController"];
    NSLog(@"选择城市");
}

//扫码
-(void)qrcode:(NSString *)pram
{
    [self pushviewControll:@"CustomViewController"];
    NSLog(@"扫码");
    
}

//充值
-(void)recharge:(NSString *)pram
{
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"请选择充值方式" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"现金充值", @"充值卡充值", @"车位续费充值", nil];
    [alerView show];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (buttonIndex) {
        case 1: //现金充值
        {
//            RechargeableViewController *control = [[RechargeableViewController alloc]initWithType:RechargeableMoney];
//            [[weexInstance.viewController navigationController] pushViewController:control animated:YES];
        }
            break;
        case 2: //充值卡充值
        {
//            RechargeableViewController *control = [[RechargeableViewController alloc]initWithType:RechargeableCard];
//            [[weexInstance.viewController navigationController] pushViewController:control animated:YES];
        }
            break;
        case 3: //车位续费和充值
        {
//            MyParkingSpaceViewCtrl *park = [MyParkingSpaceViewCtrl new];
//            [[weexInstance.viewController navigationController] pushViewController:park animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

///----test

- (NSString *)getString
{
    return @"testString";
}

- (NSUInteger)getNumber
{
    return 111111;
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

