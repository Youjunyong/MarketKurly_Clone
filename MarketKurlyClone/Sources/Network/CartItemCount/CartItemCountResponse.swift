//
//  CartItemCountResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/28.
//

import Foundation

struct CartItemCountResponse: Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Counts]
}

struct Counts: Decodable{
    var counts: Int
}
