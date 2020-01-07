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
    func fetchToadyRanking() -> Observable<[RankingDetailData]>
    func fetchAllRanking() -> Observable<[RankingDetailData]>
}

final class RankingModel: RankingModelProtocol {
    func fetchToadyRanking() -> Observable<[RankingDetailData]> {
        return Observable<[RankingDetailData]>.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                observer.onNext(TodayDummyData.item)
            })
            return Disposables.create()
        }
    }
    
    func fetchAllRanking() -> Observable<[RankingDetailData]> {
        return Observable<[RankingDetailData]>.create { observer in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1, execute: {
                observer.onNext(AllDummyData.item)
            })
            return Disposables.create()
        }
    }
}

struct TodayDummyData {
    static let item: [RankingDetailData] = [
        RankingDetailData(rank: "1", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/9796f58fcdf53596266e06faa07f0ba5.png")!, name: "name", score: "score"),
        RankingDetailData(rank: "1", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/9796f58fcdf53596266e06faa07f0ba5.png")!, name: "name", score: "score"),
        RankingDetailData(rank: "1", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/9796f58fcdf53596266e06faa07f0ba5.png")!, name: "name", score: "score"),
        RankingDetailData(rank: "1", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/9796f58fcdf53596266e06faa07f0ba5.png")!, name: "name", score: "score"),
        RankingDetailData(rank: "1", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/9796f58fcdf53596266e06faa07f0ba5.png")!, name: "name", score: "score")
    ]
}

struct AllDummyData {
    static let item: [RankingDetailData] = [
        RankingDetailData(rank: "2", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/f4c26fbb3eb211b05e32a3f8e3a33bae.png")!, name: "nnn", score: "xxx"),
        RankingDetailData(rank: "2", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/f4c26fbb3eb211b05e32a3f8e3a33bae.png")!, name: "nnn", score: "xxx"),
        RankingDetailData(rank: "2", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/f4c26fbb3eb211b05e32a3f8e3a33bae.png")!, name: "nnn", score: "xxx"),
        RankingDetailData(rank: "2", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/f4c26fbb3eb211b05e32a3f8e3a33bae.png")!, name: "nnn", score: "xxx"),
        RankingDetailData(rank: "2", iconImageURL: URL(string: "http://super-beaver.com/wp/wp-content/uploads/2018/10/f4c26fbb3eb211b05e32a3f8e3a33bae.png")!, name: "nnn", score: "xxx")
    ]
}
