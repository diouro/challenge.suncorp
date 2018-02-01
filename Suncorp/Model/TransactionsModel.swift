    //
//  TransactionsModel.swift
//  Suncorp
//
//  Created by iMac on 28/1/18.
//  Copyright © 2018 Paulo Goncalves. All rights reserved.
//

import Foundation
import Mapper

/* Data Structure
     {
     "id": 1,
     "description": "Opal recharge",
     "amount": -65.8,
     "effectiveDate": "2017-12-21T08:40:51.620Z"
     }
*/
struct TransactionsModel: Decodable {
    
    let id: Int?
    let description: String?
    let amount: Double?
    let effectiveDate: String?
    
    init?(json: [String: Any]) throws {
        id = (json["id"] as? Int)!
        description = (json["description"] as? String)!
        amount = (json["amount"] as? Double)!
        effectiveDate = (json["effectiveDate"] as? String)!
    }
    
    
    static func getBalance(transactions: [TransactionsModel]) -> Double {
        
        var amount: Double = 0
        
        for transaction in transactions {
            if transaction.amount! > 0.0 {
                amount += transaction.amount!
            }else{
                amount -= transaction.amount!
            }
        }
        
        return amount;
    }

}
