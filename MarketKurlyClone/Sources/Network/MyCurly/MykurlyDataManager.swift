//
//  DataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//
import Alamofire
import Foundation

class MyKurlyDataManager {

    
    func getMyKruly(delegate: AfterSignInViewController) {
        
        let headers: HTTPHeaders = [
            "X-ACCESS-TOKEN": UserDataManager.shared.token!
        ]

        AF.request("\(Constant.BASE_URL)/app/users/\(UserDataManager.shared.id)/mykurly",
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate()
            .responseDecodable(of: MyKurlyResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    
                    
                    if response.isSuccess, let result = response.result[0] {
                        delegate.didSuccessSignIn(result)
                    }
                    // 실패했을 때
                    else {
                        
                        switch response.code {
                        case 2000: delegate.failedToRequest(message: "JWT 토큰 인증 실패")
                            
                        case 2012: delegate.failedToRequest(message: "User ID 에러")
                            
                        case 4000: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                            
                        default: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                        }
                    }
                case .failure(let error):
                    
                    print(error.localizedDescription)
//                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
