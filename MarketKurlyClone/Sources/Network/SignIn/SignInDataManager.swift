//
//  DataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//
import Alamofire
import Foundation

class SignInDataManager {

    
    func postSignIn(_ parameters: SignInRequest, delegate: LoginOrRegisterViewController) {
        
        AF.request("\(Constant.BASE_URL)/app/login", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: SignInResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    UserDataManager.shared.isSignIn = true
                    
                    if response.isSuccess, let result = response.result {
                        delegate.didSuccessSignIn(result)
                        UserDataManager.shared.id =  "\(response.result!.userId)"
                    }
                    // 실패했을 때
                    else {
                        print(response.code)
                        switch response.code {
                        case 2004: delegate.failedToRequest(message: "비밀번호를 입력해주세요")
                        case 2012: delegate.failedToRequest(message: "ID를 입력해주세요")
                        case 2013: delegate.failedToRequest(message: "해당 회원이 존재하지 않습니다")
                        case 3004: delegate.failedToRequest(message: "비밀번호를 다시 확인해주세요")
                        case 3006: delegate.failedToRequest(message: "탈퇴된 계정입니다")
                        case 4000: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                            
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
