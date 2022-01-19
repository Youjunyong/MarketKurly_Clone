//
//  DataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//
import Alamofire
import Foundation
//LoginOrRegisterViewController
class RegisterDataManager {

    func postRegister(_ parameters: RegisterRequest, delegate: RegisterViewController) {
        AF.request("\(Constant.BASE_URL)/app/users", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: RegisterResponse.self) { response in
                switch response.result {
                case .success(let response):
                    
                    
                    if response.isSuccess{
                        delegate.didSuccessRegister()
                    }
                    
                    else {
                        print(response.code)
                        switch response.code {
                        case 2001: delegate.failedToRequest(message: "이메일을 입력해주세요")
                        case 2002: delegate.failedToRequest(message: "이메일은 30자리 미만으로 입력해주세요")
                        case 2003: delegate.failedToRequest(message: "이메일 형식을 정확하게 입력해주세요")

                        case 2007: delegate.failedToRequest(message: "ID는 6자 이상으로 입력해주세요")

                        case 2012: delegate.failedToRequest(message: "ID를 입력해주세요")
                        case 2004: delegate.failedToRequest(message: "비밀번호를 입력해주세요")
                        case 2019: delegate.failedToRequest(message: "이름을 입력해주세요")
                        case 2020: delegate.failedToRequest(message: "휴대폰번호를 입력해주세요")
                        case 2021: delegate.failedToRequest(message: "우편번호를 입력해주세요")
                        case 2023: delegate.failedToRequest(message: "상세 주소를 입력해주세요")



                            
                        case 3001: delegate.failedToRequest(message: "이미 가입된 이메일입니다.")
                        case 3007: delegate.failedToRequest(message: "이미 가입된 아이디입니다.")

                        case 3004: delegate.failedToRequest(message: "비밀번호를 다시 확인해주세요")
                        case 3006: delegate.failedToRequest(message: "탈퇴된 계정입니다")
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
