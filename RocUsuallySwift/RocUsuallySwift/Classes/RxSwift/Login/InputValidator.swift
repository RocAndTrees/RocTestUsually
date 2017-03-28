//
//  InputValidator.swift
//  RocUsuallySwift
//
//  Created by pxl on 2017/3/27.
//  Copyright © 2017年 pxl. All rights reserved.
//

import UIKit

class InputValidator {
    class func isValidEmail (email: String) -> Bool {
        let re = try? NSRegularExpression(pattern: "^\\S+@\\S+\\.\\S+$", options: .caseInsensitive)
        if let re = re{
            let range = NSMakeRange(0, email.lengthOfBytes(using: String.Encoding.utf8))
            let result = re.matches(in: email, options: .reportProgress, range: range)
            return result.count > 0
        }
        return false
    }
    class func isValidPassWord(password: String)-> Bool {
        return password.characters.count >= 8
    }

}
