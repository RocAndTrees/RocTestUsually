
//
//  LXWebViewController.m
//  RocUsually
//
//  Created by pxl on 2017/3/6.
//  Copyright © 2017年 pxl. All rights reserved.
//

#import "LXWebViewController.h"
@class ShareModel;
#import <Masonry/Masonry.h>

#import "LXWebConfigModule.h"
#import "WebViewJavascriptBridge.h"


#import "TUSafariActivity.h"
#import "ARChromeActivity.h"

static void *KINWebBrowserContext = &KINWebBrowserContext;

@interface LXWebViewController () <UIAlertViewDelegate>

@property WebViewJavascriptBridge* bridge;


@property (nonatomic, assign) BOOL previousNavigationControllerToolbarHidden, previousNavigationControllerNavigationBarHidden;
@property (nonatomic, strong) UIBarButtonItem *backButton, *forwardButton, *refreshButton, *stopButton, *fixedSeparator, *flexibleSeparator;

@property (nonatomic, strong) NSTimer *fakeProgressTimer;
@property (nonatomic, strong) UIPopoverController *actionPopoverController;

@property (nonatomic, strong) NSURL *URLToLaunchWithPermission;
@property (nonatomic, strong) UIAlertView *externalAppPermissionAlertView;

///----  Initializers property
@property (nonatomic ,copy) NSString *urlStr;
@property (nonatomic ,copy) NSString *NavTitle;
@property (nonatomic , strong) ShareModel *model;

@end


@implementation LXWebViewController


#pragma mark - ---- lefe cycle 🍏

#pragma mark - Static Initializers

+ (LXWebViewController *)webBrowser { //普通初始化
    LXWebViewController *webBrowserViewController = [LXWebViewController webBrowserWithConfiguration:nil];
    return webBrowserViewController;
}

+ (LXWebViewController *)webBrowserWithUrlStr:(NSString *)urlStr andNavTitle:(NSString *)navTitle{    LXWebViewController *webBrowserViewController = [[self alloc] initWithUrlStr:urlStr andNavTitle:navTitle andShareInfo:nil];
    return webBrowserViewController;
}

+ (LXWebViewController *)webBrowserWithConfiguration:(WKWebViewConfiguration *)configuration {
    LXWebViewController *webBrowserViewController = [[self alloc] initWithConfiguration:configuration];
    return webBrowserViewController;
}


#pragma mark - Initializers

-(instancetype)initWithUrlStr:(NSString *)urlStr andNavTitle:(NSString *)navTitle andShareInfo:(ShareModel *)shareInfoModel
{
    _urlStr = urlStr;
    _NavTitle = navTitle;
    _model   = shareInfoModel;
    return [self initWithConfiguration:nil];;
}


- (id)init {
    return [self initWithConfiguration:nil];
}

- (id)initWithConfiguration:(WKWebViewConfiguration *)configuration {
    self = [super init];
    if(self) {
             if(configuration) {
                self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
            }
            else {
                self.wkWebView = [[WKWebView alloc] init];
            }
        
        self.actionButtonHidden = NO;
        self.showsURLInNavigationBar = NO;
        self.showsPageTitleInNavigationBar = YES;
        
        self.externalAppPermissionAlertView = [[UIAlertView alloc] initWithTitle:@"Leave this app?" message:@"This web page is trying to open an outside app. Are you sure you want to open it?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open App", nil];
        
    }
    return self;
}




