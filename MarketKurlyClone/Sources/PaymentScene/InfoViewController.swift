//
//  InfoViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import UIKit
import XLPagerTabStrip

class InfoViewController: UIViewController ,IndicatorInfoProvider{
    
    
    lazy var dataManager = DetailInfoDataManager()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "상세정보")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
        dataManager.DetailInfoDataManager(delegate: self, productId: Int(ProductData.shared.detailContent["productId"]!)!)
        
        
    }
}
extension InfoViewController{
    func didSuccessGetInfo(path: String){
        let url = URL(string: path)
        let data = try! Data(contentsOf: url!)
        imageView.image = UIImage(data: data)
    }
    func failedToRequest(message: String){
        self.presentAlert(title: message)
    }
}
