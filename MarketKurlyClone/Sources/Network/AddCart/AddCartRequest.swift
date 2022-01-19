//
//  AddCartRequest.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import Foundation

struct AddCartRequest: Encodable {
    var productId: Int
    var count: Int
}
