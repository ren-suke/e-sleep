//
//  AddAlarmModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/06.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol AddAlarmModelProtocol {
    // dateが既に存在するか否かを確認して、存在していなければ保存
    func save(date: Date) -> Observable<Void>
}

class AddAlarmModel: AddAlarmModelProtocol {
    
    func save(date: Date) -> Observable<Void> {
        return Observable.create { observer in
            
            Disposables.create()
        }
    }
}

enum SaveAlarmError {
    case realmError
    case timeAlreadyExist
}
