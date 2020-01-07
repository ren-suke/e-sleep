//
//  AlarmController.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxRealm

protocol AlarmControllerProtocol {
    static func get() -> Observable<Results<Alarm>>
    static func set(_ alarm: Alarm)
    static func edit(index: Int, _ alarm: Alarm)
    static func delete(index: Int)
}

class AlarmController: AlarmControllerProtocol {
    
    init() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    static func get() -> Observable<Results<Alarm>> {
        do {
            let realm = try Realm()
            let alarms = realm.objects(Alarm.self)
            return Observable.collection(from: alarms)
        } catch {
            return .error(RealmError.initializeError)
        }
    }
    
    static func set(_ alarm: Alarm) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(alarm)
            }
        } catch {
            fatalError()
        }
    }
    
    static func edit(index: Int, _ newAlarm: Alarm) {
        do {
            let realm = try Realm()
            let alarm = realm.objects(Alarm.self)[index]
            try realm.write {
                alarm.time = newAlarm.time
                alarm.isOn = newAlarm.isOn
            }
        } catch {
            fatalError()
        }
    }
    
    static func delete(index: Int) {
        do {
            let realm = try Realm()
            let alarm = realm.objects(Alarm.self)[index]
            try realm.write {
                realm.delete(alarm)
            }
        } catch {
            fatalError()
        }
    }
}

enum RealmError: Error {
    case initializeError
}
