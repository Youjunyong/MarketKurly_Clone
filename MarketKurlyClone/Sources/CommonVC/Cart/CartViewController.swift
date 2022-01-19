//
//  CartViewController.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/25.
//

import UIKit

class CartViewController: UIViewController {
    
    lazy var dataManager = DeleteCartListDataManager()
    
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var orderButton: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let naviView: CustomNaviView = {
        let view = CustomNaviView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cartButton.removeFromSuperview()
        view.productTitleLabel.text = "장바구니"
        return view
    }()

    @IBAction func orderClicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "LastOrderScene", bundle: nil)
        guard let VC = storyboard.instantiateViewController(withIdentifier: "lastVC") as? LastOrderViewController else{return}
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupTableView()
        orderBtn.setTitle("", for: .normal)
        finalPrice()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let headerNib = UINib(nibName: "CartHeaderTableViewCell", bundle: nil)
        tableView.register(headerNib, forCellReuseIdentifier: "headerCell")
        let coldNib = UINib(nibName: "CartColdTableViewCell", bundle: nil)
        tableView.register(coldNib, forCellReuseIdentifier: "coldCell")
        tableView.separatorStyle = .none
        let footerNib = UINib(nibName: "CartFooterTableViewCell", bundle: nil)
        tableView.register(footerNib, forCellReuseIdentifier: "footerCell")
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
    
    func deleteCartList(productId: Int){
        let parameters = DeleteCartListRequest(productId: productId)
        dataManager.patchDeleteCart(parameters, delegate: self)
    }
    
}
extension CartViewController: UITableViewDelegate{
    
}
extension CartViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0 :
            return 1
        case 1 :
            return CartData.shared.cart1Cnt
        case 2 :
            return CartData.shared.cart2Cnt
        case 3 :
            return CartData.shared.cart3Cnt
        case 4 :
            return 1
        default:
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? CartHeaderTableViewCell else{return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
            // MARK: - CartData -> Cart1
        case 1:
            let idx = indexPath.row
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "coldCell") as? CartColdTableViewCell else{return UITableViewCell()}
            
            cell.productId = Int(CartData.shared.cart1["productId\(idx)"]!)!
            cell.delegate = self
            cell.selectionStyle = .none
            if indexPath.row > 0{
                cell.sectionHeader.isHidden = true
                cell.topConstraint.constant = 10
            }else{
                cell.topConstraint.constant = 70
                cell.sectionHeader.isHidden = false
                cell.sectionHeader.image = UIImage(named: "cartCold")
            }
            
            let intPrice = getIntPrice(strPrice: CartData.shared.cart1["price\(idx)"]!)
            let totalPrice = getTotalPrice(intPrice: intPrice, count: Int(CartData.shared.cart1["count\(idx)"]!)!)
            cell.priceLabel.text = totalPrice + "원"

            cell.nameLabel.text = CartData.shared.cart1["name\(idx)"]
            cell.countLabel.text = CartData.shared.cart1["count\(idx)"]

            let path = CartData.shared.cart1["path\(idx)"]
            let url = URL(string: path!)
            let data = try! Data(contentsOf: url!)
            let img = UIImage(data: data)
            cell.productImage.image = img
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "coldCell") as? CartColdTableViewCell else{return UITableViewCell()}
            
            cell.delegate = self
            let idx = indexPath.row
            
            cell.productId = Int(CartData.shared.cart2["productId\(idx)"]!)!

            if indexPath.row > 0{
                cell.sectionHeader.isHidden = true
                cell.topConstraint.constant = 10
            }else{
                cell.topConstraint.constant = 70
                cell.sectionHeader.isHidden = false
                cell.sectionHeader.image = UIImage(named: "cartFreeze")
            }
            cell.nameLabel.text = CartData.shared.cart2["name\(idx)"]
            
            let intPrice = getIntPrice(strPrice: CartData.shared.cart2["price\(idx)"]!)
            let totalPrice = getTotalPrice(intPrice: intPrice, count: Int(CartData.shared.cart2["count\(idx)"]!)!)
            cell.priceLabel.text = totalPrice + "원"
            
            cell.countLabel.text = CartData.shared.cart2["count\(idx)"]
            let path = CartData.shared.cart2["path\(idx)"]
            let url = URL(string: path!)
            let data = try! Data(contentsOf: url!)
            let img = UIImage(data: data)
            cell.productImage.image = img
            return cell
            
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "coldCell") as? CartColdTableViewCell else{return UITableViewCell()}
            cell.delegate = self
            let idx = indexPath.row
            cell.productId = Int(CartData.shared.cart3["productId\(idx)"]!)!
            
            if indexPath.row > 0{
                cell.sectionHeader.isHidden = true
                cell.topConstraint.constant = 10
            }else{
                cell.topConstraint.constant = 70

                cell.sectionHeader.image = UIImage(named: "cartRoom")
                cell.sectionHeader.isHidden = false
            }
            cell.nameLabel.text = CartData.shared.cart3["name\(idx)"]
            let intPrice = getIntPrice(strPrice: CartData.shared.cart3["price\(idx)"]!)
            let totalPrice = getTotalPrice(intPrice: intPrice, count: Int(CartData.shared.cart3["count\(idx)"]!)!)
            cell.priceLabel.text = totalPrice + "원"
            cell.countLabel.text = CartData.shared.cart3["count\(idx)"]
            
            let path = CartData.shared.cart3["path\(idx)"]
            let url = URL(string: path!)
            let data = try! Data(contentsOf: url!)
            let img = UIImage(data: data)
            cell.productImage.image = img
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "footerCell") as? CartFooterTableViewCell else{return UITableViewCell()}
            cell.priceLabel1.text = self.orderButton.text?.components(separatedBy: "원")[0]
            cell.priceLabel2.text = self.orderButton.text?.components(separatedBy: "원")[0]
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .blue
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            if indexPath.row == 0 {return 240}
            return 190
        case 2:
            if indexPath.row == 0 {return 240}
            return 190
        case 3:
            if indexPath.row == 0 {return 240}
            return 190
        case 4:
            return 280
        default:
            return 190
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
}

