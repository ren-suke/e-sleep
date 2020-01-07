//
//  RankingViewModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct RankingViewModelInputs {
    let segmentedControl: Observable<Int>
    let refreshControl: Observable<Void>
}

class RankingViewModel {
    
    private let rankingRelay = BehaviorRelay<[RankingDetailData]>(value: [])
    var ranking: Driver<[RankingDetailData]> {
        return rankingRelay.asDriver(onErrorJustReturn: [])
    }
    
    private let todayRankingRelay = BehaviorSubject<[RankingDetailData]>(value: [])
    private let allRankingRelay = BehaviorSubject<[RankingDetailData]>(value: [])
    
    init(with input: RankingViewModelInputs, model: RankingModelProtocol = RankingModel()) {
        
        
    }
}
