//
//  RegisterIconModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol RegisterIconModelProtocol {
    func registerUser(name: String, imageData: Data) -> Observable<Void>
}

final class RegisterIconModel: RegisterIconModelProtocol {
    func registerUser(name: String, imageData: Data) -> Observable<Void> {
        return Observable.create { observer in
            
            return Disposables.create {
                observer.onError(RegisterErrors.cancel)
            }
        }
    }
}
