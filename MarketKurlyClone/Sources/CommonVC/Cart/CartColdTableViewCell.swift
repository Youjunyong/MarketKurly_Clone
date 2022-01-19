//
//  CartColdTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/27.
//

import UIKit

class CartColdTableViewCell: UITableViewCell {
    var delegate: CartViewController?
    var productId: Int? = nil

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var sectionHeader: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var xButton: UIButton!
    
    @IBAction func xButtonClicked(_ sender: UIButton) {
        if self.productId != nil {
            delegate?.deleteCartList(productId: self.productId!)
            
        }
    }
    
    @IBAction func checkClicked(_ sender: Any) {
        
        if checkImage.image == UIImage(named: "TosCheckBoxFalse") {
            checkImage.image = UIImage(named: "TosCheckBoxTrue")
        }else{
            checkImage.image = UIImage(named: "TosCheckBoxFalse")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        xButton.setTitle("", for: .normal)
        checkButton.setTitle("", for: .normal)
        productImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
