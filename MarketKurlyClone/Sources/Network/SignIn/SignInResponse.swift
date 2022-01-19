//
//  SignInResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//


struct SignInResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SignInResult?
}

struct SignInResult: Decodable {
    var userId: Int
    var jwt: String
    var name: String
}

// MARK: - API 응답 form
//{
//    "isSuccess": true,
//    "code": 1000,
//    "message": "성공",
//    "result": {
//        "userId": 1,
//        "jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTYzNDQ2NDgzMSwiZXhwIjoxNjY2MDAwODMxLCJzdWIiOiJ1c2VySW5mbyJ9.Syiw52Utp9EeZKCSZoAT4jqskR6LoOFxVkz00Jdz0AU"
//    }
//}


