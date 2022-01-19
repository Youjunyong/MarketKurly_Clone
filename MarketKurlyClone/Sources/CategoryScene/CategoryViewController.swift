//
//  CategoryViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import UIKit



class CategoryViewController: UIViewController {
 

    let customTopView: UIView = {
        let topView = CustomTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
    var categoryTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.register(CategoryListTableViewCell.self , forCellReuseIdentifier: "categoryListCell")
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        return tableView
    }()

    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItem()
        setupTopView()
        setupTableView()
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
    }
    private func setupTopView() {
        view.addSubview(customTopView)
        NSLayoutConstraint.activate([
            customTopView.topAnchor.constraint(equalTo: view.topAnchor , constant: 0),
            customTopView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            customTopView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            customTopView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupTableView(){
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(categoryTableView)
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: customTopView.bottomAnchor, constant: 0),
            categoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    //MARK: - tabBar
    private func setupTabBarItem(){
        self.tabBarController?.tabBar.tintColor = .mainPurple
        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "hamburger")
        self.tabBarItem.title = "카테고리"
        self.tabBarItem.image = #imageLiteral(resourceName: "hamburger")
    }
}
extension CategoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        CategoryItems.shared.isOpend[indexPath.section] = !CategoryItems.shared.isOpend[indexPath.section]
        tableView.reloadSections([indexPath.section], with: .none )
    }
}
extension CategoryViewController: UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return CategoryItems.shared.titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let isOpend = CategoryItems.shared.isOpend[section]

        if isOpend{
            return CategoryItems.shared.contents[section].count + 1
        }else{
            return 1
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let isOpend = CategoryItems.shared.isOpend[indexPath.section]

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryTableViewCell else{return UITableViewCell()}
            if isOpend{
                cell.itemLabel.textColor = .mainPurple
            }else{
                cell.itemLabel.textColor = .black
            }
            cell.iconView.image = CategoryItems.shared.icons[indexPath.section]
            cell.itemLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
            cell.itemLabel.text = CategoryItems.shared.titles[indexPath.section]
            return cell
            
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryListCell") as? CategoryListTableViewCell else{return UITableViewCell()}
            
            
            cell.bgView.backgroundColor = .kurlyLightGray
            cell.itemLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
            cell.itemLabel.text = CategoryItems.shared.contents[indexPath.section][indexPath.row - 1]
            
            return cell
        }
    }
    
    
    
    
}


