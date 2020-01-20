//
//  ServerErrors.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

enum ServerErrors: Error {
    case communicate
    case notfound
    case unknown
    
    var title: String {
        switch self {
        case .communicate:
            return "サーバーとの通信に失敗しました"
        case .notfound:
            return "(404) サーバーが見つかりません。"
        case .unknown:
            return "不明なエラーです"
        }
    }
}
