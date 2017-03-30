//
//  RXSwiftLoginController.swift
//  RocUsuallySwift
//
//  Created by pxl on 2017/3/27.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class RXSwiftLoginController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var register: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let emailObservable = self.email.rx.text.map{
//            (input : String) -> Bool in
//            return InputValidator.isValidEmail(email: input)
//        }
//        emailObservable.map{ (volid : Bool) -> UIColor in
//            return volid ? UIColor.orange : UIColor.clear
//            }.subscribeNext {
//                self.email.layer.borderColor = $0.CGColor
//        }
        
        
    }
    
    
}

