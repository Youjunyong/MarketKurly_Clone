//
//  ProductDatamanager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//


class ProductData{
    static let shared = ProductData()
    var productContent1 = [String:String]()
    var productContent2 = [String:String]()
    
    var detailIdx: Int? = nil
    var detailContent = [String:String]()
    private init(){
    }
}
