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
//    func getAlarms() -> Observable<Results<Alarm>>
}

final class AlarmModel: AlarmModelProtocol {
    
    func wakeUp() -> Observable<WakeUpResult> {
        return Observable.create { observer in
            //仮
            observer.onError(RegisterErrors.cancel)
            return Disposables.create()
        }
    }
}
