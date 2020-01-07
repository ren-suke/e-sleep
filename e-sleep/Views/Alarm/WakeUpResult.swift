//
//  WakeUpResult.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

struct WakeUpResult: Decodable {
    let todayRank: Int
    let allRank: Int
    let previousLevel: Int
    let newLevel: Int
}
