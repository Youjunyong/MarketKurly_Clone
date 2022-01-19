//
//  File.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/25.
//

import UIKit
class OrderViewController: UIViewController {
    lazy var getCartListDataManager: CartListDataManager = CartListDataManager()

    lazy var addCartDataManager:AddCartDataManager = AddCartDataManager()
    
    var itemNum = 1
    
    @IBOutlet weak var tablaView: UITableView!
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var cartAlertView: UIImageView!
    @IBOutlet weak var putInCartButton: UIButton!
    
    @IBOutlet weak var cartAlertViewYConstraint: NSLayoutConstraint!
    @IBAction func dismissClicked(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func putInCartClicked(_ sender: Any) {
        let productId = Int(ProductData.shared.detailContent["productId"]!)!
        print("#########", productId)
        let parameters = AddCartRequest(productId: productId, count: self.itemNum)
        
        self.addCartDataManager.postAddCart(parameters, delegate: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.setTitle("", for: .normal)
        tablaView.delegate = self
        tablaView.dataSource = self
        let nib = UINib(nibName: "OrderItemTableViewCell", bundle: nil)
        tablaView.register(nib, forCellReuseIdentifier: "cell")
        tablaView.separatorStyle = .none
        putInCartButton.setTitle("\(ProductData.shared.detailContent["price"]!)원 장바구니 담기", for: .normal)
    }
    
    func setPrice(intPrice: Int){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let price = Double(intPrice)
        let result = numberFormatter.string(from: NSNumber(value:price))!
        putInCartButton.setTitle("\(result)원 장바구니 담기", for: .normal)

    }
    
}
extension OrderViewController: UITableViewDelegate {
    
}
extension OrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? OrderItemTableViewCell else{return UITableViewCell()}
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
extension OrderViewController {
    func didSuccessAddCart() {
        self.getCartListDataManager.getCartListDetail(delegate: self)
        
        
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
    
}


extension OrderViewController {
    func didSuccessGetCartList() {
        self.cartAlertViewYConstraint.constant = 5
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 1) {
                self.cartAlertViewYConstraint.constant = -80
                self.view.layoutIfNeeded()
            } completion: { _ in
                self.presentingViewController?.dismiss(animated: true, completion:nil)
                }
            }
    }
    
    func failedToCartListRequest(message: String) {
        self.presentAlert(title: message)
    }
    
}
