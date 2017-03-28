//
//  RCWebViewController.swift
//  yunbo2016
//
//  Created by pxl on 2017/3/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import WebKit
class RCWebViewController: UIViewController {

    //---create wkwebView
    let wkWebViwe:WKWebView = {
//        [weak self] in
        let wkWeb = WKWebView()
        wkWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        wkWeb.navigationDelegate = self as! WKNavigationDelegate?
//        wkWeb.uiDelegate = self as! WKUIDelegate?
        wkWeb.isMultipleTouchEnabled = true
        wkWeb.autoresizesSubviews = true
        wkWeb.scrollView.alwaysBounceVertical = true
        
        return wkWeb
    
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(wkWebViwe)
         //Progress 检测
//        wkWebViwe.addObserver(self, forKeyPath: NSStringFromSelector(#selector(estimatedProgress)), options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
        
    }
    
    func estimatedProgress() {
        
    }
}




extension RCWebViewController{
    
    func loadURLString(urlString:String){
        let urlStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let url: NSURL = NSURL(string: urlStr!)!
    }

    
    
}
