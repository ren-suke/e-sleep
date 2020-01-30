//
//  NSObject+ClassName.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/30.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

extension NSObject {
    
    class func className() -> String {
        return String(describing: type(of: self))
    }
}
