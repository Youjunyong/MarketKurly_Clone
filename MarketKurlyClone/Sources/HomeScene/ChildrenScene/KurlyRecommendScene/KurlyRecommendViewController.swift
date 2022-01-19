//
//  KurlyRecommend.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/21.
//

import UIKit
import XLPagerTabStrip

class KurlyRecommendViewController: UIViewController, IndicatorInfoProvider{
    let dataManager = ProductDataManager()
    let detailDataManager = ProductDetailDataManager()

    var timer: Timer?
    var timerNum: Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "컬리추천")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .kurlyLightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        let nib1 = UINib(nibName: "TopBannerTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "TopBannerTableViewCell")
        
        let nib2 = UINib(nibName: "SecProductTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "SecProductTableViewCell")
        
        let nib3 = UINib(nibName: "ThirdProductTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "ThirdProductTableViewCell")
        tableView.register(FooterBannerTableViewCell.self, forCellReuseIdentifier: "FooterBannerTableViewCell")
        
        let footerNib = UINib(nibName: "FooterTableViewCell", bundle: nil)
        tableView.register(footerNib, forCellReuseIdentifier: "FooterTableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDataManager.shared.token != nil, UserDataManager.shared.didReload == false{
            dataManager.getProducts(delegate: self)
            
        }
    }
    
    func getProductDetail(productId: Int){
        detailDataManager.getProductDetail(delegate: self, productId: productId)
    }
    
}
extension KurlyRecommendViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopBannerTableViewCell") else{return UITableViewCell()}
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecProductTableViewCell") as? SecProductTableViewCell else{return UITableViewCell()}
            
            cell.delegate = self
            
            if UserDataManager.shared.didReload == false, UserDataManager.shared.token != nil{
                cell.collectionView.reloadData()
                UserDataManager.shared.didReload = true
            }
            
            
            return cell
        case 2, 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdProductTableViewCell") as? ThirdProductTableViewCell else{return UITableViewCell()}
            if indexPath.row == 2{
                cell.selectionStyle = .none
                cell.productImageView.image = UIImage(named: "thirdProduct1")
                cell.titleLabel.text = MyKurlyData.shared.ThirdProduct[0][0]
                cell.percentLabel.text = MyKurlyData.shared.ThirdProduct[0][1]
                cell.prePriceLabel.attributedText = MyKurlyData.shared.ThirdProduct[0][3].strikeThrough()
                cell.priceLabel.text = MyKurlyData.shared.ThirdProduct[0][2]
                cell.counting(indexPath.row)
                

            
            }else{
                if cell.hLabel1 != nil, cell.hLabel2 != nil {
                    cell.hLabel1.removeFromSuperview()
                    cell.hLabel2.removeFromSuperview()
                }
                cell.selectionStyle = .none
                cell.titleLabel.text = MyKurlyData.shared.ThirdProduct[1][0]
                cell.percentLabel.text = MyKurlyData.shared.ThirdProduct[1][1]
                cell.prePriceLabel.attributedText = MyKurlyData.shared.ThirdProduct[1][3].strikeThrough()
                cell.priceLabel.text = MyKurlyData.shared.ThirdProduct[1][2]
                cell.productImageView.image = UIImage(named: "thirdProduct2")
                cell.counting(indexPath.row)
                
            }
            return cell

        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FooterBannerTableViewCell") as? FooterBannerTableViewCell else {return UITableViewCell()}
            return cell
            
        case 9:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell")
                else{return UITableViewCell()}
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 0.0
        switch indexPath.row{
        case 0 :
            height = 340
        case 1 :
            height = 340
        case 2 :
            height = 370
        case 3 :
            height = 250
        case 8 :
            height = 80
        case 9 :
            height = 340
        default:
            height = 50
        }
        return height
    }
    

}
extension KurlyRecommendViewController {
    func didSuccessSignIn(_ result: ProductSets) {
        self.tableView.reloadData()
    }
    func didSucessGetDetail(){
        
    }
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}


