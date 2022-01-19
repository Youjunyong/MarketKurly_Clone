//
//  ViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import UIKit
import XLPagerTabStrip

class HomeViewController: ButtonBarPagerTabStripViewController {
    
    
    
    
    var alertButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(hiddenButtonClicked), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var dimmingView: UIView = {
        let dimmingView = UIView()
        dimmingView.backgroundColor = .black
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.isUserInteractionEnabled = false
        dimmingView.alpha = 0.4
        return dimmingView
    }()
    
    var alertImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.image = UIImage(named: "initCouponFalse")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    var alertCheckButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func initCouponViewSetup(){
        view.addSubview(dimmingView)
        view.addSubview(alertImageView)
        view.addSubview(alertButton)
        view.addSubview(alertCheckButton)
        
        let viewWidth = UIScreen.main.bounds.width - 40
        NSLayoutConstraint.activate([
            alertImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertImageView.widthAnchor.constraint(equalToConstant: viewWidth),
            alertImageView.heightAnchor.constraint(equalToConstant: viewWidth * 1.2 ),
            alertButton.bottomAnchor.constraint(equalTo: alertImageView.bottomAnchor),
            alertButton.leadingAnchor.constraint(equalTo: alertImageView.leadingAnchor),
            alertButton.trailingAnchor.constraint(equalTo: alertImageView.trailingAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: viewWidth * 1.2 * 0.12),
            alertCheckButton.bottomAnchor.constraint(equalTo: alertButton.topAnchor),
            alertCheckButton.leadingAnchor.constraint(equalTo: alertImageView.leadingAnchor),
            alertCheckButton.widthAnchor.constraint(equalToConstant: 50),
            alertCheckButton.heightAnchor.constraint(equalToConstant: 50),
            dimmingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmingView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTabBarItem(){
        self.tabBarController?.tabBar.tintColor = .mainPurple
        self.tabBarItem.selectedImage = #imageLiteral(resourceName: "fillhome25x25")
        self.tabBarItem.image = #imageLiteral(resourceName: "home25x25")
        self.tabBarItem.title = "홈"
        self.tabBarController?.tabBar.unselectedItemTintColor = .black

    }
    let customTopView: CustomTopView = {
            let view = CustomTopView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        override func viewDidLoad() {
            settings.style.buttonBarBackgroundColor = .white
            settings.style.buttonBarItemBackgroundColor = .white
            settings.style.selectedBarBackgroundColor = .kurlyPurple
            settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
            settings.style.selectedBarHeight = 3.0
            settings.style.buttonBarMinimumLineSpacing = 0
            settings.style.buttonBarItemTitleColor = .black
            settings.style.buttonBarItemsShouldFillAvailableWidth = true
            
            settings.style.buttonBarLeftContentInset = 0
            settings.style.buttonBarRightContentInset = 0
            changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                guard changeCurrentIndex == true else { return }
                oldCell?.label.textColor = .kurlyTextGray
                oldCell?.label.font = UIFont.systemFont(ofSize: 15, weight: .light)
                newCell?.label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                newCell?.label.textColor = .kurlyPurple
            }
            super.viewDidLoad()
            
            setupTabBarItem()
            setupView()
            if !UserDataManager.shared.is_init {
                initCouponViewSetup()
            }
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }

    
    @objc func checkButtonClicked(){
        if !UserDataManager.shared.is_init {
            UserDataManager.shared.is_init = !UserDataManager.shared.is_init
            alertImageView.image = UIImage(named: "initCouponTrue")
        }else{
            UserDataManager.shared.is_init = !UserDataManager.shared.is_init
            alertImageView.image = UIImage(named: "initCouponFalse")
        }
        
    }
    @objc func hiddenButtonClicked(){
        alertButton.removeFromSuperview()
        alertImageView.removeFromSuperview()
        dimmingView.removeFromSuperview()
        
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let KurlyRecommendVC = UIStoryboard(name: "HomeScene", bundle: nil).instantiateViewController(withIdentifier: "kurlyRecommendVC")
        let NewProductVC = UIStoryboard(name: "HomeScene", bundle: nil).instantiateViewController(withIdentifier: "newProductVC")
        
        let BestVC = UIStoryboard(name: "HomeScene", bundle: nil).instantiateViewController(withIdentifier: "BestVC")
        let CheapShoppingVC = UIStoryboard(name: "HomeScene", bundle: nil).instantiateViewController(withIdentifier: "CheapShoppingVC")
        let SaleVC = UIStoryboard(name: "HomeScene", bundle: nil).instantiateViewController(withIdentifier: "SaleVC")
        return [KurlyRecommendVC, NewProductVC, BestVC, CheapShoppingVC, SaleVC]
    }

        private func setupView() {
            view.addSubview(customTopView)
            
            customTopView.cartButton.addTarget(self, action: #selector(goCart(sender:)), for: .touchUpInside)
            NSLayoutConstraint.activate([
                customTopView.topAnchor.constraint(equalTo: view.topAnchor , constant: 0),
                customTopView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                customTopView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                customTopView.heightAnchor.constraint(equalToConstant: 90)
            ])
        }
    
    @objc func goCart(sender: UIButton ){
        let storyboard = UIStoryboard(name: "CartScene", bundle: nil)
        let CartVC = storyboard.instantiateViewController(withIdentifier: "CartVC")
        CartVC.modalPresentationStyle = .fullScreen
        present(CartVC, animated: true, completion: nil)
    }
    
}

