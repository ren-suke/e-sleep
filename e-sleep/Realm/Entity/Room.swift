//
//  Room.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/10.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RealmSwift

final class Room: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var iconImageData: Data?
}
