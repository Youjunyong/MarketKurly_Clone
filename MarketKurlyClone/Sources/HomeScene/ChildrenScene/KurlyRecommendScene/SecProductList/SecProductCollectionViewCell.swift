//
//  SecProductCollectionViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/23.
//

import UIKit

class SecProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    
    
    let newImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var payButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(newImageView)
        contentView.addSubview(payButton)

        NSLayoutConstraint.activate([
            newImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            newImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            newImageView.heightAnchor.constraint(equalToConstant: 200),
            newImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            productNameLabel.leadingAnchor.constraint(equalTo: newImageView.leadingAnchor),
            productNameLabel.rightAnchor.constraint(equalTo: newImageView.rightAnchor),
            productNameLabel.topAnchor.constraint(equalTo: newImageView.bottomAnchor, constant: 9),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            payButton.leadingAnchor.constraint(equalTo: newImageView.leadingAnchor),
            payButton.topAnchor.constraint(equalTo: newImageView.topAnchor),
            payButton.bottomAnchor.constraint(equalTo: newImageView.bottomAnchor),
            payButton.trailingAnchor.constraint(equalTo: newImageView.trailingAnchor)
        ])
    }


}
