//
//  ThirdProductTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import UIKit

class ThirdProductTableViewCell: UITableViewCell {
    var start1 = true
    var start2 = true

    @IBOutlet weak var hLabel2: UILabel!
    @IBOutlet weak var hLabel1: UILabel!
    @IBOutlet weak var headerLabelView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var breakLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var prePriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func counting(_ number: Int){

        if self.start1, number == 2{
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                    
                    let time = CountDown.shared.count()
                    let h = time[0]
                    let m = time[1]
                    var s = "\(60 - Int(time[2])!)"
                    if s.count == 1{
                        s = "0" + s
                    }
                        self.countLabel.text = "\(h):\(m):\(s)"
                }
            self.start1 = false
            }
        if self.start2, number == 3{
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                    
                    let time = CountDown.shared.count()
                    let h = "\(Int(time[0])! - 2)"
                    let m = "\(Int(time[0])! - 4)"
                    var s = "\(60 - Int(time[2])!)"
                    if s.count == 1{
                        s = "0" + s
                    }
                        self.countLabel.text = "\(h):\(m):\(s)"
                }
            self.start2 = false
            }
    }
    
    private func setUI(){
        headerLabelView.backgroundColor = .kurlyPurple
        headerLabelView.alpha = 0.7
        countView.backgroundColor = .kurlyPurple
        countView.alpha = 0.7
        breakLabel.attributedText = "4,200원".strikeThrough()
    }
    
}
