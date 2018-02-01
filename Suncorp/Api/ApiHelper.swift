//
//  ApiHelper.swift
//  Suncorp
//
//  Created by iMac on 28/1/18.
//  Copyright © 2018 Paulo Goncalves. All rights reserved.
//

import Moya
import Mapper

struct ApiHelper {
    
    static let provider = MoyaProvider<ApiServer>()
    
    static func request_parse(target: ApiServer, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (String) -> Void) {
        provider.rx.request(target).subscribe { event in
            switch event{
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    return successCallback(response)
                } else {
                    return errorCallback(response.debugDescription)
                }
            case .error(let error):
                return errorCallback(error.localizedDescription)
            }
        }
    }
    
    static func request(target: ApiServer, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (String) -> Void, failure failureCallback: @escaping (MoyaError) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let result):
                if result.statusCode >= 200 && result.statusCode <= 300 {
                    successCallback(result)
                } else {
                    errorCallback(result.debugDescription)
                }
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
}
