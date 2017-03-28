//
//  ViewController.swift
//  RocUsuallySwift
//
//  Created by pxl on 2016/12/15.
//  Copyright © 2016年 pxl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button:UIButton = UIButton()
        self.view.addSubview(button)
        button.setTitle("lin", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.frame = CGRect(x: 0, y: 300, width: 100, height: 100)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside);
        
        viewDidAppear1(go: true)
    }
    
    func buttonAction() {
        print("buttonAction");
        self.navigationController?.pushViewController(RCWebViewController(), animated: true)
    }
    
    func viewDidAppear1(go animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    
}