#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.previousNavigationControllerToolbarHidden = self.navigationController.toolbarHidden;
    self.previousNavigationControllerNavigationBarHidden = self.navigationController.navigationBarHidden;
    
    id webLoad;
    if(self.wkWebView) {
         [self.wkWebView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self.wkWebView setNavigationDelegate:self];
        [self.wkWebView setUIDelegate:self];
        [self.wkWebView setMultipleTouchEnabled:YES];
        [self.wkWebView setAutoresizesSubviews:YES];

        [self.wkWebView.scrollView setAlwaysBounceVertical:YES];
        [self.view addSubview:self.wkWebView];
        [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {

            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));

        }];
        [self.wkWebView evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none';" completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        }];

        self.wkWebView.scrollView.bounces = NO;
        self.wkWebView.scrollView.showsVerticalScrollIndicator = NO;

        
        webLoad = self.wkWebView;
        //Progress 检测
        [self.wkWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:KINWebBrowserContext];
    }
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self.progressView setTrackTintColor:[UIColor colorWithWhite:1.0f alpha:0.0f]];
    [self.progressView setFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height-self.progressView.frame.size.height, self.view.frame.size.width, self.progressView.frame.size.height)];
    [self.progressView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];

    
    if (_urlStr && _NavTitle) {
        [self loadURLString:_urlStr];
        self.title = _NavTitle;
    }
    
    
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

    
    //---- WebViewJavascriptBridge
    [WebViewJavascriptBridge enableLogging];
    
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:webLoad];
    
    //---分享
    [self.bridge registerHandler:@"share" handler:^(id data, WVJBResponseCallback responseCallback) {
        responseCallback(@"ok");
//        [self shareWithWebDataAction:data];

    }];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.navigationController setToolbarHidden:YES animated:YES];
    
    [self.navigationController.navigationBar addSubview:self.progressView];
    
    [self updateToolbarState];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:self.previousNavigationControllerNavigationBarHidden animated:animated];
    [self.navigationController setToolbarHidden:self.previousNavigationControllerToolbarHidden animated:animated];
    
     [self.progressView removeFromSuperview];
}
#pragma mark - Dealloc
- (void)dealloc {
    
    [self.wkWebView setNavigationDelegate:nil];
    [self.wkWebView setUIDelegate:nil];
    if ([self isViewLoaded]) {
        [self.wkWebView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
    }
}


#pragma mark - ---- event response / public Method 🍐

#pragma mark - Done Button Action

- (void)doneButtonPressed:(id)sender {
    [self dismissAnimated:YES];
}


#pragma mark - Dismiss

- (void)dismissAnimated:(BOOL)animated {
    if([self.delegate respondsToSelector:@selector(webBrowserViewControllerWillDismiss:)]) {
        [self.delegate webBrowserViewControllerWillDismiss:self];
    }
    [self.navigationController dismissViewControllerAnimated:animated completion:nil];
    
}

#pragma mark - UIBarButtonItem Target Action Methods

- (void)backButtonPressed:(id)sender {
    
    if(self.wkWebView) {
        [self.wkWebView goBack];
    }
     [self updateToolbarState];
}

- (void)forwardButtonPressed:(id)sender {
         [self.wkWebView goForward];
      [self updateToolbarState];
}

- (void)refreshButtonPressed:(id)sender {
         [self.wkWebView stopLoading];
        [self.wkWebView reload];
  }

- (void)stopButtonPressed:(id)sender {
         [self.wkWebView stopLoading];
 }

- (void)actionButtonPressed:(id)sender {
    NSURL *URLForActivityItem;
    NSString *URLTitle;
    if(self.wkWebView) {
        URLForActivityItem = self.wkWebView.URL;
        URLTitle = self.wkWebView.title;
    }
    if (URLForActivityItem) {
        dispatch_async(dispatch_get_main_queue(), ^{
            TUSafariActivity *safariActivity = [[TUSafariActivity alloc] init];
            ARChromeActivity *chromeActivity = [[ARChromeActivity alloc] init];
            
            NSMutableArray *activities = [[NSMutableArray alloc] init];
            [activities addObject:safariActivity];
            [activities addObject:chromeActivity];
            if(self.customActivityItems != nil) {
                [activities addObjectsFromArray:self.customActivityItems];
            }
            
            UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:@[URLForActivityItem] applicationActivities:activities];
            
            //--判断ipad 和 iPhone 的区别
            if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
                if(self.actionPopoverController) {
                    [self.actionPopoverController dismissPopoverAnimated:YES];
                }
                self.actionPopoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
                [self.actionPopoverController presentPopoverFromBarButtonItem:self.actionButton permittedArrowDirections: UIPopoverArrowDirectionAny animated:YES];
            }
            else {
                [self presentViewController:controller animated:YES completion:NULL];
            }
        });
    }
}

