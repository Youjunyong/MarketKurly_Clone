//
//  OrderSubmitDataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/28.
//

import Foundation
import Alamofire

class OrderSubmitDataManager {

    func postOrder(_ parameters: OrderPostRequest, delegate: LastOrderViewController) {
        AF.request("\(Constant.BASE_URL)/app/users", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: RegisterResponse.self) { response in
                switch response.result {
                case .success(let response):
                    
                    
                    if response.isSuccess{
                        delegate.didSuccessOrder()
                    }
                    
                    else {
                        print(response.code)
                        switch response.code {
                        case 2001: delegate.didSuccessOrder()
                        case 3010: delegate.failedToRequest(message: "재고 부족")
                        case 4000: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요(DB Error)")
                            
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
