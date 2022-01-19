//
//  MileageTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/18.
//

import UIKit

class MileageTableViewCell: UITableViewCell {
    
    var mileageKey = ["적립금", "쿠폰", "친구초대"]
    var mileageValue = ["\(UserDataManager.shared.point)",
                        "\(UserDataManager.shared.coupon)",
                        "지금 5,000원 받기"]

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
