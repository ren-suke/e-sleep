//
//  LevelBarViewModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/18.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LevelBarViewModel {
    
    private let levelRelay: BehaviorSubject<Int> = BehaviorSubject<Int>(value: 0)
    var level: Observable<Int> {
        return levelRelay.asObserver()
    }
    
    private let statusSubject: BehaviorSubject<String> = BehaviorSubject<String>(value: "Bronze")
    var status: Driver<String> {
        return statusSubject.asDriver(onErrorJustReturn: "Bronze")
    }
    
    private let progressSubject: BehaviorSubject<Float> = BehaviorSubject<Float>(value: 0)
    var progress: Driver<Float> {
        return progressSubject.asDriver(onErrorJustReturn: 0)
    }
    
    private let requiredExperiencePointStringSubject: BehaviorSubject<Int> = BehaviorSubject<Int>(value: 0)
    var requiredExperiencePointString: Observable<Int> {
        return requiredExperiencePointStringSubject.asObservable()
    }
    
    init(model: LevelBarModelProtocol = LevelBarModel()) {
        
    }
}
