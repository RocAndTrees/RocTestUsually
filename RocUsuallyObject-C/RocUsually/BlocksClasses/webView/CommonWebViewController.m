//
//  CommonWebViewController.m
//  yunbo2016
//
//  Created by apple on 15/12/1.
//  Copyright © 2015年 apple. All rights reserved.
//  共用webView

#import "CommonWebViewController.h"
#import "WebViewJavascriptBridge.h"
//#import "ShareModel.h"

@interface CommonWebViewController ()<UIWebViewDelegate,UIGestureRecognizerDelegate>

@property WebViewJavascriptBridge* bridge;

@property (nonatomic ,copy) NSString *urlStr;
@property (nonatomic ,copy) NSString *NavTitle;
@property (nonatomic , strong) ShareModel *model;
@end
@implementation CommonWebViewController

-(instancetype)initWithUrlStr:(NSString *)urlStr andNavTitle:(NSString *)navTitle andShareInfo:(ShareModel *)shareInfoModel
{
    if (self= [super init]) {
        _urlStr = urlStr;
        _NavTitle = navTitle;
        _model   = shareInfoModel;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.sc_navigationItem.title = NSLocalizedString(_NavTitle, nil);
//    if (_model.url) {
//        
//        ///* "1" 代表发布 "0" 代表未发布   *///
//        NSString *isReleased = [NSString stringWithFormat:@"%@",KgetUserValueByParaName(HCisReleased)];
//        NSString* mobile = KgetUserValueByParaName(HCmobile);
//        if ([isReleased isEqualToString:@"1"]
//            && ![mobile isEqualToString:@"13064795625"]) {
//            @weakify(self);
//            self.sc_navigationItem.rightBarButtonItem = [[SCBarButtonItem alloc]initWithTitle:@"分享" style:SCBarButtonItemStylePlain handler:^(id sender) {
//                @strongify(self);
//                
//                [YHJHelp showShareInController:self andShareURL:[NSString stringWithFormat:@"%@%@",_model.url,KgetUserValueByParaName(USERID)] andTitle:_model.title andShareText:_model.content andShareImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.logo]]]];
//                
//            }];
//        }
//        
//    }
    _web = [[UIWebView alloc]init];
    _web.scrollView.bounces = NO;
    [_web stringByEvaluatingJavaScriptFromString:
     @"document.documentElement.style.webkitUserSelect='none';"];
    _web.delegate   = self;
    _web.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_web];
     _web.frame = self.view.bounds;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[_urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    [_web loadRequest:request];
    
    //----WebViewJavaScripBride bind _web
//    [WebViewJavascriptBridge enableLogging];
//    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.web handler:^(id data, WVJBResponseCallback responseCallback) {
//    }];
    
//    @weakify(self);
    //--- register Share Handler
    [_bridge registerHandler:@"share" handler:^(id data, WVJBResponseCallback responseCallback) {
        responseCallback(@"ok");
//        @strongify(self);
        [self shareWithWebDataAction:data];
    }];
    
    
}


-(void)shareWithWebDataAction:(NSDictionary*)dataDic{
    if (dataDic) {
//        [YHJHelp showShareInController:self andShareURL:[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"url"]] andTitle:[dataDic objectForKey:@"title"] andShareText:[dataDic objectForKey:@"content"] andShareImage:[self getImageFromURL:[dataDic objectForKey:@"imageurl"]]];
    }
}

-(UIImage *) getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
//    dispatch_async(globalQueue, ^{
//        UIImage * result;
//        
//        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
//        result = [UIImage imageWithData:data];
//
//        dispatch_queue_t mainQueue = dispatch_get_main_queue();
//        dispatch_async(mainQueue, ^{
//            return result;
//        });
//    });
    UIImage * result;

    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    
    return result;
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    
//    [MBProgressHUD showHUDAddedTo:_web animated:YES];
    
}

- (void)webViewDidFinishLoad:(UIWebView*)theWebView
{
    [_web stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [_web stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
//    [MBProgressHUD hideHUDForView:_web animated:YES];
    
}

@end
