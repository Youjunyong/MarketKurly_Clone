//
//  OrderPostRequest.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/28.
//

import Foundation

struct OrderPostRequest: Encodable {

    var cartId: [Int]
    var name: String
    var phone:String
    var method: String
    
}
