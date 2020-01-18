//
//  RankingTableViewCell.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit
import Kingfisher

final class RankingTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.clipsToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with rankingDetailData: RankingDetailData) {
        rankLabel.text = rankingDetailData.rank
        iconImageView.kf.setImage(with: rankingDetailData.iconImageURL, placeholder: UIImage(named: "user-45"))
        nameLabel.text = rankingDetailData.name
        scoreLabel.text = rankingDetailData.score
    }
}
