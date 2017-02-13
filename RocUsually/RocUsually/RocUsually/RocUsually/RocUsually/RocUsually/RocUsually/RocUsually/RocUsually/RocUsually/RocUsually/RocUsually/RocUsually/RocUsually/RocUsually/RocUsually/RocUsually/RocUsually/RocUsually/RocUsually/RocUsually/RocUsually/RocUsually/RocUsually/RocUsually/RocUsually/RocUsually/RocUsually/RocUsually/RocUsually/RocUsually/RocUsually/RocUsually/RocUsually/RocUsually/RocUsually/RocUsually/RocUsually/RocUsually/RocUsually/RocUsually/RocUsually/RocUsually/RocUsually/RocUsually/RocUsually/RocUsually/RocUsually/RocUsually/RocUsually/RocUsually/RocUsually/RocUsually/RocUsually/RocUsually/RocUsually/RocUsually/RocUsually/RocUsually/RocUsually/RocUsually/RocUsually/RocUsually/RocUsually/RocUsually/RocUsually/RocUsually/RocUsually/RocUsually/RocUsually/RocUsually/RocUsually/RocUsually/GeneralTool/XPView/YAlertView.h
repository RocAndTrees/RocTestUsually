//
//  YAlertView.h
//  yunbo2016
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YAlertView : UILabel


+ (void)showAlertViewWithString:(NSString *)alertInfo;

+(void)showMessage:(NSString*)message;

+(void)showMessageInWFHudView:(NSString*)message;



@end
