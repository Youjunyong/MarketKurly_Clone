//
//  MyKurlyResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/23.
//

import Foundation


struct MyKurlyResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [MyKurlyResult?]
}

struct MyKurlyResult: Decodable {
    
    var name: String
    var level: String
    var coupon: Int?
    var point: Int?
    var bookmark: Int?
    
}

// MARK: - API 응답 form
//    "{
//        ""isSuccess"": true,
//        ""code"": 1000,
//        ""message"": ""성공"",
//        ""result"": [
//            {
//                ""name"": ""김철수"",
//                ""level"": ""웰컴"",
//                ""coupon"": 0,
//                ""point"": 0,
//                ""bookmark"": 1
//            }
//        ]
//    }"
            
            
            
            
            
            
            
            
            
            
