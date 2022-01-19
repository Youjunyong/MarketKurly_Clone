//
//  CartHeaderTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/27.
//

import UIKit

class CartHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var entireCheckButton: UIButton!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBAction func addressButtonClicked(_ sender: Any) {
    }
    
    @IBAction func entireCheckCliked(_ sender: Any) {
        
        if headerView.image == UIImage(named: "cartHeaderViewTrue"){
            headerView.image = UIImage(named: "cartHeaderViewFalse")
        }else{
            headerView.image = UIImage(named: "cartHeaderViewTrue")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let count = "\(CartData.shared.cart1Cnt + CartData.shared.cart2Cnt + CartData.shared.cart3Cnt)"
        headerView.image = UIImage(named: "cartHeaderViewFalse")
        entireCheckButton.setTitle("", for: .normal)
        
        itemCountLabel.text = "(\(count)/\(count))"

        addressLabel.text = CartData.shared.road
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
