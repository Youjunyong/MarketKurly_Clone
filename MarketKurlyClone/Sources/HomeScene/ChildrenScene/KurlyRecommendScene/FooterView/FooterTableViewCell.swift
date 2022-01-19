//
//  FooterTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import UIKit

class FooterTableViewCell: UITableViewCell {
    let footerView = HomeFooterView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setupUI(){
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = .kurlyBackgroundGray

        contentView.addSubview(footerView)
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
