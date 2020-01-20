//
//  URLMolder.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/19.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

class URLMolder {
    static var baseURL: String {
        #if RELEASE
            return "https://e-sleep.herokuapp.com/v1"
        #else
            return "http://localhost:3000/v1"
        #endif
    }
    
    static func mold(with path: String) -> URL {
        let urlString: String = baseURL + path
        return URL(string: urlString)!
    }
}
