//
//  NSObject-Extension.swift
//  RocUsuallySwift
//
//  Created by pxl on 2017/4/10.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

extension NSObject {
    func swiftClassFromString(className: String) -> UIViewController! {
        // get the project name
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
            //拼接控制器名
            let classStringName = "\(appName).\(className)"
            //将控制名转换为类
            let classType = NSClassFromString(classStringName) as? UIViewController.Type
            if let type = classType {
                let newVC = type.init()
                return newVC
            }
        }
        return nil;
    }

}
