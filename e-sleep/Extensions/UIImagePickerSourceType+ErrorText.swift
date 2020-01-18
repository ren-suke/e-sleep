//
//  RegisterIconViewController+UIImagePickerController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/25.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

extension UIImagePickerController.SourceType {
    var errorText: String {
        switch self {
        case .camera:
            return "カメラへのアクセスを許可してください"
        case .photoLibrary:
            return "フォトライブラリへのアクセスを許可してください"
        case .savedPhotosAlbum:
            return ""
        }
    }
}
