//
//  AlarmViewModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

final class AlarmViewModel {
    
    private let alarmsRelay: BehaviorRelay<[Alarm]> = BehaviorRelay<[Alarm]>(value: [])
    var alarms: Observable<[Alarm]> {
        return alarmsRelay.asObservable()
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(model: AlarmModelProtocol = AlarmModel()) {
 
    }
}
