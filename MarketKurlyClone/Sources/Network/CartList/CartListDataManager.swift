//
//  CartListDataManger.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/27.
//

import Foundation
import Alamofire

class CartListDataManager {
    var totalPrice = 0
    func getCartListDetail(delegate: OrderViewController) {
        
//    https://prod.oliviapage.shop/app/users/9/products/5
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": UserDataManager.shared.token!]
        AF.request("\(Constant.BASE_URL)/app/users/\(UserDataManager.shared.id)/cart",
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate()
            .responseDecodable(of: CartListRequest.self) { response in
                switch response.result{
                case .success(let response):

                    if response.isSuccess  {
                        let result = response.result
                        self.saveData(result: result)
                        
                        delegate.didSuccessGetCartList()
                    }

                    else {
                        switch response.code {
                        case 2000: delegate.failedToCartListRequest(message: "JWT 토큰 인증 실패")
                        default :
                            delegate.failedToCartListRequest(message: "실패")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(String(describing: error))
                    delegate.failedToCartListRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
    func getIntPrice(strPrice: String)->Int{
        let arr = strPrice.components(separatedBy: ",")
        var temp = ""
        for i in arr{
            temp += i
        }
        return Int(temp)!
    }
    
    func saveData(result: CartListSet){
        guard let cart1 = result.cart1 else{return}
        CartData.shared.cart1Cnt = cart1.count
        CartData.shared.cartIds = [Int]()

// MARK: - Cart1 Parse
        for (idx,cart) in cart1.enumerated(){
            CartData.shared.cartIds.append(cart.cartId)
            CartData.shared.cart1["productId\(idx)"] = String(cart.productId)
            CartData.shared.cart1["count\(idx)"] = String(cart.count)
            CartData.shared.cart1["path\(idx)"] = cart.path
            CartData.shared.cart1["name\(idx)"] = cart.name
            CartData.shared.cart1["price\(idx)"] = cart.price
            totalPrice += getIntPrice(strPrice: cart.price)
            CartData.shared.cart1["points\(idx)"] = String(cart.points)
            if CartData.shared.road == ""{
                CartData.shared.road = cart.road
            }
        }
        // MARK: - Cart2 Parse

        guard let cart2 = result.cart2 else{return}
        CartData.shared.cart2Cnt = cart2.count
        for (idx,cart) in cart2.enumerated(){
            CartData.shared.cartIds.append(cart.cartId)
            CartData.shared.cart2["productId\(idx)"] = String(cart.productId)
            CartData.shared.cart2["count\(idx)"] = String(cart.count)
            CartData.shared.cart2["path\(idx)"] = cart.path
            CartData.shared.cart2["name\(idx)"] = cart.name
            CartData.shared.cart2["price\(idx)"] = cart.price
            totalPrice += getIntPrice(strPrice: cart.price)
            CartData.shared.cart2["points\(idx)"] = String(cart.points)
        }
        // MARK: - Cart3 Parse

        guard let cart3 = result.cart3 else{return}
        CartData.shared.cart3Cnt = cart3.count
        for (idx,cart) in cart3.enumerated(){
            CartData.shared.cartIds.append(cart.cartId)
            CartData.shared.cart3["productId\(idx)"] = String(cart.productId)
            CartData.shared.cart3["count\(idx)"] = String(cart.count)
            CartData.shared.cart3["path\(idx)"] = cart.path
            CartData.shared.cart3["name\(idx)"] = cart.name
            CartData.shared.cart3["price\(idx)"] = cart.price
            totalPrice += getIntPrice(strPrice: cart.price)
            CartData.shared.cart3["points\(idx)"] = String(cart.points)
        }
        
        

    }
    
}
