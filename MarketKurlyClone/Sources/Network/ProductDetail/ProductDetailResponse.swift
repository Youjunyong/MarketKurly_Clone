//
//  ProductDetailResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import Foundation


struct ProductDetailResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ProductDetail
    
}

struct ProductDetail: Decodable{
    var product: Product
    var img: String
}

struct Product: Decodable{
    var name: String
    var summary: String
    var path: String
    var points: Int
    var unit: String?
    var weight: String?
    var origin: String?
    var allergy: String?
    var expirationDate: String?
    var info: String?
    var delivery: String
    var packType: String
    var price: String
    var disPrice: String?
    var discount: String?
               
}

//{
//    "isSuccess": true,
//    "code": 1000,
//    "message": "성공",
//    "result": {
//        "product": {
//            "name": "흰새우살 180g",
//            "summary": "깔끔하게 손질한 탱글 새우살",
//            "path": "https://img-cf.kurly.com/shop/data/goodsview/20210830/gv00000220616_1.jpg",
//            "points": 320,
//            "unit": "1팩",
//            "weight": "180g",
//            "origin": "베트남산",
//            "allergy": "이 제품은 새우,오징어,꽃게,조개류를 사용한 제품과 같은 제조시설에서 제조",
//            "expirationDate": "수령후 가급적 빠른 섭취 부탁드립니다",
//            "info": null,
//            "delivery": "샛별/택배",
//            "packType": "냉장",
//            "price": "6,500",
//            "disPrice": "5,850",
//            "discount": "10%"
//        },
//        "img": "https://cdn.pixabay.com/photo/2016/03/05/22/33/cooked-1239316_1280.jpg"
//    }
//}
