//
//  LoginOrRegister.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//


import UIKit

class LoginOrRegisterViewController: UIViewController {
        
    lazy var dataManager: SignInDataManager = SignInDataManager()
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var registerButtonView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var xButton: UIButton!
    
    @IBOutlet weak var alertView: UIImageView!
    @IBOutlet weak var alertViewConstraint: NSLayoutConstraint!
    @IBAction func dismissClicked(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonView: UIView!
    @IBAction func loginButtonClicked(_ sender: Any) {
        let id = idTextField.text
        
        let pw = passwordTextField.text
        let input = SignInRequest(id: id!, pw: pw!)
        
        dataManager.postSignIn(input, delegate: self)
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegisterScene", bundle: nil)
        
        guard let RegisterVC = storyboard.instantiateViewController(withIdentifier:"RegisterVC") as? RegisterViewController else{return}
        RegisterVC.modalPresentationStyle = .fullScreen
        present(RegisterVC, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.isHidden = true

        loginButtonView.backgroundColor = .mainPurple
        loginButtonView.clipsToBounds = true
        loginButtonView.layer.cornerRadius = 5
        
        registerButtonView.clipsToBounds = true

        registerButtonView.layer.borderWidth = 1.0
        registerButtonView.layer.borderColor = UIColor.mainPurple.cgColor
        registerButtonView.layer.cornerRadius = 5
        registerButton.setTitleColor(.mainPurple, for: .normal)
        registerButton.setTitle("회원가입", for: .normal)
        xButton.setTitle("", for: .normal)
        }
}
extension LoginOrRegisterViewController {
    func didSuccessSignIn(_ result: SignInResult) {
        UserDataManager.shared.userName = result.name
        UserDataManager.shared.token = result.jwt
        let storyboard = UIStoryboard(name: "AfterSignInScene", bundle: nil)
        guard let AfterSignInVC = storyboard.instantiateViewController(withIdentifier: "AfterSignInVC") as? AfterSignInViewController else{return}
        guard let tabBarController = self.view.window?.rootViewController as? UITabBarController else{return}
        tabBarController.viewControllers?.removeLast()
        tabBarController.viewControllers?.append(AfterSignInVC)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    func failedToRequest(message: String) {
        alertView.isHidden = false
        self.alertViewConstraint.constant = 50
        UIView.animate(withDuration: 1.9) {
            self.view.layoutIfNeeded()
        } completion: { ani in
            UIView.animate(withDuration: 1.9, animations: {
                self.alertViewConstraint.constant = -80
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
}
