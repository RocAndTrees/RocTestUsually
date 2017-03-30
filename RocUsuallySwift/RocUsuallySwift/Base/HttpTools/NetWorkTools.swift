//
//  NetWorkTools.swift
//  LXLive
//
//  Created by pxl on 2017/2/6.
//  Copyright © 2017年 pxl. All rights reserved.
//
import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetWorkTools {
    class func requestData(_ type : MethodType, URLString : String, parameters: [String:String]? = nil, finishedCallback: @escaping (_ result: AnyObject)->()){
        //1.获取类型 
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
     
        //2.网络请求
        

        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else{
                print(response.result.error!)
                return
            }
            
            finishedCallback(result as AnyObject)
        }

        
        
    }
    
    
    
    
}
