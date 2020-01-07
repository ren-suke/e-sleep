//
//  AlarmModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

protocol AlarmModelProtocol {
    func wakeUp() -> Observable<WakeUpResult>
    func getAlarms() -> Observable<Results<Alarm>>
}

final class AlarmModel: AlarmModelProtocol {
    
    func wakeUp() -> Observable<WakeUpResult> {
        return Observable.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//                observer.onNext(WakeUpResult(score: 11.11, todayRank: 3, allRank: 10))
            })
            return Disposables.create()
        }
    }
    
    func getAlarms() -> Observable<Results<Alarm>> {
        return AlarmController.get()
    }
}
