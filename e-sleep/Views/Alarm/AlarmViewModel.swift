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

class AlarmViewModel {
    
    private let alarmsRelay = BehaviorRelay<[Alarm]>(value: [])
    var alarms: Observable<[Alarm]> {
        return alarmsRelay.asObservable()
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(model: AlarmModelProtocol = AlarmModel()) {
        
        model.getAlarms()
            .subscribe(onNext: { [weak self] alarmResults in
                guard let me = self else { return}
                var alarms: [Alarm] = []
                _ = alarmResults.map { alarms.append($0) }
                me.alarmsRelay.accept(alarms)
            })
            .disposed(by: disposeBag)
    }
}
