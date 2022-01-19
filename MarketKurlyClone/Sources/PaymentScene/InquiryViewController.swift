//
//  InquiryViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import UIKit
import XLPagerTabStrip

class InquiryViewController: UIViewController ,IndicatorInfoProvider{
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "문의")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}
