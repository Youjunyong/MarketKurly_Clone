//
//  FooterView.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/25.
//

import UIKit

class FooterView: UIView{
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "PayFooterTabFalse")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heartBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    let orderBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setupLayout(){
        addSubview(imageView)
        addSubview(heartBtn)
        addSubview(orderBtn)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 55),
            
            heartBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            heartBtn.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            heartBtn.widthAnchor.constraint(equalToConstant: 50),
            heartBtn.heightAnchor.constraint(equalToConstant: 50),
            
            orderBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            orderBtn.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            orderBtn.leadingAnchor.constraint(equalTo: heartBtn.trailingAnchor, constant: 20),
            orderBtn.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
