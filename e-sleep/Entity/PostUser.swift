//
//  PostUser.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/19.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

struct PostUser: Encodable {
    let name: String
    let iconImage: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case iconImage = "icon_image"
    }
}
