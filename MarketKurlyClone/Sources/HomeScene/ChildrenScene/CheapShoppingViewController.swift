//
//  CheapShoppingViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/23.
//

import UIKit
import XLPagerTabStrip

class CheapShoppingViewController: UIViewController, IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "알뜰쇼핑")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
