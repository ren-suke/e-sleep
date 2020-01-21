//
//  UserOparetor.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

protocol UserRealmOperatorProtocol {
    /// ユーザー登録時のローカル保存
    /// - Parameter user: ユーザーデータ
    func set(user: User)
    /// ユーザー情報を取得
    func get() -> User
    /// ユーザー情報を更新
    func update(newUser: User)
}

final class UserRealmOperator: UserRealmOperatorProtocol {
    
    func set(user: User) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(user)
            }
        } catch {
            print(error)
        }
    }
    
    func get() -> User {
        do {
            let realm = try Realm()
            let user = realm.objects(User.self).first!
            return user
        } catch {
           print(error)
        }
        
        return User()
    }
    
    func update(newUser: User) {
        do {
            let realm = try Realm()
            let user = realm.objects(User.self).first!
            try realm.write {
                user.name = newUser.name
                user.iconImageData = newUser.iconImageData
                user.timeZone = newUser.timeZone
                user.totalExperiencePoint = newUser.totalExperiencePoint
                user.durationDays = newUser.durationDays
            }
        } catch {
            print(error)
        }
    }
}