#pragma mark - Public Interface
- (void)loadRequest:(NSURLRequest *)request {
    [self.wkWebView loadRequest:request];
}

- (void)loadURL:(NSURL *)URL {
    [self loadRequest:[NSURLRequest requestWithURL:URL]];
}

- (void)loadURLString:(NSString *)URLString {
    NSURL *URL = [NSURL URLWithString:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [self loadURL:URL];
}

- (void)loadHTMLString:(NSString *)HTMLString {
    [self.wkWebView loadHTMLString:HTMLString baseURL:nil];
}

- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    [self.progressView setTintColor:tintColor];
    [self.navigationController.navigationBar setTintColor:tintColor];
    [self.navigationController.toolbar setTintColor:tintColor];
}

- (void)setBarTintColor:(UIColor *)barTintColor {
    _barTintColor = barTintColor;
    [self.navigationController.navigationBar setBarTintColor:barTintColor];
    [self.navigationController.toolbar setBarTintColor:barTintColor];
}

- (void)setActionButtonHidden:(BOOL)actionButtonHidden {
    _actionButtonHidden = actionButtonHidden;
    [self updateToolbarState];
}

#pragma mark - ---- private methods 🍊
-(void)shareWithWebDataAction:(NSDictionary*)dataDic{
    if (dataDic) {
        //        [YHJHelp showShareInController:self andShareURL:[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"url"]] andTitle:[dataDic objectForKey:@"title"] andShareText:[dataDic objectForKey:@"content"] andShareImage:[self getImageFromURL:[dataDic objectForKey:@"imageurl"]]];
    }
}

#pragma mark - Toolbar State

/**
 更新ToolBar 状态
 */
- (void)updateToolbarState {
    BOOL canGoBack = self.wkWebView.canGoBack;
    BOOL canGoForward = self.wkWebView.canGoForward;
    
    [self.backButton setEnabled:canGoBack];
    [self.forwardButton setEnabled:canGoForward];
    //避免反复创建
    if(!self.backButton) {
        [self setupToolbarItems];
    }
    
    NSArray *barButtonItems;
    if(self.wkWebView.loading) {
        barButtonItems = @[self.backButton, self.fixedSeparator, self.forwardButton, self.fixedSeparator, self.stopButton, self.flexibleSeparator];
        
        if(self.showsURLInNavigationBar) {
            NSString *URLString;
            
                URLString = [self.wkWebView.URL absoluteString];
            
            
            URLString = [URLString stringByReplacingOccurrencesOfString:@"http://" withString:@""];
            URLString = [URLString stringByReplacingOccurrencesOfString:@"https://" withString:@""];
            URLString = [URLString substringToIndex:[URLString length]-1];
            self.navigationItem.title = URLString;
        }
    }
    else {
        barButtonItems = @[self.backButton, self.fixedSeparator, self.forwardButton, self.fixedSeparator, self.refreshButton, self.flexibleSeparator];
        
        if(self.showsPageTitleInNavigationBar) {
            
                self.navigationItem.title = self.wkWebView.title;
        }
    }
    
    if(!self.actionButtonHidden) {
        NSMutableArray *mutableBarButtonItems = [NSMutableArray arrayWithArray:barButtonItems];
        [mutableBarButtonItems addObject:self.actionButton];
        barButtonItems = [NSArray arrayWithArray:mutableBarButtonItems];
    }
    
    [self setToolbarItems:barButtonItems animated:YES];
    
    self.tintColor = self.tintColor;
    self.barTintColor = self.barTintColor;
    
    
}


