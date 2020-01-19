//
//  AllRankingDetailData.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/19.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

struct AllRankingDetailData: Decodable {
    let name: String
    let totalExperiencePoint: Int
    let iconImageURLString: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case totalExperiencePoint = "total_experience_point"
        case iconImageURLString = "icon_image_url_string"
    }
}
