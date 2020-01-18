//
//  RoomCollectionViewCell.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

final class RoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var roomNameLabel: UILabel!
    @IBOutlet private weak var roomIconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
