//
//  UIBarButtonItem-Extension.swift
//  LXLive
//
//  Created by pxl on 2017/1/18.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    class func createItem(imageName: String, highImageName: String, size: CGSize) -> UIBarButtonItem{
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: btn)
        
    }
    
    
    convenience init(imageNormal: UIImage, imageHigh: UIImage = UIImage(), size: CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(imageNormal, for: .normal)

        if imageHigh != UIImage() {
            btn.setImage(imageHigh, for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: btn)
        
    }
}
