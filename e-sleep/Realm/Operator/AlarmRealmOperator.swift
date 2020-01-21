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
    /// アラームをセットする
    /// - Parameter alarm:
    func set(alarm: Alarm)
    /// アラーム一覧を取得
    func get() -> [Alarm]
    /// アラームを更新する
    /// - Parameter newAlarm:
    func update(newAlarm: Alarm)
    /// アラームを削除
    /// - Parameter alarm: Q
    func delete(alarm: Alarm)
}

final class AlarmRealmOperator: AlarmRealmOperatorProtocol {
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
