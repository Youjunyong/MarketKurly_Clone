//
//  RegisterResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/20.
//

import Foundation

struct RegisterResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
