//
//  ResultView.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

final class ResultView: UIView {
    @IBOutlet private weak var todayRankLabel: UILabel!
    @IBOutlet private weak var allRankLabel: UILabel!
    @IBOutlet private weak var changeLevelLabel: UILabel!
    
    init(frame: CGRect, with wakeUpResult: WakeUpResult) {
        super.init(frame: frame)

    
        self.todayRankLabel.text = String(wakeUpResult.todayRank)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    private func configure() {
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    
    
}
