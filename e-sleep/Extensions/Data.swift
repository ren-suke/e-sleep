//
//  Data.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/26.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

extension Data {
    /// Data型の変数が画像データかどうかを判断しそうであればSelf, そうでなければnilを返す
    func imageCastable() -> Data? {
        guard UIImage(data: self) != nil else {
            return nil
        }
        return self
    }
}
