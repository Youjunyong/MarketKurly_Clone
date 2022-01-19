//
//  RegisterViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//


import UIKit

class RegisterViewController: UIViewController {
    
    lazy var dataManager = RegisterDataManager()
    var topperCell: UITableViewCell? = nil
    @IBOutlet weak var tableVeiw: UITableView!
    
    @IBAction func topBackClicked(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVeiw.delegate = self
        tableVeiw.dataSource = self
        let nib = UINib(nibName: "RegisterTableViewCell", bundle: nil)
        tableVeiw.register(nib, forCellReuseIdentifier: "cell")
        let nib2 = UINib(nibName: "ToSTableViewCell", bundle: nil)
        tableVeiw.register(nib2, forCellReuseIdentifier: "cell2")
        
    }
    func getAddress(){
        guard let addressTextField = self.tableVeiw.viewWithTag(107) as? UITextField else{return}
        let address = UserDataManager.shared.registerInfo["address"]!
        addressTextField.text = address
    }
    
    func registerSubmit(){
        var info = UserDataManager.shared.registerInfo
        guard let idTextField = self.tableVeiw.viewWithTag(101) as? UITextField else{return}
        let id = idTextField.text!
        info["id"] = id
        guard let pwTextField = self.tableVeiw.viewWithTag(102) as? UITextField else{return}
        guard let rePwTextField = self.tableVeiw.viewWithTag(103) as? UITextField else{return}
        if pwTextField.text != rePwTextField.text{
            presentAlert(title: "동일한 비밀번호를 입력해주세요.")
        }
        let pw = pwTextField.text!
        info["pw"] = pw
        
        guard let nameTextField = self.tableVeiw.viewWithTag(104) as? UITextField else{return}
        
        let name = nameTextField.text!
        info["name"] = name
        guard let emailTextField = self.tableVeiw.viewWithTag(105) as? UITextField else{return}
        let email = emailTextField.text!
        info["email"] = email
        
        guard let phoneTextField = self.tableVeiw.viewWithTag(106) as? UITextField else{return}
        let phone = phoneTextField.text!
        info["phone"] = phone
        let postcode = info["postcode"]
        let address = info["address"]
        
        let parameters = RegisterRequest(id: id, pw: pw, name: name, email: email, phone: phone, gender: nil, birthday: nil, code: postcode!, road: address! , detail: "없음")
  
        dataManager.postRegister(parameters, delegate: self)
    }
    
    
}
extension RegisterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RegisterTableViewCell else{return UITableViewCell()}
            cell.delegate = self
            cell.selectionStyle = .none
            cell.idCheckButton.setTitle("중복확인", for: .normal)
            cell.idCheckButton.setTitleColor(.mainPurple, for: .normal)
            cell.getKeyButton.setTitle("인증번호 받기", for: .normal)
            cell.getKeyButton.setTitleColor(.mainPurple, for: .normal)
            cell.manCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
            cell.notCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
            cell.womanCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
            cell.recommendCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
            cell.eventCheckImage.image = #imageLiteral(resourceName: "defaultCircle")
            
                return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? ToSTableViewCell else{return UITableViewCell()}
            cell.delegate = self
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            return 1100.0
        }else{
            return 590.0
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
}

extension RegisterViewController {
    func didSuccessRegister() {
        self.presentAlert(title: "회원가입 성공!!")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
}
