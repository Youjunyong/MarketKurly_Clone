//
//  ProductDetailUpperTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import UIKit

class ProductDetailUpperTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productImage2: UIImageView!
    @IBOutlet weak var disPriceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var infoView: UIImageView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBAction func infoButtonClicked(_ sender: Any) {
        infoView.isHidden = !infoView.isHidden
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        infoButton.setTitle("", for: .normal)
        infoView.isHidden = true
    }
    
}
