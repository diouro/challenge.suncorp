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
struct TransactionsModel: Mappable {
    
    let id: Int
    let description: String
    let amount: Double
    let effectiveDate: String
    
    init(map: Mapper) throws {
        try id = map.from("id")
        try description = map.from("description")
        try amount = map.from("amount")
        try effectiveDate = map.from("effectiveDate")
    }
    
}
