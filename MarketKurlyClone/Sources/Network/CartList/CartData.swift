//
//  CartData.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/27.
//

import Foundation

class CartData {
    static let shared = CartData()
    var cart1 = [String:String]()
    var cart2 = [String:String]()
    var cart3 = [String:String]()
    var road: String = ""
    var cart1Cnt = 0
    var cart2Cnt = 0
    var cart3Cnt = 0

    var totalPrice = 0
    var totalPriceStr = ""
    var totalCount = 0
    var cartIds = [Int]()
    private init(){
    }
}
