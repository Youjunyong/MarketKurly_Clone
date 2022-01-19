//
//  MainCollectionCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/18.
//


import UIKit

class MainCollectionCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionCell"

//    var saleList : [Sale] = []
//    var saleDiscountList : [SpecialPrice] = []

    // MARK: - Property
    
    let mainTV = UITableView(frame: CGRect.zero, style: .grouped)
    
    
    // MARK: - UI
    
    func configureUI() {

        
        
        
//        mainTV.register(BannerTableCell.self, forCellReuseIdentifier: "BannerTableCell")
//        mainTV.register(ProductTableCell.self, forCellReuseIdentifier: "ProductTableCell")
//        mainTV.register(SaleTableCell.self, forCellReuseIdentifier: "SaleTableCell")
//        mainTV.register(SaleSubTableCell.self, forCellReuseIdentifier: "SaleSubTableCell")
//        mainTV.register(DailySubTableCell.self, forCellReuseIdentifier: "DailySubTableCell")
//        mainTV.register(DailySaleTableCell.self, forCellReuseIdentifier: "DailySaleTableCell")
//        mainTV.register(RegretPriceTableCell.self, forCellReuseIdentifier: "RegretPriceTableCell")
        

    }
    
    // MARK: - Function

    
    // 특가/혜택 부분

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

