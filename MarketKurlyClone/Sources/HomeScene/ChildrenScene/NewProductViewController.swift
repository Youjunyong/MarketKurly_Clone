//
//  NewProductViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/21.
//

import Foundation

import XLPagerTabStrip

class NewProductViewController: UIViewController, IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "신상품")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
    }
}
