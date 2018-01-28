//
//  Apiary.swift
//  Suncorp
//
//  Created by iMac on 28/1/18.
//  Copyright © 2018 Paulo Goncalves. All rights reserved.
//

import Foundation
import Moya

enum ApiServer {
    case transactions
    case transactionAdd
}

extension ApiServer: TargetType {

    var baseURL: URL { return URL(string: "https://private-ddc1b2-transactions14.apiary-mock.com/")! }
    
    var path: String {
        switch self {
        case .transactions:
            return "/transactions"
        case .transactionAdd:
            return "/transaction/add"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .transactions:
            return .get
        case .transactionAdd:
            return .post
        }
    }
    
    // In case if we need to save anything
    var parameters: [String: Any]? {
        switch self {
//        case .transactionAdd(let amount, let description):
//            var parameters = [String: Any]()
//            parameters["amount"] = email
//            parameters["description"] = password
//            return parameters
        default:
            return nil
        }
    }
    
    var headers: [String : String]? {
        return ["application":"json"]
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
}
