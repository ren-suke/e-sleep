//
//  RegisterNameModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/21.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import RxSwift

protocol RegisterNameModelProtocol {
    func validation(nameText: String) -> Observable<Void>
}

final class RegisterNameModel: RegisterNameModelProtocol {
    func validation(nameText: String) -> Observable<Void> {
        guard !nameText.isEmpty else {
            return Observable.error(RegisterNameValidationErrors.empty)
        }
        guard nameText.count <= 10 else {
            return Observable.error(RegisterNameValidationErrors.long)
        }
        
        return Observable.just(())
    }
}

enum RegisterNameValidationErrors: Error {
    case empty
    case long
}
