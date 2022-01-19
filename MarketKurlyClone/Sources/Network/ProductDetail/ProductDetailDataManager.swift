//
//  ProductDetailDataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/26.
//

import Alamofire
import Foundation

class ProductDetailDataManager {

    
    func getProductDetail(delegate: KurlyRecommendViewController, productId: Int) {
        
//    https://prod.oliviapage.shop/app/users/9/products/5
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": UserDataManager.shared.token!]
        AF.request("\(Constant.BASE_URL)/app/users/\(UserDataManager.shared.id)/products/\(productId)",
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate()
            .responseDecodable(of: ProductDetailResponse.self) { response in
                switch response.result{
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess  {
                        let result = response.result
                        self.saveData(result: result)
                        delegate.didSucessGetDetail()
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2000: delegate.failedToRequest(message: "JWT 토큰 인증 실패")
                        case 2016: delegate.failedToRequest(message: "User ID 에러")
                        case 2012: delegate.failedToRequest(message: "User ID 에러")
                        case 4000: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                        default:
                            delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(String(describing: error))
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
    func saveData(result : ProductDetail){
        
        ProductData.shared.detailContent["img"] = result.img
        
//        print(ProductData.shared.detailContent)
        let product = result.product
        ProductData.shared.detailContent["name"] = product.name
        ProductData.shared.detailContent["summary"] = product.summary
        ProductData.shared.detailContent["path"] = product.path
        ProductData.shared.detailContent["points"] = "\(product.points)"
        if product.unit != nil {ProductData.shared.detailContent["unit"] = product.unit}
        if product.weight != nil {ProductData.shared.detailContent["weight"] = product.weight}
        if product.origin != nil {ProductData.shared.detailContent["origin"] = product.origin}
        if product.allergy != nil {ProductData.shared.detailContent["allergy"] = product.allergy}
        if product.expirationDate != nil{ProductData.shared.detailContent["expirationDate"] = product.expirationDate}
        if product.info != nil {ProductData.shared.detailContent["info"] = product.info}
        ProductData.shared.detailContent["delivery"] = product.delivery
        ProductData.shared.detailContent["packType"] = product.packType
        ProductData.shared.detailContent["price"] = product.price
        if product.disPrice != nil {ProductData.shared.detailContent["disPrice"] = product.disPrice}
        if product.discount != nil {ProductData.shared.detailContent["discount"] = product.discount}
        
//        print(ProductData.shared.detailContent)
    }
    
}
