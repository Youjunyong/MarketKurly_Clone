//
//  RegisterRequest.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/20.
//

import Foundation

struct RegisterRequest: Encodable {
    var id: String
    var pw: String
    var name: String
    var email: String
    var phone: String
    var gender: Int?
    var birthday: Date?
    var code: String //PostCode
    var road: String //Address
    var detail: String //detail address
    
}
// MARK: - API 응답 form
//"{
//    ""isSuccess"": false,
//    ""code"": 2005,
//    ""message"": ""비밀번호는 10자리 이상, 영문/숫자/특수문자 2개이상 조합해주세요.""
//}"
