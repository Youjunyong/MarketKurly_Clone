//
//  CartListRequest.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/27.
//

import Foundation

struct CartListRequest: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: CartListSet
    
}

struct CartListSet: Decodable{
    var cart1: [CartList1]?
    var cart2: [CartList2]?
    var cart3: [CartList2]?
}
struct CartList1: Decodable{
    var cartId: Int
    var productId: Int
    var count: Int
    var path: String
    var name: String
    var price: String
    var disPrice: String?
    var road: String
    var detail: String
    var points: Int
}
struct CartList2: Decodable{
    var cartId: Int
    var productId: Int
    var count: Int
    var path: String
    var name: String
    var price: String
    var disPrice: String?
    var points: Int
}

//{
//    "isSuccess": true,
//    "code": 1000,
//    "message": "성공",
//    "result": {
//        "cart1": [
//            {
//                "cartId": 17,
//                "productId": 6,
//                "count": 5,
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20210121/gv40000153359_1.jpg",
//                "name": "돌나물 150g",
//                "price": "1,590",
//                "disPrice": null,
//                "road": "광주 남구 판촌길 23-5",
//                "detail": "없음",
//                "points": 80
//            },
//            {
//                "cartId": 21,
//                "productId": 8,
//                "count": 15,
//                "path": "https://img-cf.kurly.com/shop/data/goods/1603341511420l0.jpg",
//                "name": "영주 햇생강 1박스",
//                "price": "11,900",
//                "disPrice": "10,948",
//                "road": "광주 남구 판촌길 23-5",
//                "detail": "없음",
//                "points": 595
//            },
//            {
//                "cartId": 18,
//                "productId": 10,
//                "count": 5,
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20201019/gv00000125492_1.jpg",
//                "name": "그린빈스(줄기콩)",
//                "price": "3,990",
//                "disPrice": null,
//                "road": "광주 남구 판촌길 23-5",
//                "detail": "없음",
//                "points": 200
//            },
//            {
//                "cartId": 8,
//                "productId": 13,
//                "count": 1,
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20211015/gv20000234545_1.jpg",
//                "name": "피치애플 4-6입",
//                "price": "12,900",
//                "disPrice": "12,555",
//                "road": "광주 남구 판촌길 23-5",
//                "detail": "없음",
//                "points": 613
//            },
//            {
//                "cartId": 20,
//                "productId": 14,
//                "count": 6,
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20191204/gv10000071177_1.jpg",
//                "name": "친환경 제주레몬 ",
//                "price": "35,000",
//                "disPrice": null,
//                "road": "광주 남구 판촌길 23-5",
//                "detail": "없음",
//                "points": 1750
//            }
//        ],
//        "cart2": [
//            {
//                "cartId": 9,
//                "productId": 15,
//                "count": 1,
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20210330/gv30000168521_1.jpg",
//                "name": "냉동 허니듀 멜론",
//                "price": "9,950",
//                "disPrice": null,
//                "points": 498
//            }
//        ],
//        "cart3": [
//            {
//                "cartId": 2,
//                "productId": 11,
//                "count": 1,
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20200107/gv10000076984_1.jpg",
//                "name": "친환경 영지버섯",
//                "price": "6,990",
//                "disPrice": null,
//                "points": 350
//            },
//            {
//                "cartId": 7,
//                "productId": 12,
//                "count": 1,
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20190722/gv40000056467_1.jpg",
//                "name": "유기농 스위트 코코넛칩",
//                "price": "9,900",
//                "disPrice": null,
//                "points": 495
//            }
//        ]
//    }
//}
