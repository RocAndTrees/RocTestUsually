//
//  CommonWebViewController.h
//  yunbo2016
//
//  Created by apple on 15/12/1.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShareModel;
@interface CommonWebViewController : UIViewController

@property (nonatomic ,strong) UIWebView *web;

-(instancetype)initWithUrlStr:(NSString *)urlStr andNavTitle:(NSString *)navTitle andShareInfo:(ShareModel *)shareInfoModel;


@end
