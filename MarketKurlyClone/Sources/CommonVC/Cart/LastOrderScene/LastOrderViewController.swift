//
//  LastOrderViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/28.
//

import UIKit

class LastOrderViewController: UIViewController {
    lazy var dataManager = CartItemCountDataManager()
    lazy var OrderDataManager = OrderSubmitDataManager()
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceLabel1: UILabel!
    @IBOutlet weak var priceLabel2: UILabel!
    @IBOutlet weak var priceLabel3: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBAction func payClicked(_ sender: Any) {
        let parameters = OrderPostRequest(cartId: CartData.shared.cartIds, name: UserDataManager.shared.userName! , phone: "01021212121", method: "Kakao pay")
        OrderDataManager.postOrder(parameters, delegate: self)
    }
    
    let naviView: CustomNaviView = {
        let view = CustomNaviView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.productTitleLabel.text = "주문서"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        dataManager.GetCartItemCount(delegate :self)
        btn.setTitle("", for: .normal)
        productLabel.text = ProductData.shared.detailContent["name"]! + "외 \(CartData.shared.totalCount - 1)건"
        userNameLabel.text = UserDataManager.shared.userName
        addressLabel.text =  CartData.shared.road
        priceLabel1.text = CartData.shared.totalPriceStr
        priceLabel2.text = CartData.shared.totalPriceStr
        priceLabel3.text = CartData.shared.totalPriceStr
        pointLabel.text = "구매 시" + "\(CartData.shared.totalPrice / 100 * 5)" + "원 적립(5%)"
        payLabel.text = CartData.shared.totalPriceStr + "원 결제하기"
    }
    
    private func setupNavi(){
        view.addSubview(naviView)
        naviView.backButton.addTarget(self, action: #selector(goBack(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            naviView.topAnchor.constraint(equalTo: view.topAnchor , constant: 0),
            naviView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            naviView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            naviView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    @objc func goBack(sender: UIButton){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
extension LastOrderViewController {
    func failedToRequest(message: String){
        presentAlert(title: message)
    }
    func didSuccessOrder(){
        presentAlert(title: "주문 완료")
    }
}
