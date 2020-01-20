//
//  UserAPIClient.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/19.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation
import RxSwift

protocol UserAPIClientProtocol {
    func create(with postUser: PostUser) -> Single<UserDetailData>
    func update(with postUser: PostUser) -> Single<Void>
    func wakeUp(with wakeUpDetailData: WakeUpDetailData) -> Single<WakeUpResult>
}

class UserAPIClient: UserAPIClientProtocol {
    func create(with postUser: PostUser) -> Single<UserDetailData> {
        let url = URLMolder.mold(with: "/users")
        var request = URLRequest(url: url)
        
        return Single<UserDetailData>.create(subscribe: { observer -> Disposable in
            request.httpMethod = HTTPMethod.POST
            
            do {
                let encoder = JSONEncoder()
                let requestBody = try encoder.encode(postUser)
                request.httpBody = requestBody
            } catch {
                observer(.error(error))
            }
            
            APIClient.request(with: request, success: { data in
                do {
                    let decoder = JSONDecoder()
                    let userDetailData = try decoder.decode(UserDetailData.self, from: data)
                    observer(.success(userDetailData))
                } catch {
                    observer(.error(error))
                }
            }, failed: { statusCode, error in
                observer(.error(error))
            })
            return Disposables.create()
        })
    }
    
    func update(with postUser: PostUser) -> Single<Void> {
        let id = 1
        let url = URLMolder.mold(with: "/users/\(id)")
        var request = URLRequest(url: url)

        return Single<Void>.create(subscribe: { observer -> Disposable in
            request.httpMethod = HTTPMethod.PUT
            
            do {
                let encoder = JSONEncoder()
                let requestBody = try encoder.encode(postUser)
                request.httpBody = requestBody
            } catch {
                observer(.error(error))
            }
            
            APIClient.request(with: request, success: { _ in
                observer(.success(()))
            }, failed: { statusCode, error in
                observer(.error(error))
            })
            return Disposables.create()
        })
    }
    
    func wakeUp(with wakeUpDetailData: WakeUpDetailData) -> Single<WakeUpResult> {
        let id = 1
        let url = URLMolder.mold(with: "users/\(id)/wakeup")
        var request = URLRequest(url: url)
        
        return Single<WakeUpResult>.create(subscribe: { observer -> Disposable in
            request.httpMethod = HTTPMethod.POST
            
            do {
                let encoder = JSONEncoder()
                let requestBody = try encoder.encode(wakeUpDetailData)
                request.httpBody = requestBody
            } catch {
                observer(.error(error))
            }
            
            APIClient.request(with: request, success: { data in
                do {
                    let decoder = JSONDecoder()
                    let wakeUpResult = try decoder.decode(WakeUpResult.self, from: data)
                    observer(.success(wakeUpResult))
                } catch {
                    observer(.error(error))
                }
            }, failed: { statusCode, error in
                observer(.error(error))
            })
            return Disposables.create()
        })
    }
}
