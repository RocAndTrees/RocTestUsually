//
//  LastViewController.swift
//  RocUsuallySwift
//
//  Created by pxl on 2017/3/13.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius;
            layer.masksToBounds = cornerRadius > 0;
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth;
        }
    }
    @IBInspectable var borderColor :UIColor?{
        didSet{
            layer.borderColor = borderColor?.cgColor;
        }
    }
    
}


class LastViewController: UIViewController {

     
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    

}
