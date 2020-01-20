//
//  ExperiencePointTable.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

final class Experience: Object {
    @objc dynamic var level: Int = 1
    @objc dynamic var requiredExperiencePoint: Int = 100
    @objc dynamic var totalExperiencePoint: Int = 0
}
