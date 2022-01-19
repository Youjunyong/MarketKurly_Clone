//
//  AddCartDataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import Alamofire
import Foundation
//LoginOrRegisterViewController
class AddCartDataManager {

    func postAddCart(_ parameters: AddCartRequest, delegate: OrderViewController) {
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": UserDataManager.shared.token!]
        AF.request("\(Constant.BASE_URL)/app/users/\(UserDataManager.shared.id)/cart", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: headers)
            .validate()
            .responseDecodable(of: AddCartResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess{
                        delegate.didSuccessAddCart()
                    }
                    
                    else {
                        switch response.code {
                        case 2000: delegate.failedToRequest(message: "jwt토큰을 입력해주세요")
                        case 2012: delegate.failedToRequest(message: "user id를 입력해주세요")
                        case 2024: delegate.failedToRequest(message: "상품 id 에러")
                        case 3008: delegate.failedToRequest(message: "판매 중단")
                        case 2025: delegate.failedToRequest(message: "수량을 입력하세요")
//
                        default: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
