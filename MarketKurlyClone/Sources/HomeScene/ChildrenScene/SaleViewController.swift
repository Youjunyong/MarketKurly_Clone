//
//  SaleViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/23.
//

import UIKit
import XLPagerTabStrip

class SaleViewController: UIViewController, IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "특가/혜택")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
