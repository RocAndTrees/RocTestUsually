//
//  YAlertView.m
//  yunbo2016
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "YAlertView.h"
#import "WFHudView.h"
#import "ViewBaseDefine.h"
 #define YAlertViewShowTime 1.5

@interface YAlertView ()

@property (strong, nonatomic) NSTimer *timer;

@end


static YAlertView *_sharedAlertView = nil;

@implementation YAlertView



+(instancetype)shareAlertView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAlertView = [[super allocWithZone:NULL]initWithFrame:CGRectMake(XScreenWidth/4, XScreenHeight / 3 * 2, XScreenWidth / 2, 40)];
        _sharedAlertView.center = CGPointMake(XScreenWidth / 2, XScreenHeight / 3);
        _sharedAlertView.font = [UIFont systemFontOfSize:13];
        _sharedAlertView.backgroundColor = [UIColor blackColor];
        _sharedAlertView.alpha = 0.f;
        _sharedAlertView.textColor = [UIColor whiteColor];
        _sharedAlertView.textAlignment = NSTextAlignmentCenter;
        _sharedAlertView.layer.masksToBounds = YES;
        _sharedAlertView.layer.cornerRadius = 4.0f;
        _sharedAlertView.numberOfLines = 0;
        
    });
    
    return _sharedAlertView ;
}


- (void)setText:(NSString *)text{
    [super setText:text];
    //	[_sharedAlertView sizeToFit];
    UIFont *tfont = self.font;
    // 获取当前文本的属性
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont, NSFontAttributeName, nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize actualsize =[text boundingRectWithSize:CGSizeMake(XScreenWidth - 64, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    
    // 更新 UILabel 的 bounds
    self.bounds = CGRectMake(0 , 0, actualsize.width + 32, MAX(40, actualsize.height + 16));
}



-(void)showAlertViewWithString:(NSString *)alertInfo
{
    if (self.superview) {
        [self removeTimer];
    }
    
    _sharedAlertView.timer = [NSTimer scheduledTimerWithTimeInterval:YAlertViewShowTime target:self selector:@selector(hidenAlertView) userInfo:nil repeats:NO];
    self.text = alertInfo;
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.8;
    }];
 
}

+(void)hidenAlertView{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self shareAlertView] hidenAlertView];
    });
}

-(void)hidenAlertView
{
    if (!self.superview) {
        [self removeTimer];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
           
            self.alpha = 0.0f;
        } completion:^(BOOL finished) {
            if (finished) {
                [self removeTimer];
                [self removeFromSuperview];
            }
            
        }];
    }
    
}


+ (void)showAlertViewWithString:(NSString *)alertInfo
{
    if (IsEmptyStr(alertInfo)) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        
    [[self shareAlertView] showAlertViewWithString:alertInfo];
        
    });
    
}

-(void)removeTimer{
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
}

+(void)showMessage:(NSString*)message
{
    if (IsEmptyStr(message)) {
        return;
    }
    
//    if (message.length >=15) {
//        XAlertContent(message);
//    }else
//    {
        [WFHudView showMsg:message inView:nil];
//    }
}

+(void)showMessageInWFHudView:(NSString*)message
{
    [WFHudView showMsg:message inView:nil];
}


@end
