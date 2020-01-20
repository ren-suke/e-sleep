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
    func set(user: User)
    func get() -> User
    func update(newUser: User)
}

class UserRealmOperator: UserRealmOperatorProtocol {
    
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
