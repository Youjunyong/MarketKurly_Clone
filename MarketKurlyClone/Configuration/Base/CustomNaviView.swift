//
//  CustomNaviView.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//


import UIKit

class CustomNaviView: UIView {
    
    

    var productTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = "[존쿡 델리미트] 이탈리아 생햄 코파"
        return label
    }()
    
    let backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "topBack-1"), for: .normal)
        
        return btn
        
    }()

    let cartButton: UIButton = {
        let button = UIButton()
        let image = #imageLiteral(resourceName: "cart50x50").withRenderingMode(.alwaysTemplate)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()


    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setupLayout() {
        
        
        
        
        addSubview(cartButton)
        addSubview(productTitleLabel)
        addSubview(backButton)
        self.backgroundColor = .white
        
            NSLayoutConstraint.activate([
                productTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                productTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
                
        
                cartButton.widthAnchor.constraint(equalToConstant: 25),
                cartButton.heightAnchor.constraint(equalToConstant: 25),
                cartButton.centerYAnchor.constraint(equalTo: productTitleLabel.centerYAnchor),
                cartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
                
                backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                backButton.centerYAnchor.constraint(equalTo: productTitleLabel.centerYAnchor),
                backButton.widthAnchor.constraint(equalToConstant: 18),
                backButton.heightAnchor.constraint(equalToConstant: 18)
            ])
        }
}
