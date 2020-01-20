//
//  AlarmRealmOperator.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

//realmとのやり取りのみ行う

protocol AlarmRealmOperatorProtocol {
    func set(alarm: Alarm)
    func get() -> [Alarm]
    func update(newAlarm: Alarm)
    func delete(alarm: Alarm)
}

class AlarmRealmOperator: AlarmRealmOperatorProtocol {
    func set(alarm: Alarm) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(alarm)
            }
        } catch {
           print(error)
        }
    }
    
    func get() -> [Alarm] {
        var alarms: [Alarm] = []
        do {
            let realm = try Realm()
            _ = realm.objects(Alarm.self).map { alarms.append($0) }
        } catch {
            print(error)
        }
        return alarms
    }
    
    func update(newAlarm: Alarm) {
        do {
            let realm = try Realm()
            let alarm = realm.objects(Alarm.self).filter("notificationIdentifier == '\(newAlarm.notificationIdentifier)'").first
            try realm.write {
                alarm?.notificationIdentifier = newAlarm.notificationIdentifier
            }
        } catch {
            print(error)
        }
    }
    
    func delete(alarm: Alarm) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(alarm)
            }
        } catch {
            print(error)
        }
    }
}
