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
    func getExperiencePointTable() -> [Experience]
    func getUser() -> Observable<User>
}

final class LevelBarModel: LevelBarModelProtocol {
    func getExperiencePointTable() -> [Experience] {
        return [Experience]()
    }
    
    func getUser() -> Observable<User> {
        return .empty()
    }
}
