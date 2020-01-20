//
//  ClientErrors.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

enum ClientErrors: Error {
    case decode
    case encode
    case unknown
    
    var title: String {
        switch self {
        case .decode:
            return "デコードに失敗しました"
        case .encode:
            return "エンコードに失敗しました"
        case .unknown:
            return "不明なエラーです"
        }
    }
}
