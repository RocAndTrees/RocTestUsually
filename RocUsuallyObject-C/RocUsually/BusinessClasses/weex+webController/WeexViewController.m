//
//  WeexViewController.m
//  RocUsually
//
//  Created by pxl on 2017/2/6.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "WeexViewController.h"
#import <WeexSDK/WeexSDK.h>

#define CURRENT_IP @"your computer device ip"

#if TARGET_IPHONE_SIMULATOR
#define DEMO_HOST @"127.0.0.1"
#else
#define DEMO_HOST CURRENT_IP
#endif

#define DEMO_URL(path) [NSString stringWithFormat:@"http://%@:12580/%s", DEMO_HOST, #path]

#define HOME_URL [NSString stringWithFormat:@"http://%@:12580/examples/build/index.js", DEMO_HOST]

#define BUNDLE_URL [NSString stringWithFormat:@"file://%@/bundleJS/image1.js",[NSBundle mainBundle].bundlePath]

#define UITEST_HOME_URL @"http://test?_wx_tpl=http://localhost:12580/test/build/TC__Home.js"

#define QRSCAN  @"com.taobao.WeexDemo.scan"
#define WEEX_COLOR [UIColor colorWithRed:0.27 green:0.71 blue:0.94 alpha:1]



@interface WeexViewController ()
@property (nonatomic, strong) UIView *weexView;
@property (nonatomic, strong) WXSDKInstance *instance;

@end

@implementation WeexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat _weexHeight = self.view.frame.size.height - 64;

     _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(self.view.frame.size.width-width, 0, width, _weexHeight);

    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, weakSelf.weexView);
    };
    _instance.onFailed = ^(NSError *error) {
        //process failure
    };
    _instance.renderFinish = ^ (UIView *view) {
        
        [weakSelf updateInstanceState:WeexInstanceAppear];
    };
    self.url = [NSURL URLWithString:BUNDLE_URL];
//    if (!self.url) {
//        WXLogError(@"error: render url is nil");
//        return;
//    }
//
//    
//    NSURL *URL = [self testURL: [self.url absoluteString]];
//    NSString *randomURL = [NSString stringWithFormat:@"%@%@random=%d",URL.absoluteString,URL.query?@"&":@"?",arc4random()];
//
//    
//    [_instance renderWithURL:[NSURL URLWithString:randomURL] options:@{@"bundleUrl":URL.absoluteString} data:nil];
    
    [self loadLocalBundle:_url];
}


- (NSURL*)testURL:(NSString*)url
{
    NSRange range = [url rangeOfString:@"_wx_tpl"];
    if (range.location != NSNotFound) {
        NSString *tmp = [url substringFromIndex:range.location];
        NSUInteger start = [tmp rangeOfString:@"="].location;
        NSUInteger end = [tmp rangeOfString:@"&"].location;
        ++start;
        if (end == NSNotFound) {
            end = [tmp length] - start;
        }
        else {
            end = end - start;
        }
        NSRange subRange;
        subRange.location = start;
        subRange.length = end;
        url = [tmp substringWithRange:subRange];
    }
    return [NSURL URLWithString:url];
}



- (void)loadLocalBundle:(NSURL *)url
{
    NSURL * localPath = nil;
    NSMutableArray * pathComponents = nil;
    if (self.url) {
        pathComponents =[NSMutableArray arrayWithArray:[url.absoluteString pathComponents]];
        [pathComponents removeObjectsInRange:NSRangeFromString(@"0 3")];
        [pathComponents replaceObjectAtIndex:0 withObject:@"bundlejs"];
        
        NSString *filePath = [NSString stringWithFormat:@"%@/%@",[NSBundle mainBundle].bundlePath,[pathComponents componentsJoinedByString:@"/"]];
        localPath = [NSURL fileURLWithPath:filePath];
    }else {
        NSString *filePath = [NSString stringWithFormat:@"%@/bundlejs/index.js",[NSBundle mainBundle].bundlePath];
        localPath = [NSURL fileURLWithPath:filePath];
    }
    
//    NSString *bundleUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bundlejs/",[NSBundle mainBundle].bundlePath]].absoluteString;
    [_instance renderWithURL:[NSURL URLWithString:BUNDLE_URL] options:@{@"bundleUrl":BUNDLE_URL} data:nil];
}


- (void)updateInstanceState:(WXState)state
{
    if (_instance && _instance.state != state) {
        _instance.state = state;
        
        if (state == WeexInstanceAppear) {
            [[WXSDKManager bridgeMgr] fireEvent:_instance.instanceId ref:WX_SDK_ROOT_REF type:@"viewappear" params:nil domChanges:nil];
        }
        else if (state == WeexInstanceDisappear) {
            [[WXSDKManager bridgeMgr] fireEvent:_instance.instanceId ref:WX_SDK_ROOT_REF type:@"viewdisappear" params:nil domChanges:nil];
        }
    }
}
@end
