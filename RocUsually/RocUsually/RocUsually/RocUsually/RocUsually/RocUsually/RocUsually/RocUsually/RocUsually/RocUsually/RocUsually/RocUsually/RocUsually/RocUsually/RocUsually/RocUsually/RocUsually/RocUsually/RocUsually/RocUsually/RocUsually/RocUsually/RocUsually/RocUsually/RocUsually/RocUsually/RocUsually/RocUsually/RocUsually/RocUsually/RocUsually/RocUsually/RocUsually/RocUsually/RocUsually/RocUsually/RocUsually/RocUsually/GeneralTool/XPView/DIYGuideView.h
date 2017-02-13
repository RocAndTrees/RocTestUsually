//
//  DIYGuideView.h
//  yunbo2016
//
//  Created by Hanks on 16/1/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIYGuideView : UIView

@property (nonatomic , strong) UIImageView   *guidImageView;
-(instancetype)initShowGuidWithImage:(NSString *)imageName andContentMode:(UIViewContentMode)contentMode inView:(UIView *)showView;

@end
