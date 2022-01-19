//
//  RegisterTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//

import UIKit

class RegisterTableViewCell: UITableViewCell {
    
    var registerInfo = [String:Bool]()
    var recommendOrEvent = [String:Bool]()
    var delegate: RegisterViewController? = nil
    
    @IBOutlet weak var idCheckButtonView: UIView!
    @IBOutlet weak var idCheckButton: UIButton!
    @IBOutlet weak var getKeyButtonView: UIView!
    @IBOutlet weak var getKeyButton: UIButton!
    
    @IBOutlet weak var notCheckImage: UIImageView!
    @IBOutlet weak var womanCheckImage: UIImageView!
    @IBOutlet weak var manCheckImage: UIImageView!
    @IBOutlet weak var recommendCheckImage: UIImageView!
    @IBOutlet weak var eventCheckImage: UIImageView!
    
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var rePwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    @IBOutlet weak var recommendOrEventTextField: UITextField!
    
    
    @IBAction func postCodeBtnClicked(_ sender: Any) {
        let postCodeVC = KakaoPostCodeVC()
        postCodeVC.modalPresentationStyle = .formSheet
        delegate?.present(postCodeVC, animated: true, completion: nil)
    }

    
    
    @IBAction func eventChecked(_ sender: Any) {
        self.recommendOrEvent = ["recommend":false, "event":false]
        self.recommendOrEvent["event"] = true
        setRecommendOrEventImage()
        
    }
    @IBAction func recommendChecked(_ sender: Any) {
        self.recommendOrEvent = ["recommend":false, "event":false]
        self.recommendOrEvent["recommend"] = true
        setRecommendOrEventImage()
        
    }
    @IBAction func manChecked(_ sender: Any) {
        self.registerInfo = ["man":false, "woman":false, "not":false]
        self.registerInfo["man"]! = true
        setSexCheckImage()
        
    }
    @IBAction func womanChecked(_ sender: Any) {
        self.registerInfo = ["man":false, "woman":false, "not":false]
        self.registerInfo["woman"]! = true
        setSexCheckImage()
        

    }
    @IBAction func notChecked(_ sender: Any) {
        self.registerInfo = ["man":false, "woman":false, "not":false]
        self.registerInfo["not"]! = true
        setSexCheckImage()
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        recommendOrEventTextField.isHidden = true
        idCheckButtonView.layer.borderWidth = 1
        idCheckButtonView.layer.borderColor = UIColor.mainPurple.cgColor
        getKeyButtonView.layer.borderWidth = 1
        getKeyButtonView.layer.borderColor = UIColor.mainPurple.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    private func setRecommendOrEventImage(){
        for (k,v) in recommendOrEvent{
            if v == true{
                if k == "recommned"{
                    self.recommendCheckImage.image = #imageLiteral(resourceName: "checkedCircle")
                    self.eventCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                    }else{
                        self.eventCheckImage.image = #imageLiteral(resourceName: "checkedCircle")
                        self.recommendCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                    }
                            
                }
            }
        }
    
    private func setSexCheckImage(){
        for (k,v) in registerInfo{
            if v == true{
                if k == "man"{
                    self.notCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                    self.manCheckImage.image = #imageLiteral(resourceName: "checkedCircle")
                    self.womanCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                }else if k == "woman"{
                    self.womanCheckImage.image = #imageLiteral(resourceName: "checkedCircle")
                    self.manCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                    self.notCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                }else{
                    self.notCheckImage.image = #imageLiteral(resourceName: "checkedCircle")
                    self.womanCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                    self.manCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
                }
            }
        }
    }
    
    
}
