//
//  ResultView.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/04.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

final class ResultView: UIView {
    private var todayRankLabel = UILabel()
    private var allRankLabel = UILabel()
    private var changeLevelLabel = UILabel()
    
    init(frame: CGRect, with wakeUpResult: WakeUpResult) {
        super.init(frame: frame)

        self.todayRankLabel.text = String(wakeUpResult.todayRank)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
