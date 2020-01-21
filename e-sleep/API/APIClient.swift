//
//  BaseAPIClient.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/19.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import Foundation

final class APIClient {
    typealias Success = (Data) -> Void
    typealias Failed = (Int, Error) -> Void
    
    static func request(with request: URLRequest, success: @escaping Success, failed: @escaping Failed) {
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            if let error = error {
                if let response = response as? HTTPURLResponse {
                    failed(response.statusCode, error)
                }
            }
            
            if let data = data {
                success(data)
            }
        })
        
        task.resume()
    }
}
