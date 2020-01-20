//
//  RankingAPIClient.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/19.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol RankingAPIClientProtocol {
    func fetchTodayRanking() -> Single<[TodayRankingDetailData]>
    func fetchAllRanking() -> Single<[AllRankingDetailData]>
}

final class RankingAPIClient: RankingAPIClientProtocol {
    func fetchTodayRanking() -> Single<[TodayRankingDetailData]> {
        let url: URL = URLMolder.mold(with: "/ranking/today")
        let request: URLRequest = URLRequest(url: url)
        
        return Single<[TodayRankingDetailData]>.create(subscribe: { observer -> Disposable in
            APIClient.request(with: request, success: { data in
                do {
                    let decoder = JSONDecoder()
                    let todayRanking = try decoder.decode([TodayRankingDetailData].self, from: data)
                    observer(.success(todayRanking))
                } catch {
                    observer(.error(ClientErrors.decode))
                }
            }, failed: { statusCode, error in
                observer(.error(ServerErrors.unknown))
            })
            
            return Disposables.create()
        })
    }
    
    func fetchAllRanking() -> Single<[AllRankingDetailData]> {
        let url: URL = URLMolder.mold(with: "/ranking/all")
        let request: URLRequest = URLRequest(url: url)
        
        return Single<[AllRankingDetailData]>.create(subscribe: { observer -> Disposable in
            APIClient.request(with: request, success: { data in
                do {
                    let decoder = JSONDecoder()
                    let allRanking = try decoder.decode([AllRankingDetailData].self, from: data)
                    observer(.success(allRanking))
                } catch {
                    observer(.error(ClientErrors.decode))
                }
            }, failed: { statusCode, error in
                observer(.error(ServerErrors.unknown))
            })
            
            return Disposables.create()
        })
    }
}
