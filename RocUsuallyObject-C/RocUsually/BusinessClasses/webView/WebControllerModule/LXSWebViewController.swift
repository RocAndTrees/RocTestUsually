//
//  LXSWebViewController.swift
//  RocUsually
//
//  Created by pxl on 2017/3/13.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class LXSWebViewController: UIViewController {
    var url = ""
    var navTitle = ""
    let web :UIWebView = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        web.scrollView.bounces = false
        web.stringByEvaluatingJavaScript(from: "document.documentElement.style.webkitUserSelect='none';")
//        web.delegate = self
        web.scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(web)
//        let request : NSURLRequest = NSURLRequest(url: URL())
//        URL(string: NSString.init(data: url.data(using: .utf8), encoding: .utf8))
        
        
    }

    



}