- (void)setupToolbarItems {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    
    self.refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshButtonPressed:)];
    self.stopButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stopButtonPressed:)];
    
    UIImage *backbuttonImage = [UIImage imageWithContentsOfFile: [bundle pathForResource:@"backbutton" ofType:@"png"]];
    self.backButton = [[UIBarButtonItem alloc] initWithImage:backbuttonImage style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPressed:)];
    
    UIImage *forwardbuttonImage = [UIImage imageWithContentsOfFile: [bundle pathForResource:@"forwardbutton" ofType:@"png"]];
    self.forwardButton = [[UIBarButtonItem alloc] initWithImage:forwardbuttonImage style:UIBarButtonItemStylePlain target:self action:@selector(forwardButtonPressed:)];
    self.actionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionButtonPressed:)];
    self.fixedSeparator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    self.fixedSeparator.width = 50.0f;
    self.flexibleSeparator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

#pragma mark - ---- delegate 🍎

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    if(webView == self.wkWebView) {
        //    [MBProgressHUD showHUDAddedTo:_web animated:YES];
        [self updateToolbarState];
        if([self.delegate respondsToSelector:@selector(webBrowser:didStartLoadingURL:)]) {
            [self.delegate webBrowser:self didStartLoadingURL:self.wkWebView.URL];
        }
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if(webView == self.wkWebView) {
        [self updateToolbarState];
        //    [MBProgressHUD hideHUDForView:_web animated:YES];
        [webView evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none';" completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        }];
        [webView evaluateJavaScript:@"document.documentElement.style.webkitTouchCallout='none';" completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        }];

        if([self.delegate respondsToSelector:@selector(webBrowser:didFinishLoadingURL:)])
        {
            [self.delegate webBrowser:self didFinishLoadingURL:self.wkWebView.URL];
        }
    }
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
      withError:(NSError *)error {
    if(webView == self.wkWebView) {
        [self updateToolbarState];
        if([self.delegate respondsToSelector:@selector(webBrowser:didFailToLoadURL:error:)]) {
            [self.delegate webBrowser:self didFailToLoadURL:self.wkWebView.URL error:error];
        }
    }
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation
      withError:(NSError *)error {
    if(webView == self.wkWebView) {
        [self updateToolbarState];
        if([self.delegate respondsToSelector:@selector(webBrowser:didFailToLoadURL:error:)]) {
            [self.delegate webBrowser:self didFailToLoadURL:self.wkWebView.URL error:error];
        }
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if(webView == self.wkWebView) {
        
        NSURL *URL = navigationAction.request.URL;
        if([LXWebConfigModule externalAppRequiredToOpenURL:URL]) {
            if(!navigationAction.targetFrame) {
                [self loadURL:URL];
                decisionHandler(WKNavigationActionPolicyCancel);
                return;
            }
        }
        else if([[UIApplication sharedApplication] canOpenURL:URL]) {
            [self launchExternalAppWithURL:URL];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - WKUIDelegate

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}



#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(alertView == self.externalAppPermissionAlertView) {
        if(buttonIndex != alertView.cancelButtonIndex) {
            [[UIApplication sharedApplication] openURL:self.URLToLaunchWithPermission];
        }
        self.URLToLaunchWithPermission = nil;
    }
}

#pragma mark - ---- getters and setters 🍋


#pragma mark - Estimated Progress KVO (WKWebView)

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.wkWebView) {
        [self.progressView setAlpha:1.0f];
        BOOL animated = self.wkWebView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.wkWebView.estimatedProgress animated:animated];
        
        // Once complete, fade out UIProgressView
        // 走通后 渐变 隐藏 UIProgressView
        if(self.wkWebView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark - External App Support

- (void)launchExternalAppWithURL:(NSURL *)URL {
    self.URLToLaunchWithPermission = URL;
    if (![self.externalAppPermissionAlertView isVisible]) {
        [self.externalAppPermissionAlertView show];
    }
    
}



#pragma mark - Interface Orientation

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskAllButUpsideDown;
//}

//- (BOOL)shouldAutorotate {
//    return YES;
//}

@end


@implementation UINavigationController(KINWebBrowser)

- (LXWebViewController *)rootWebBrowser {
    UIViewController *rootViewController = [self.viewControllers objectAtIndex:0];
    return (LXWebViewController *)rootViewController;
}

@end
