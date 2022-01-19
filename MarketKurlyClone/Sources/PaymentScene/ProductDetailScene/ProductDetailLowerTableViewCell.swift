//
//  ProductDetailLowerTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import UIKit

class ProductDetailLowerTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUI(){
        productImageView.image = UIImage(named: "detailScroll")
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100)
        ])
    }
}
