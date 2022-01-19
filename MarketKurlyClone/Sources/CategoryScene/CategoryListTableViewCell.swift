//
//  CategoryTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/20.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell {
    
    static let identifier = "categoryListCell"


    let bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .kurlyLightGray
        bgView.translatesAutoresizingMaskIntoConstraints = false
        return bgView
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
        
        contentView.addSubview(itemLabel)
        
        
        NSLayoutConstraint.activate([
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgView.topAnchor.constraint(equalTo: self.topAnchor),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            
            itemLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 60)
        ])
    }
}
