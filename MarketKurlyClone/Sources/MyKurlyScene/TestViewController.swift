//
//  TestViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/18.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        guard let VC1 = self.storyboard?.instantiateViewController(withIdentifier: "MyKurly") as? MyKurlyViewController else{return}
        self.tabBarController?.viewControllers?.append(
        print(self.tabBarController?.viewControllers)
        
        
        self.view.window?.rootViewController = VC1
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        print("@")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
