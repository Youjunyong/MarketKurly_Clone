//
//  AfterSignInViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//

import UIKit

class AfterSignInViewController: UIViewController {
    
    let dataManager: MyKurlyDataManager = MyKurlyDataManager()
    @IBOutlet weak var tableView: UITableView!
    let customTopView: CustomTopView = {
            let view = CustomTopView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDataManager.shared.token)
        if UserDataManager.shared.isSignIn {
            dataManager.getMyKruly(delegate: self)
            
        }
        setupTabBarItem()
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableView.automaticDimension
        
        let infoNib = UINib(nibName: "UserInfoTableViewCell", bundle: nil)
        tableView.register(infoNib, forCellReuseIdentifier: "infoCell")
        let bannerNib = UINib(nibName: "BannerTableViewCell", bundle: nil)
        tableView.register(bannerNib, forCellReuseIdentifier: "bannerCell")
        let mileageCell = UINib(nibName: "MileageTableViewCell", bundle: nil)
        tableView.register(mileageCell, forCellReuseIdentifier: "mileageCell")
    }

    private func setupTabBarItem(){
        self.tabBarController?.tabBar.tintColor = .mainPurple
        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "user24x24")
        self.tabBarItem.title = "마이컬리"
        self.tabBarItem.image = #imageLiteral(resourceName: "user24x24")
        self.tabBarController?.tabBar.unselectedItemTintColor = .black
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
extension AfterSignInViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < 2{
            return 1
        }
        else if section == 2{
            return 3
        }else{
            return MyKurlyData.shared.menuList[section].count
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return MyKurlyData.shared.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? UserInfoTableViewCell else{return UITableViewCell()}
            if let userName = UserDataManager.shared.userName {
                cell.userNameLabel.text = userName + "님"
            }
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as?
                    BannerTableViewCell else{return UITableViewCell()}
            return cell
        }
        else if indexPath.section == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mileageCell", for: indexPath) as?
                    MileageTableViewCell else{return UITableViewCell()}
            
            cell.textLabel?.text = cell.mileageKey[indexPath.row]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15) // ######
            cell.detailTextLabel?.textColor = .mainPurple
            
            if indexPath.row == 0 {
                cell.detailTextLabel?.text = "\(UserDataManager.shared.point) 원"
            }else if indexPath.row == 1{
                cell.detailTextLabel?.text = "\(UserDataManager.shared.coupon) 장"
            }
//            cell.detailTextLabel?.text = cell.mileageValue[indexPath.row]
            
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mileageCell", for: indexPath)  as?
                    MileageTableViewCell else{return UITableViewCell()}
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15) // ######
            cell.textLabel?.text = "\(MyKurlyData.shared.menuList[indexPath.section][indexPath.row])"
            if indexPath.section == 3 ,indexPath.row == 2{
                cell.detailTextLabel?.textColor = .mainPurple
                cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
                cell.detailTextLabel?.text = "\(UserDataManager.shared.bookmark) 개"
                
            }else{
                cell.detailTextLabel?.text = ""
            }
            return cell
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let idx = indexPath.section
            
        if indexPath.section == 0{
            return 200.0
        }else if idx == 1{
            return 70.0
        }
        else{
            return UITableView.automaticDimension
        }
    }
}

extension AfterSignInViewController {
    func didSuccessSignIn(_ result: MyKurlyResult) {
        UserDataManager.shared.userName = result.name
        UserDataManager.shared.level = result.level
        UserDataManager.shared.coupon = result.coupon!
        UserDataManager.shared.point = result.point!
        UserDataManager.shared.bookmark = result.bookmark!
        tableView.reloadData()
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
}
