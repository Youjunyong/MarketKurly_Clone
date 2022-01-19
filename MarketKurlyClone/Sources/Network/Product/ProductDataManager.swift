//
//  DataManager.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/17.
//
import Alamofire
import Foundation

class ProductDataManager {

    var data: ProductSets?
    
    let randomCompany = ["[스테릴가르다]",  "[램노스]", "[온기와]", "[Better me]", "[Kurly's]", "[KF365]", "[웨지우드]" ,"[베르나르도]", "[실리만]", "[양평상회]", "[다담]"]
    
    func getProducts(delegate: KurlyRecommendViewController) {
        
        
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": UserDataManager.shared.token!]
        AF.request("\(Constant.BASE_URL)/app/users/\(UserDataManager.shared.id)/home/kurlyrcmd",
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: headers)
            .validate()
            .responseDecodable(of: ProductResponse.self) { response in
                switch response.result{
                case .success(let response):
                    // 성공했을 때
                    if response.isSuccess , let result = response.result {
                        
                        self.data = result

                        self.saveData(self.data!)
                        delegate.didSuccessSignIn(result)
                    }
                    // 실패했을 때
                    else {
                        switch response.code {
                        case 2000: delegate.failedToRequest(message: "JWT 토큰 인증 실패")
                        case 2016: delegate.failedToRequest(message: "User ID 에러")
                        case 2012: delegate.failedToRequest(message: "User ID 에러")
                        case 4000: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                        default: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print(String(describing: error))
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
    
    func saveData(_ data: ProductSets){
//        print(data.ProductSet1)
//        MARK: - ProductSet1 (ProductContent1 Type)

        
        var cnt = 0
        for (idx, item) in data.ProductSet1.enumerated(){
            let randomIdx = Int.random(in: 0...10)
            ProductData.shared.productContent1["productId\(idx)"] = "\(item!.productId)"
            ProductData.shared.productContent1["name\(idx)"] = "\(randomCompany[randomIdx]) " + item!.name
            ProductData.shared.productContent1["path\(idx)"] = item?.path
            ProductData.shared.productContent1["price\(idx)"] = item?.price
            ProductData.shared.productContent1["disPrice\(idx)"] = item?.disPrice ?? nil
            ProductData.shared.productContent1["discount\(idx)"] = item?.discount ?? nil
            cnt += 1
        }
        ProductData.shared.productContent1["cnt"] = "\(cnt)"


    }
}
//ProductSets(ProductSet1:
//            [Optional(MarketKurlyClone.ProductContent1(
//                    name: Optional("GAP 황금사과 2입"),
//                    path:Optional("https://media.istockphoto.com/photos/apples-picture-id1130415398?s=612x612"),
//                    price: Optional("9,900"),
//                    disPrice: Optional("9,405"),
//                    discount: Optional("5%"))),
//
//             Optional(MarketKurlyClone.ProductContent1(name: Optional("친환경 제주레몬 "), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20191204/gv10000071177_1.jpg"), price: Optional("35,000"), disPrice: nil, discount: nil)), Optional(MarketKurlyClone.ProductContent1(name: Optional("흰새우살 180g"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210830/gv00000220616_1.jpg"), price: Optional("6,500"), disPrice: Optional("5,850"), discount: Optional("10%"))), Optional(MarketKurlyClone.ProductContent1(name: Optional("피치애플 4-6입"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20211015/gv20000234545_1.jpg"), price: Optional("12,900"), disPrice: Optional("12,555"), discount: Optional("5%"))), Optional(MarketKurlyClone.ProductContent1(name: Optional("냉동 허니듀 멜론"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210330/gv30000168521_1.jpg"), price: Optional("9,950"), disPrice: nil, discount: nil)), Optional(MarketKurlyClone.ProductContent1(name: Optional("유기농 스위트 코코넛칩"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20190722/gv40000056467_1.jpg"), price: Optional("9,900"), disPrice: nil, discount: nil)), Optional(MarketKurlyClone.ProductContent1(name: Optional("국내산 할라피뇨 고추"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20180601/gv00000024620_1.jpg"), price: Optional("3,790"), disPrice: nil, discount: nil)), Optional(MarketKurlyClone.ProductContent1(name: Optional("유기농 다진 적양배추"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20180312/gv30000019427_1.jpg"), price: Optional("3,500"), disPrice: nil, discount: nil)), Optional(MarketKurlyClone.ProductContent1(name: Optional("영주 햇생강 1박스"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210127/gv30000154870_1.jpg"), price: Optional("11,900"), disPrice: Optional("10,948"), discount: Optional("8%"))), Optional(MarketKurlyClone.ProductContent1(name: Optional("돌나물 150g"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210121/gv40000153359_1.jpg"), price: Optional("1,590"), disPrice: nil, discount: nil))],
//            ProductSet2: [Optional(MarketKurlyClone.ProductContent2(name: Optional("아몬드브리즈 2종"), path: Optional("https://img-cf.kurly.com/shop/data/goods/daily/08d2b1ae0965903e7e78.jpg"), price: Optional("16,500"), disPrice: Optional("14,380"), discount: Optional("12%"), Remaintime: Optional("25:21:59"), time: Optional("2021-10-26T14:47:47.000Z"))), Optional(MarketKurlyClone.ProductContent2(name: Optional("유기농 정안밤 800g"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20201007/gv30000125887_1.jpg"), price: Optional("12,500"), disPrice: Optional("11,250"), discount: Optional("10%"), Remaintime: Optional("49:24:14"), time: Optional("2021-10-27T14:50:02.000Z")))],
//            ProductSet3: [Optional(MarketKurlyClone.ProductContent1(name: Optional("GAP 황금사과 2입"), path: Optional("https://media.istockphoto.com/photos/apples-picture-id1130415398?s=612x612"), price: Optional("9,900"), disPrice: Optional("9,405"), discount: Optional("5%"))), Optional(MarketKurlyClone.ProductContent1(name: Optional("흰새우살 180g"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210830/gv00000220616_1.jpg"), price: Optional("6,500"), disPrice: Optional("5,850"), discount: Optional("10%"))), Optional(MarketKurlyClone.ProductContent1(name: Optional("돌나물 150g"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210121/gv40000153359_1.jpg"), price: Optional("1,590"), disPrice: nil, discount: nil)), Optional(MarketKurlyClone.ProductContent1(name: Optional("유기농 다진 적양배추"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20180312/gv30000019427_1.jpg"), price: Optional("3,500"), disPrice: nil, discount: nil))],
//            ProductSet4: [Optional(MarketKurlyClone.ProductContent1(name: Optional("흰새우살 180g"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210830/gv00000220616_1.jpg"), price: Optional("6,500"), disPrice: Optional("5,850"), discount: Optional("10%"))), Optional(MarketKurlyClone.ProductContent1(name: Optional("영주 햇생강 1박스"), path: Optional("https://img-cf.kurly.com/shop/data/goodsview/20210127/gv30000154870_1.jpg"), price: Optional("11,900"), disPrice: Optional("10,948"), discount: Optional("8%")))])
