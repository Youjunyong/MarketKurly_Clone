//
//  OrderItemTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import UIKit

class OrderItemTableViewCell: UITableViewCell {

    var itemNum = 1
    var delegate: OrderViewController?
    
    @IBOutlet weak var mBtn: UIButton!
    @IBOutlet weak var pBtn: UIButton!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDisPriceLabel: UILabel!
    
    @IBOutlet weak var itemNumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        

        // Initialization code
    }
    func setUI(){
        mBtn.setTitle("", for: .normal)
        pBtn.setTitle("", for: .normal)
        productName.text = ProductData.shared.detailContent["name"]
        productPriceLabel.text = ProductData.shared.detailContent["price"]
         
        productDisPriceLabel.attributedText = ProductData.shared.detailContent["disPrice"]?.strikeThrough() ?? ProductData.shared.detailContent["price"]!.strikeThrough()
    }

    
    @IBAction func minusItem(_ sender: Any) {
        
        if self.itemNum > 1{
            self.itemNum -= 1
            itemNumLabel.text = "\(self.itemNum)"
            self.getPrice()
            
        }else{
            delegate?.presentAlert(title: "최소 구매 수량은 1개입니다")
        }
    }
    
    @IBAction func plusItem(_ sender: Any) {
        
        self.itemNum += 1
        itemNumLabel.text = "\(self.itemNum)"
        self.getPrice()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func getPrice(){
        self.delegate?.itemNum = self.itemNum
        var temp = ""
        let price = ProductData.shared.detailContent["price"]
        guard let splits = price?.components(separatedBy: ",") else{return}
        
        for split in splits{
            temp += split
        }
        var intPrice = Int(temp)!
        intPrice = intPrice * self.itemNum
        delegate?.setPrice(intPrice: intPrice )
    }
    
}
