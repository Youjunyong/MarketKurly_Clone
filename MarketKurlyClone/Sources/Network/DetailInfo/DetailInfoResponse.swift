//
//  DetailInfoResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/28.
//

import Foundation
struct DetailInfoResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Result]
}

struct Result: Decodable {
    var path: String
    var productId: Int
    
}
