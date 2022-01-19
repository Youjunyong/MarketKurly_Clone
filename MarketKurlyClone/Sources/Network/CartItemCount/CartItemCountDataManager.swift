//
//  CartItemCountDataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/28.
//

import Alamofire
import Foundation

class CartItemCountDataManager {

    
    func GetCartItemCount(delegate: LastOrderViewController) {
        

        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": UserDataManager.shared.token!]
        AF.request("\(Constant.BASE_URL)/app/users/\(UserDataManager.shared.id)/cartnum",
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate()
            .responseDecodable(of: CartItemCountResponse.self) { response in
                switch response.result{
                case .success(let response):

                    if response.isSuccess  {
                        let result = response.result
                        CartData.shared.totalCount  = result[0].counts
                    }

                    else {
                        switch response.code {
                        case 2000: delegate.failedToRequest(message: "JWT 토큰 인증 실패")
                        default :
                            delegate.failedToRequest(message: "실패")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(String(describing: error))
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
    
}
