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
        
        self.view.backgroundColor = UIColor.red
        
        let button : UIButton = UIButton()
        self.view.addSubview(button)
        button.backgroundColor = UIColor.green
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    func buttonAction(){
        print("self---")
        if let view = swiftClassFromString(className: "LXSWebViewController") {
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
    
    func swiftClassFromString(className: String) -> UIViewController? {
        //方法 NSClassFromString 在Swift中已经不起作用了no effect，需要适当更改
        //官方文档方法：let myPersonClass: AnyClass? = NSClassFromString("MyGreatApp.Person")
        if  let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            let classStringName = "_TtC\(appName.characters.count)\(appName)\(className.characters.count)\(className)"
            let  cls: AnyClass? = NSClassFromString(classStringName)
            assert(cls != nil, "class not found,please check className")
            if let viewClass = cls as? UIViewController.Type {
                let view = viewClass.init()
                return view
            }
        }  
        return nil;  
    }
}
