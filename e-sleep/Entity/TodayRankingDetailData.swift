//
//  Ranking.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation

struct TodayRankingDetailData: Decodable {
    let name: String
    let score: Float
    let iconImageURLString: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case score
        case iconImageURLString = "icon_image_url_string"
    }
}
