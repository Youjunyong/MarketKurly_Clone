//
//  AddCartResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import Foundation

struct AddCartResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
