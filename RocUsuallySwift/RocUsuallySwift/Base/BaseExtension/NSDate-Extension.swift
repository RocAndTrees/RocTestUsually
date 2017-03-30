//
//  NSDate-Extension.swift
//  LXLive
//
//  Created by pxl on 2017/2/6.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

extension Date {

    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
    
}
