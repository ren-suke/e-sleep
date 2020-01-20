//
//  RegisterNameViewModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/21.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxOptional

class RegisterNameViewModel {
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    let validationText: Observable<String>
    let canRegister: Observable<Bool>
    
    init(nameText: Observable<String?>, nextButtonTapped: Observable<Void>, model: RegisterNameModelProtocol = RegisterNameModel()) {
        
        let textInputEvent: Observable<Event<Void>> = nameText
            .skip(2)
            .filterNil()
            .flatMap { nameText -> Observable<Event<Void>> in
                return model
                    .validation(nameText: nameText)
                    .materialize()
            }
        
        validationText = textInputEvent
            .flatMap { textInputEvent -> Observable<String> in
                switch textInputEvent {
                case .next:
                    return .just("")
                case let .error(error as RegisterNameValidationErrors):
                    return .just(error.text)
                case .error, .completed:
                    return .empty()
                }
            }
        
        canRegister = textInputEvent
            .flatMap { textInputEvent -> Observable<Bool> in
                switch textInputEvent {
                case .next, .completed:
                    return .just(true)
                case .error:
                    return .just(false)
                }
            }
    }
}

extension RegisterNameValidationErrors {
    var text: String {
        switch self {
        case .empty:
            return "名前を入力してください"
        case .long:
            return "名前は10文字以内で入力してください"
        }
    }
}
