//
//  Alarm.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

final class Alarm: Object {
    @objc dynamic var notificationIdentifier: String = ""
    @objc dynamic var time: String = ""
    @objc dynamic var isEnabled: Bool = false
}
