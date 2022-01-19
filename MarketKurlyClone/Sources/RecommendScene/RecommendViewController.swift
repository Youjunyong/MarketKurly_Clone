//
//  RecommendViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import Foundation

import UIKit

class RecommendController: UIViewController {
    
    
    private func setupTabBarItem(){
        self.tabBarController?.tabBar.tintColor = .mainPurple
        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "fillStar25x25")
        self.tabBarItem.title = "추천"
        self.tabBarItem.image = #imageLiteral(resourceName: "star25x25")
        
    }

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupTabBarItem()

        }
 
}
