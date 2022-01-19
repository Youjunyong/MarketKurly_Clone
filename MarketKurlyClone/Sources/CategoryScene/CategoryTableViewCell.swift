//
//  CategoryTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/20.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier = "categoryCell"

    let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    let bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.translatesAutoresizingMaskIntoConstraints = false
        return bgView
    }()
    
    let dropStatus: UIImageView = {
        let dropStatus = UIImageView()
        dropStatus.image = UIImage(named: "category_dropButton")
        dropStatus.translatesAutoresizingMaskIntoConstraints = false
        return dropStatus
    }()

    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        
        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI(){
        contentView.addSubview(bgView)
        contentView.addSubview(iconView)
        contentView.addSubview(dropStatus)
        contentView.addSubview(itemLabel)
        
        
        NSLayoutConstraint.activate([
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgView.topAnchor.constraint(equalTo: self.topAnchor),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor ,constant: 15),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 35) ,
            iconView.heightAnchor.constraint(equalToConstant: 35),
            
            dropStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            dropStatus.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dropStatus.widthAnchor.constraint(equalToConstant: 15),
            dropStatus.heightAnchor.constraint(equalToConstant: 15),
            
            itemLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 20)
        ])
    }
}
