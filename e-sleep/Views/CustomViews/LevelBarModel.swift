//
//  LevelBarModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/18.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol LevelBarModelProtocol {
    func getExperiencePointTable() -> [ExperiencePointTable]
    func getUser() -> Observable<User>
}

class LevelBarModel: LevelBarModelProtocol {
    func getExperiencePointTable() -> [ExperiencePointTable] {
        return [ExperiencePointTable]()
    }
    
    func getUser() -> Observable<User> {
        return .empty()
    }
}
