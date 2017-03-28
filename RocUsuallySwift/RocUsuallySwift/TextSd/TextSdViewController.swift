//
//  TextSdViewController.swift
//  RocUsuallySwift
//
//  Created by pxl on 2017/3/20.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class TextSdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shadow :NSShadow = NSShadow.init()
        shadow.shadowBlurRadius = 5
        shadow.shadowColor = UIColor.red
//        shadow.shadowOffset = 20
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
