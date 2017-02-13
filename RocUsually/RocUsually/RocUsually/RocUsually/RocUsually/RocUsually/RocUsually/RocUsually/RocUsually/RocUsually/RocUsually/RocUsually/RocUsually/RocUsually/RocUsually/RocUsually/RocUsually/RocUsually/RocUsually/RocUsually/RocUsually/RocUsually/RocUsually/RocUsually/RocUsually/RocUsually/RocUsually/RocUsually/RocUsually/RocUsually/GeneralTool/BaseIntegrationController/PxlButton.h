//
//  PxlButton.h
//  P_Manage
//
//  Created by pxl on 2016/9/30.
//  Copyright © 2016年 pxl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PxlButtonStyle) {
    PxlButtonStyleLeftImageRightTitle,
    PxlButtonStyleLeftTitleRightImage,
    PxlButtonStyleUpImageDownTitle,
    PxlButtonStyleUpTitleDownImage
};

@interface PxlButton : UIButton
/// 布局方式
@property (nonatomic, assign) PxlButtonStyle layoutStyle;
/// 图片和文字的间距，默认值8
@property (nonatomic, assign) CGFloat midSpacing;

@end
