//
//  DetailViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import UIKit
import XLPagerTabStrip

class DetailViewController: UIViewController ,IndicatorInfoProvider{
    

    @IBOutlet weak var tableView: UITableView!
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "상품설명")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib1 = UINib(nibName: "ProductDetailUpperTableViewCell", bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: "upperCell")
        let nib2 = UINib(nibName: "ProductDetailLowerTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "lowerCell")
    }
    
}

extension DetailViewController: UITableViewDelegate{
    
}
extension DetailViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 1300
        case 1:
            return 2500
        default:
            return 20
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "upperCell") as? ProductDetailUpperTableViewCell else{return UITableViewCell()}
            guard let idx = ProductData.shared.detailIdx else{return UITableViewCell()}
            let url = URL(string: ProductData.shared.productContent1["path\(idx)"]!)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                

                DispatchQueue.main.async {
                    let url2 = URL(string: ProductData.shared.detailContent["img"]!)
                    let data2 = try? Data(contentsOf: url2!)
                    let image = UIImage(data: data!)
                    let image2 = UIImage(data: data2!)
                    cell.productImage.image = image
                    cell.productImage2.image = image2
                    cell.productName.text = ProductData.shared.detailContent["name"]
                    cell.summaryLabel.text = ProductData.shared.detailContent["summary"]
                    cell.priceLabel.text = ProductData.shared.detailContent["price"]
                    cell.pointLabel.text =  "개당 \(ProductData.shared.detailContent["points"] ?? "340")원 적립"
                    cell.weightLabel.text = ProductData.shared.detailContent["weight"] ?? "1kg"
                    cell.unitLabel.text = ProductData.shared.detailContent["unit"] ?? "1박스"
                    cell.discountLabel.text = ProductData.shared.detailContent["discount"] ?? "11%"
                    cell.disPriceLabel.attributedText = ProductData.shared.detailContent["disPrice"]?.strikeThrough() ?? "17,600".strikeThrough()
                    
                }
            }
            cell.selectionStyle = .none
                return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "lowerCell") as? ProductDetailLowerTableViewCell else{return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
        default:
                return UITableViewCell()
        }
    }
    
    
}
