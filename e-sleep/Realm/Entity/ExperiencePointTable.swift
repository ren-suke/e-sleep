//
//  ExperiencePointTable.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

final class ExperiencePointTable: Object {
    @objc dynamic var level = 1
    @objc dynamic var requiredExperiencePoint = 100
    @objc dynamic var totalExperiencePoint = 0
}
