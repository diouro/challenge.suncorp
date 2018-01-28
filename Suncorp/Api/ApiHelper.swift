//
//  ApiHelper.swift
//  Suncorp
//
//  Created by iMac on 28/1/18.
//  Copyright © 2018 Paulo Goncalves. All rights reserved.
//

import Moya

struct ApiHelper {
    
    static let provider = MoyaProvider<ApiServer>()
    
    static func request(target: ApiServer, success successCallback: @escaping (result) -> Void, error errorCallback: @escaping (Swift.Error) -> Void, failure failureCallback: @escaping (MoyaError) -> Void) {
        
        provider.request(target) { (result) in
            switch result {
            case .success(let result):
                if result.statusCode >= 200 && result.statusCode <= 300 {
                    successCallback(result)
                } else {
                    errorCallback("Error parsing data")
                }
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
}
