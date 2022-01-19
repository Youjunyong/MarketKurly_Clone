//
//  MyKurlyViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import UIKit




class MyKurlyViewController: UIViewController {
    
    @IBOutlet weak var upperTableView: UITableView!
    
    let customTopView: CustomTopView = {
            let view = CustomTopView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    
    @IBAction func loginRegisterTouched(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "LoginOrRegisterScene", bundle: nil)
        guard let LoginOrRegisterVC = storyboard.instantiateViewController(withIdentifier: "LoginOrRegisterVC") as? LoginOrRegisterViewController else {return}
        LoginOrRegisterVC.modalPresentationStyle = .fullScreen
        present(LoginOrRegisterVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    private func setupTabBarItem(){
        self.tabBarController?.tabBar.tintColor = .mainPurple
        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "user24x24")
        self.tabBarItem.title = "마이컬리"
        self.tabBarItem.image = #imageLiteral(resourceName: "user24x24")
        self.tabBarController?.tabBar.unselectedItemTintColor = .black
    }
    private func setupLoginButton(){
        buttonView.backgroundColor = .mainPurple
        buttonView.clipsToBounds = true
        buttonView.layer.cornerRadius  = 5
        loginButton.setTitle("로그인/회원가입", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
    
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            upperTableView.delegate = self
            upperTableView.dataSource = self
            setupTabBarItem()
            setupLoginButton()
            setupView()
        }
 
    
    private func setupView() {
        view.addSubview(customTopView)
        
        NSLayoutConstraint.activate([
            customTopView.topAnchor.constraint(equalTo: view.topAnchor , constant: 0),
            customTopView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            customTopView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            customTopView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
}
extension MyKurlyViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MyKurlyData.shared.defaultMenuList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyKurlyData.shared.defaultMenuList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "upperCell", for: indexPath)
        cell.textLabel?.text = MyKurlyData.shared.defaultMenuList[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
}
