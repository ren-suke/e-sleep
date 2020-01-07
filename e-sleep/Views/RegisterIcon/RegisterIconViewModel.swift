//
//  RegisterIcon.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

final class RegisterIconViewModel {
    
    private let uploadStatusRelay = BehaviorRelay<UploadStatus>(value: .isNotUploading)
    var uploadStatus: Observable<UploadStatus> {
        return uploadStatusRelay.asObservable()
    }

    private let disposeBag = DisposeBag()
    
    init(startButtonTapped: Observable<Void>,
         nameText: String?,
         model: RegisterIconModelProtocol = RegisterIconModel()) {
        
       
    }
}

enum UploadStatus {
    case isUploading
    case isNotUploading
    case isFailed
    case isSuccess
}

extension RegisterErrors {
    var text: String {
        switch self {
        case .cancel:
            return "通信がキャンセルされました"
        case .comunicate:
            return "サーバーとの通信に失敗しました"
        case .undefindImage:
            return "アイコン画像を設定してください"
        case .undefindName:
            return "名前を設定してください"
        case .unknown:
            return "不明なエラーです"
        }
    }
}
