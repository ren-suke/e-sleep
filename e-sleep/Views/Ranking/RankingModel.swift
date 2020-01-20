//
//  RankingModel.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/12/05.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol RankingModelProtocol {
    func fetchToadyRanking() -> Observable<[TodayRankingDetailData]>
    func fetchAllRanking() -> Observable<[TodayRankingDetailData]>
}

final class RankingModel: RankingModelProtocol {
    func fetchToadyRanking() -> Observable<[TodayRankingDetailData]> {
        return Observable<[TodayRankingDetailData]>.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                observer.onNext(TodayDummyData.item)
            })
            return Disposables.create()
        }
    }
    
    func fetchAllRanking() -> Observable<[TodayRankingDetailData]> {
        return Observable<[TodayRankingDetailData]>.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1, execute: {
                observer.onNext(AllDummyData.item)
            })
            return Disposables.create()
        }
    }
}

struct TodayDummyData {
    static let item: [TodayRankingDetailData] = [
        
    ]
}

struct AllDummyData {
    static let item: [TodayRankingDetailData] = [
       
    ]
}
