//
//  RCWebViewController.swift
//  yunbo2016
//
//  Created by pxl on 2017/3/24.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class RCWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    func loadURLString(urlString:String){
        let urlStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

        let url: NSURL = NSURL(string: urlStr!)!
//        [self loadURL:URL];

    }
}
