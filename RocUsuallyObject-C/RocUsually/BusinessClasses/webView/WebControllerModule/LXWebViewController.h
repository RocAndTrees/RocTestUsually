//
//  LXWebViewController.h
//  RocUsually
//
//  Created by pxl on 2017/3/6.
//  Copyright © 2017年 pxl. All rights reserved.
//
//  ---关于进度条progress wk 真实使用 UI 通过fake （模拟）

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@class LXWebViewController;

/*
 
 UINavigationController+KINWebBrowserWrapper category enables access to casted KINWebBroswerViewController when set as rootViewController of UINavigationController
*/
@interface UINavigationController(KINWebBrowser)

// Returns rootViewController casted as LXWebViewController
- (LXWebViewController *)rootWebBrowser;

@end

@protocol KINWebBrowserDelegate <NSObject>

@optional
- (void)webBrowser:(LXWebViewController *)webBrowser didStartLoadingURL:(NSURL *)URL;
- (void)webBrowser:(LXWebViewController *)webBrowser didFinishLoadingURL:(NSURL *)URL;
- (void)webBrowser:(LXWebViewController *)webBrowser didFailToLoadURL:(NSURL *)URL error:(NSError *)error;
- (void)webBrowserViewControllerWillDismiss:(LXWebViewController*)viewController;
@end


/*
 
 LXWebViewController is designed to be used inside of a UINavigationController.
 For convenience, two sets of static initializers are available.
 
 */
@interface LXWebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate, UIWebViewDelegate>

#pragma mark - Public Properties

@property (nonatomic, weak) id <KINWebBrowserDelegate> delegate;

// The main and only UIProgressView
@property (nonatomic, strong) UIProgressView *progressView;

// The web views
// Depending on the version of iOS, one of these will be set
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIWebView *uiWebView;

- (id)initWithConfiguration:(WKWebViewConfiguration *)configuration NS_AVAILABLE_IOS(8_0);

#pragma mark - Static Initializers

/*
 Initialize a basic LXWebViewController instance for push onto navigation stack
 
 Ideal for use with UINavigationController pushViewController:animated: or initWithRootViewController:
 
 Optionally specify KINWebBrowser options or WKWebConfiguration
 */

+ (LXWebViewController *)webBrowser ;
+ (LXWebViewController *)webBrowserWithConfiguration:(WKWebViewConfiguration *)configuration NS_AVAILABLE_IOS(8_0);
+ (LXWebViewController *)webBrowserWithUrlStr:(NSString *)urlStr andNavTitle:(NSString *)navTitle;

/*
 Initialize a UINavigationController with a LXWebViewController for modal presentation.
 
 Ideal for use with presentViewController:animated:
 
 Optionally specify KINWebBrowser options or WKWebConfiguration
 */

+ (UINavigationController *)navigationControllerWithWebBrowser;
+ (UINavigationController *)navigationControllerWithWebBrowserWithConfiguration:(WKWebViewConfiguration *)configuration NS_AVAILABLE_IOS(8_0);


@property (nonatomic, strong) UIBarButtonItem *actionButton;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, assign) BOOL actionButtonHidden;
@property (nonatomic, assign) BOOL showsURLInNavigationBar;
@property (nonatomic, assign) BOOL showsPageTitleInNavigationBar;

//Allow for custom activities in the browser by populating this optional array
@property (nonatomic, strong) NSArray *customActivityItems;

#pragma mark - Public Interface


// Load a NSURLURLRequest to web view
// Can be called any time after initialization
- (void)loadRequest:(NSURLRequest *)request;

// Load a NSURL to web view
// Can be called any time after initialization
- (void)loadURL:(NSURL *)URL;

// Loads a URL as NSString to web view
// Can be called any time after initialization
- (void)loadURLString:(NSString *)URLString;


// Loads an string containing HTML to web view
// Can be called any time after initialization
- (void)loadHTMLString:(NSString *)HTMLString;

@end


