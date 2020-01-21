//
//  AlarmTableViewCell.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

final class AlarmTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with alarm: Alarm) {
        timeLabel.text = alarm.time
    }
}
