//
//  customTopView.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import UIKit

class CustomTopView: UIView {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationButton: UIButton = {
        let button = UIButton()
        let image = #imageLiteral(resourceName: "locationPin50x50").withRenderingMode(.alwaysTemplate)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        
        button.tintColor = .white
        return button
    }()
    
    let cartButton: UIButton = {
        let button = UIButton()
        let image = #imageLiteral(resourceName: "cart50x50").withRenderingMode(.alwaysTemplate)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .white
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
        backgroundColor = .mainPurple
        imageView.image = #imageLiteral(resourceName: "marketKurlyLogo")
        addSubview(imageView)
        addSubview(locationButton)
        addSubview(cartButton)
        
        
        imageView.contentMode = .scaleAspectFit
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: centerXAnchor ),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
                imageView.widthAnchor.constraint(equalToConstant: 80.7),
                imageView.heightAnchor.constraint(equalToConstant: 50),
                
                locationButton.widthAnchor.constraint(equalToConstant: 25),
                locationButton.heightAnchor.constraint(equalToConstant: 25),
                locationButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
                locationButton.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor , constant: -10),
                
                cartButton.widthAnchor.constraint(equalToConstant: 25),
                cartButton.heightAnchor.constraint(equalToConstant: 25),
                cartButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
                cartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
            ])
        }
}
