//
//  UserOparetor.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/20.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

protocol UserRealmOperatorProtocol {
    func set(user: User)
    func get() -> User
    func update(user: User)
}

class UserRealmOperator: UserRealmOperatorProtocol {
    
}
