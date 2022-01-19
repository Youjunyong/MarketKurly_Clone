//
//  MyKurlyResponse.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import Foundation


struct ProductResponse: Decodable {

    var isSuccess: Bool
    var code: Int
    var message: String
    var result: ProductSets?
}

struct ProductSets: Decodable {

    var ProductSet1: [ProductContent1?]
    var ProductSet2: [ProductContent2?]
    var ProductSet3: [ProductContent1?]
    var ProductSet4: [ProductContent1?]
}

struct ProductContent1: Decodable {
    var productId: Int
    var name: String
    var path: String
    var price: String
    var disPrice: String?
    var discount: String?
}

struct ProductContent2: Decodable {
    var productId: Int
    var name: String
    var path: String
    var price: String
    var disPrice: String?
    var discount: String?
    var Remaintime: String?
    var time: String?
}

//{
//    "isSuccess": true,
//    "code": 1000,
//    "message": "성공",
//    "result": {
//        "ProductSet1": [
//            {
//                "productId": 10,
//                "name": "그린빈스(줄기콩)",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20201019/gv00000125492_1.jpg",
//                "price": "3,990",
//                "disPrice": null,
//                "discount": null
//            },
//            {
//                "productId": 6,
//                "name": "돌나물 150g",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20210121/gv40000153359_1.jpg",
//                "price": "1,590",
//                "disPrice": null,
//                "discount": null
//            },
//            {
//                "productId": 9,
//                "name": "국내산 할라피뇨 고추",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20180601/gv00000024620_1.jpg",
//                "price": "3,790",
//                "disPrice": null,
//                "discount": null
//            },
//            {
//                "productId": 5,
//                "name": "흰새우살 180g",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20210830/gv00000220616_1.jpg",
//                "price": "6,500",
//                "disPrice": "5,850",
//                "discount": "10%"
//            },
//            {
//                "productId": 7,
//                "name": "유기농 다진 적양배추",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20180312/gv30000019427_1.jpg",
//                "price": "3,500",
//                "disPrice": null,
//                "discount": null
//            },
//            {
//                "productId": 12,
//                "name": "유기농 스위트 코코넛칩",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20190722/gv40000056467_1.jpg",
//                "price": "9,900",
//                "disPrice": null,
//                "discount": null
//            },
//            {
//                "productId": 13,
//                "name": "피치애플 4-6입",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20211015/gv20000234545_1.jpg",
//                "price": "12,900",
//                "disPrice": "12,555",
//                "discount": "5%"
//            },
//            {
//                "productId": 4,
//                "name": "GAP 황금사과 2입",
//                "path": "https://img-cf.kurly.com/shop/data/goods/160092810490l0.jpg",
//                "price": "9,900",
//                "disPrice": "9,405",
//                "discount": "5%"
//            },
//            {
//                "productId": 8,
//                "name": "영주 햇생강 1박스",
//                "path": "https://img-cf.kurly.com/shop/data/goods/1603341511420l0.jpg",
//                "price": "11,900",
//                "disPrice": "10,948",
//                "discount": "8%"
//            },
//            {
//                "productId": 15,
//                "name": "냉동 허니듀 멜론",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20210330/gv30000168521_1.jpg",
//                "price": "9,950",
//                "disPrice": null,
//                "discount": null
//            }
//        ],
//        "ProductSet2": [
//            {
//                "productId": 1,
//                "name": "아몬드브리즈 2종",
//                "path": "https://img-cf.kurly.com/shop/data/goods/1585196075113l0.jpg",
//                "price": "16,500",
//                "disPrice": "14,380",
//                "discount": "12%",
//                "Remaintime": "18:13:21",
//                "time": "2021-10-26T14:47:47.000Z"
//            },
//            {
//                "productId": 3,
//                "name": "유기농 정안밤 800g",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20201007/gv30000125887_1.jpg",
//                "price": "12,500",
//                "disPrice": "11,250",
//                "discount": "10%",
//                "Remaintime": "42:15:36",
//                "time": "2021-10-27T14:50:02.000Z"
//            }
//        ],
//        "ProductSet3": [
//            {
//                "productId": 5,
//                "name": "흰새우살 180g",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20210830/gv00000220616_1.jpg",
//                "price": "6,500",
//                "disPrice": "5,850",
//                "discount": "10%"
//            },
//            {
//                "productId": 7,
//                "name": "유기농 다진 적양배추",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20180312/gv30000019427_1.jpg",
//                "price": "3,500",
//                "disPrice": null,
//                "discount": null
//            },
//            {
//                "productId": 4,
//                "name": "GAP 황금사과 2입",
//                "path": "https://img-cf.kurly.com/shop/data/goods/160092810490l0.jpg",
//                "price": "9,900",
//                "disPrice": "9,405",
//                "discount": "5%"
//            },
//            {
//                "productId": 8,
//                "name": "영주 햇생강 1박스",
//                "path": "https://img-cf.kurly.com/shop/data/goods/1603341511420l0.jpg",
//                "price": "11,900",
//                "disPrice": "10,948",
//                "discount": "8%"
//            }
//        ],
//        "ProductSet4": [
//            {
//                "productId": 5,
//                "name": "흰새우살 180g",
//                "path": "https://img-cf.kurly.com/shop/data/goodsview/20210830/gv00000220616_1.jpg",
//                "price": "6,500",
//                "disPrice": "5,850",
//                "discount": "10%"
//            },
//            {
//                "productId": 8,
//                "name": "영주 햇생강 1박스",
//                "path": "https://img-cf.kurly.com/shop/data/goods/1603341511420l0.jpg",
//                "price": "11,900",
//                "disPrice": "10,948",
//                "discount": "8%"
//            }
//        ]
//    }
//}
