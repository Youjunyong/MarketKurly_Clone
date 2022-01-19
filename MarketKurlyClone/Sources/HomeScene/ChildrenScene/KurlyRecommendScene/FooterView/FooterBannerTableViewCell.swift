//
//  FooterBannerTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import UIKit

class FooterBannerTableViewCell: UITableViewCell{
    
    let identifier = "FooterBannerTableViewCell"
    
    let bannerView: UIImageView = {
        let bannerView = UIImageView()
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.backgroundColor = .red
        bannerView.image = UIImage(named: "footerBanner")
        return bannerView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "FooterBannerTableViewCell")
        setUI()
    }

    private func setUI(){
        contentView.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
        

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
}
