//
//  UIColor-Extension.swift
//  LXLive
//
//  Created by pxl on 2017/1/31.
//  Copyright © 2017年 pxl. All rights reserved.
//  

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
}
