//
//  BestViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/23.
//

import UIKit
import XLPagerTabStrip

class BestViewController: UIViewController, IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "베스트")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
