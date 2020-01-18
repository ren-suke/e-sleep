//
//  AddAlarmViewModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/06.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class AddAlarmViewModel {
    
    let dateRelay = BehaviorRelay<Date>(value: Date())
    
    let dismissHandler = PublishSubject<Void>()
    let showErrorAlert = PublishSubject<String>()
    
    init(saveButtonTapped: Observable<Void>, model: AddAlarmModelProtocol = AddAlarmModel()) {
        
        let saveEvent = saveButtonTapped
            .flatMap { _ -> Observable<Event<Void>> in
                return model.save(date: self.dateRelay.value).materialize()
            }
    }
}