extension CartViewController{
    func didSuccessDeleteCartList(){
        self.presentAlert(title: "삭제완료!")
        
        self.dataManager.getCartListDetail(delegate: self)
   
    }
    func didSuccessGetCartList(){
        
        finalPrice()
        self.tableView.reloadData()
   

    }
    func failedToRequest(message: String){
        self.presentAlert(title: message)
    }
    func getIntPrice(strPrice: String)->Int{
        let arr = strPrice.components(separatedBy: ",")
        var temp = ""
        for i in arr{
            temp += i
        }
        return Int(temp)!
    }
    
    func getTotalPrice(intPrice: Int, count: Int)->String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let price = Double(intPrice * count)
        
        
        let result = numberFormatter.string(from: NSNumber(value:price))!
        return result
    }
    
    func finalPrice(){
        var price = 0
        for idx in 0...CartData.shared.cart1Cnt - 1{
            let p = CartData.shared.cart1["price\(idx)"]!
            let c = Int(CartData.shared.cart1["count\(idx)"]!)!
            price += c * getIntPrice(strPrice: p)
            
        }
        for idx in 0...CartData.shared.cart2Cnt - 1{
            let p = CartData.shared.cart2["price\(idx)"]!
            let c = Int(CartData.shared.cart2["count\(idx)"]!)!
            price += c * getIntPrice(strPrice: p)
            
        }
        for idx in 0...CartData.shared.cart3Cnt - 1{
            let p = CartData.shared.cart3["price\(idx)"]!
            let c = Int(CartData.shared.cart3["count\(idx)"]!)!
            price += c * getIntPrice(strPrice: p)
            
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let labelText = numberFormatter.string(from: NSNumber(value:price))!
        self.orderButton.text = labelText + "원 주문하기"
        CartData.shared.totalPrice = price
        CartData.shared.totalPriceStr = labelText
        CartData.shared.totalCount = CartData.shared.cart1Cnt + CartData.shared.cart2Cnt + CartData.shared.cart3Cnt
    }
}
 
