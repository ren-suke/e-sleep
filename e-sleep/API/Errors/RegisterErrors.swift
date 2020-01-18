//
//  RegisterErrors.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

enum RegisterErrors: Error {
    case comunicate
    case cancel
    case unknown
    case undefindName
    case undefindImage
    
    var description: String {
        switch self {
        case .comunicate:
            return "サーバーとの通信に失敗しました"
        case .cancel:
            return "通信がキャンセルされました"
        case .unknown:
            return "不明なエラーです"
        case .undefindName:
            return "名前を入力してください"
        case .undefindImage:
            return "アイコンを設定してください"
        }
    }
}
