//
//  ToSTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//

import UIKit

class ToSTableViewCell: UITableViewCell {
    var delegate: RegisterViewController? = nil
    var entireCheck = false
    let checkTrue =  #imageLiteral(resourceName: "TosCheckBoxTrue")
    let checkFalse = #imageLiteral(resourceName: "TosCheckBoxFalse")
    @IBOutlet weak var entireAgreeView: UIImageView!
    
    @IBOutlet weak var emailView: UIImageView!
    @IBOutlet weak var smsView: UIImageView!
    @IBOutlet weak var tos5View: UIImageView!
    @IBOutlet weak var tos4View: UIImageView!
    @IBOutlet weak var tos3View: UIImageView!
    @IBOutlet weak var tos2View: UIImageView!
    @IBOutlet weak var tos1View: UIImageView!
    
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        delegate?.registerSubmit()
    }
    @IBAction func entireAgreeBtnClicked(_ sender: Any) {
        print(#function)
        if entireCheck == false {
            setupButtonView(selected: [0,1,2,3,4,5,6,7], img: checkTrue )
            entireCheck = true
        }else{
            setupButtonView(selected: [0,1,2,3,4,5,6,7], img: checkFalse)
            entireCheck = false
        }
    }
    @IBAction func tos1BtnClicked(_ sender: Any) {
        if tos1View.image == checkFalse {
            tos1View.image = checkTrue
        } else{
            tos1View.image = checkFalse
        }
    }
    @IBAction func tos2BtnClicked(_ sender: Any) {
        if tos2View.image == checkFalse {
            tos2View.image = checkTrue
        } else{
            tos2View.image = checkFalse
        }
    }
    @IBAction func tos3BtnClicked(_ sender: Any) {
        if tos3View.image == checkFalse {
            tos3View.image = checkTrue
        } else{
            tos3View.image = checkFalse
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        submitButton.setTitle("", for: .normal)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    private func setupButtonView(selected: [Int], img : UIImage){
        let buttonImageViews = [tos1View, tos2View, tos3View, tos4View, tos5View, smsView, emailView, entireAgreeView]
        for select in selected {
            buttonImageViews[select]?.image = img
        }
    }
    
    
    
}
