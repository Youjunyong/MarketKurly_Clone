//
//  ViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import UIKit
import XLPagerTabStrip

class PaymentViewController: ButtonBarPagerTabStripViewController {
    
    var idx: Int?
    
    let footerView: FooterView = {
        let view = FooterView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let naviView: CustomNaviView = {
        let navi = CustomNaviView()
        navi.translatesAutoresizingMaskIntoConstraints = false

        return navi
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
        setupNavi()
        setFooterView()
  
        }

  
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let DetailVC = UIStoryboard(name: "PaymentScene", bundle: nil).instantiateViewController(withIdentifier: "DetailVC")
        let InfoVC = UIStoryboard(name: "PaymentScene", bundle: nil).instantiateViewController(withIdentifier: "InfoVC")
        let CommentVC = UIStoryboard(name: "PaymentScene", bundle: nil).instantiateViewController(withIdentifier: "CommentVC")
        let InquiryVC = UIStoryboard(name: "PaymentScene", bundle: nil).instantiateViewController(withIdentifier: "InquiryVC")
        
     
        return [DetailVC ,InfoVC, CommentVC ,InquiryVC ]
    }
    
    private func setupNavi() {
        view.addSubview(naviView)
        
        if idx != nil {
            ProductData.shared.detailIdx = idx
            naviView.productTitleLabel.text = ProductData.shared.productContent1["name\(idx!)"]
        }
        
        
//        ProductData.shared.productContent1["name\(index)"]!
        naviView.backButton.addTarget(self, action: #selector(goBack(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            naviView.topAnchor.constraint(equalTo: view.topAnchor , constant: 0),
            naviView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            naviView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            naviView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setFooterView(){
        view.addSubview(footerView)
        footerView.heartBtn.addTarget(self, action: #selector(heartClicked(sender:)), for: .touchUpInside)
        footerView.orderBtn.addTarget(self, action: #selector(goOrder(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    @objc func goBack(sender: UIButton){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func goOrder(sender: UIButton){
        let storyboard = UIStoryboard(name: "OrderScene", bundle: nil)
        let OrderVC = storyboard.instantiateViewController(withIdentifier: "OrderVC")
        present(OrderVC, animated: true, completion: nil)
    }
    
    @objc func heartClicked(sender: UIButton){
        
        guard let superView = sender.superview as? FooterView else{return}
        if superView.imageView.image == UIImage(named: "PayFooterTabTrue") {
            superView.imageView.image = UIImage(named: "PayFooterTabFalse")
        }else{
            superView.imageView.image = UIImage(named: "PayFooterTabTrue")
        }
        
    }
    
}
