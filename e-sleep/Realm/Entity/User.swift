//
//  User.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

final class User: Object {
    @objc dynamic var id: Int
    @objc dynamic var name: String = ""
    @objc dynamic var timeZone: String = "07:00"
    @objc dynamic var durationDays: Int = 0
    @objc dynamic var total_experiencePoint: Int = 0
    @objc dynamic var iconImageData: Data?
    
    init(with userDetailData: UserDetailData, iconImageData: Data?) {
        self.id = userDetailData.id
        self.name = userDetailData.name
        self.iconImageData = iconImageData
    }
}
