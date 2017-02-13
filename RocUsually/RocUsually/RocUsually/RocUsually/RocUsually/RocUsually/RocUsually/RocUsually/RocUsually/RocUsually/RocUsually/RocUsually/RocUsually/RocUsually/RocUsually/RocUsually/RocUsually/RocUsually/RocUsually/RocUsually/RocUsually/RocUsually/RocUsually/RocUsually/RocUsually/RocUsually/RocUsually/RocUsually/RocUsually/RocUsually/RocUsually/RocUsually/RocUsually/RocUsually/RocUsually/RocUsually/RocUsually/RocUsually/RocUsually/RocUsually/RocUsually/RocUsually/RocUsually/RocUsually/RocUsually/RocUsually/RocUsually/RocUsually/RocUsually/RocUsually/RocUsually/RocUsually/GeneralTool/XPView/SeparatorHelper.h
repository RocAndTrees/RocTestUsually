//
//  SeparatorHelper.h
//  yixin_iphone
//
//  Created by huangyaowu on 14-3-13.
//  Copyright (c) 2014年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    kSeparatorTopType = 0,
    kSeparatorBottomType,
    kSeparatorVerticalMiddleType,    // 中间竖线
    kSeparatorHorizontalMiddleType,
    kSeparatorRightType,
} SeparatorType;

@interface SeparatorHelper : NSObject

+ (void)separatorForView:(UIView *)view type:(SeparatorType)type;
+ (void)separatorForView:(UIView *)view type:(SeparatorType)type color:(UIColor *)color;
+ (void)separatorVerticalForView:(UIView *)view rect:(CGRect)separatorRect;
+ (void)separatorHorizontalForView:(UIView *)view rect:(CGRect)separatorRect;
+ (void)separatorHorizontalForView:(UIView *)view rect:(CGRect)separatorRect color:(UIColor *)color;
@end
