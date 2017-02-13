//
//  SeparatorHelper.m
//  yixin_iphone
//
//  Created by huangyaowu on 14-3-13.
//  Copyright (c) 2014年 Netease. All rights reserved.
//

#import "SeparatorHelper.h"
#import "ViewBaseDefine.h"
@implementation SeparatorHelper

//分离器的属性<颜色>
+ (void)separatorForView:(UIView *)view type:(SeparatorType)type
{
    UIColor *color = XColorRGB(220, 222, 224);
    [SeparatorHelper separatorForView:view type:type color:color];
}

+ (void)separatorVerticalForView:(UIView *)view rect:(CGRect)separatorRect
{
    CALayer *layer = [CALayer layer];
    UIColor *color = XColorRGB(220, 222, 224);
    layer.frame = CGRectMake(separatorRect.origin.x, separatorRect.origin.y, 0.5, separatorRect.size.height);
    layer.backgroundColor = color.CGColor;
    [view.layer addSublayer:layer];
}

+ (void)separatorHorizontalForView:(UIView *)view rect:(CGRect)separatorRect
{
    CALayer *layer = [CALayer layer];
    UIColor *color = XColorRGB(220, 222, 224);
    layer.frame = CGRectMake(separatorRect.origin.x, separatorRect.origin.y, separatorRect.size.width, 0.5);
    layer.backgroundColor = color.CGColor;
    [view.layer addSublayer:layer];
}

+ (void)separatorHorizontalForView:(UIView *)view rect:(CGRect)separatorRect color:(UIColor *)color {
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(separatorRect.origin.x, separatorRect.origin.y, separatorRect.size.width, 0.5);
    layer.backgroundColor = color.CGColor;
    [view.layer addSublayer:layer];
}

//设置layer属性
+ (void)separatorForView:(UIView *)view type:(SeparatorType)type color:(UIColor *)color
{
    CALayer *layer = [CALayer layer];
    
    switch (type) {
        case kSeparatorVerticalMiddleType:
            layer.frame = CGRectMake(view.frame.size.width * 0.5f, 0, 0.5f, view.frame.size.height);
            break;
        case kSeparatorHorizontalMiddleType:
            layer.frame = CGRectMake(0.0, view.frame.size.height * 0.5f, view.frame.size.width, 0.5f);
            break;
        case kSeparatorTopType:
            layer.frame = CGRectMake(0, 0, view.frame.size.width, 0.5f);
            break;
        case kSeparatorBottomType:
            layer.frame = CGRectMake(0, view.frame.size.height - 0.5f, view.frame.size.width, 0.5f);
            break;
        case kSeparatorRightType:
            layer.frame = CGRectMake(view.frame.size.width - 0.5f, 0, 0.5f, view.frame.size.height);
            break;
        default:
            break;
    }
    
    layer.backgroundColor = color.CGColor;
    [view.layer addSublayer:layer];
}

@end
