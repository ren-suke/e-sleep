//
//  Ranking.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

struct RankingDetailData: Decodable {
    let rank: String
    let iconImageURL: URL
    let name: String
    let score: String
}
