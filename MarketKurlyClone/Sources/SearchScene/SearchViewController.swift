//
//  SearchViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import UIKit
class SearchController: UIViewController {
    
    
    private func setupTabBarItem(){
        self.tabBarController?.tabBar.tintColor = .mainPurple
        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "search24x24")
        self.tabBarItem.title = "검색"
        self.tabBarItem.image = #imageLiteral(resourceName: "search24x24")
        self.tabBarController?.tabBar.unselectedItemTintColor = .black
    }

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupTabBarItem()

        }
 
}
