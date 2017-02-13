//
//  ViewBaseDefine.h
//  RocUsually
//
//  Created by pxl on 2016/12/9.
//  Copyright © 2016年 pxl. All rights reserved.
//

#ifndef ViewBaseDefine_h
#define ViewBaseDefine_h



//只有在少部分大量用到某个版本以上API的地方才使用
#define IOS9            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 9.0)
#define IOS8            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0)
#define IOS7            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)

//-------------------获取设备大小------------------------- size point!
// NavBar高度
#define XNavigationBarHeight (44.0)
// 状态栏高度
#define XStatusBarHeight (20)
// 顶部高度
#define XTopHeight (XNavigationBarHeight + XStatusBarHeight)
// 底部 TabBar 高度
#define XTabBarHeight 49
// 动态获取屏幕宽高
#define XScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define XScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)//是否是iPhone
//#define SCREEN_MAX_LENGTH (MAX(KScreenWidth, KScreenHeight)) //最大
//#define SCREEN_MIN_LENGTH (MIN(KScreenWidth, KScreenHeight))//最小
//------------------版本判断
#define IPHONE3_5INCH   ([[UIScreen mainScreen] bounds].size.height == 480)
#define IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0)
#define IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


/**
 *  判断是否是空字符串 非空字符串 ＝ yes
 *
 *  @param string
 *
 *  @return
 */

#define  NOEmptyStr(string)  string == nil ||[string isEqualToString: @""] || string == NULL ||[string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 ? NO : YES

/**
 *  判断是否是空字符串 空字符串 = yes
 *
 *  @param string
 *
 *  @return
 */
#define  IsEmptyStr(string) string == nil || string == NULL || [string isEqualToString:@""] ||[string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0 ? YES : NO



/*提示弹窗的初始化 走代理*/
#define XAlertContent(content) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"云泊" \
message:content \
delegate:self   \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil];  \
[alert show];

/*提示弹窗的初始化 不走代理*/
#define XAlertUnContent(content) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"云泊" \
message:content \
delegate:nil   \
cancelButtonTitle:@"确定" \
otherButtonTitles:nil];  \
[alert show];



//------
// 颜色
#define XColorRGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define XColorRGB(r, g, b) XColorRGBA(r, g, b, 1.f)


// 十六进制转颜色
#define XColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]





#endif /* ViewBaseDefine_h */
