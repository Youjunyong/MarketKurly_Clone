

### 기본 설정
1. - [x] iOS 13부터 지원 
2. - [x] iPhone 방향 - Portrait만 유지
3. - [x] iPad 지원, 방향 - 완전 삭제
4. - [x] Status bar style - dark Content
5. - [x] Appearance - Light

### Configuration (Directory)

1. Constant - 자주 쓰이는 상수 값 저장
2. Certificate - 인증서 저장
3. Secret - 중요한 값 저장 (Token, key)
4. Font - 폰트 파일(otf, rtf) 저장
5. Extension - 기존 클래스의 extension 파일 저장 
   * (기존 클래스 커스터마이징) ex : Date, String, Color, UIFont, UIButton .....
6. Custom - 커스텀 클래스 저장
7. Base - 기본으로 사용되는 클래스 저장

### Action
1. 화면 전환 - modal, navigation, window 이용
2. 인디케이터 - 기본, gif 커스텀
3. 경고창, 팝업 - alert, action sheet, 하단 custom

### Network
1. 로그인 API
    - method : POST
    - encodable을 이용한 request entity
    -  decodable을 이요한 response entity
2. KOBIS API를 이용한 영화정보 가져오기
    - method : GET
    - decodable을 이용한 response entity



### Design Pattern

1. View
    - View(.xib) + ViewController(.swift)
    - View와 ViewController는 @IBOutlet과 @IBAction으로 연결
    - 눈에 보이는 UI적 부분과 사용자 인터렉션에 의한 동작을 다루는 역할
2. DataManager
    - 네트워크 통신을 담당하는 역할
    - Alamofire 이용
3. Entity
    - Encodable, Decodable을 이용한 입/출력 객체
    - View와 DataManager를 연결하는 역할

# 개발일지 1일차 (10월 16일)



과제 프로젝트에 대해 주어진 규칙들과 설정들에 대해서 체크하며 세팅하고, 파일트리를 구성했다.

* 런치 스크린 완성
* 탭바 5개 페이지 생성완료
* 상단 보라색 뷰 완성
* 회원가입 뷰  - 50% 완료







# 개발일지 2일차 (10월 17일)



* 마이 컬리 화면 완료
* 로그인 화면 완료
* 홈화면 상단 페이징 메뉴바 완료 (70%)





### 팀별 1차 스크럼 진행

#### 현재까지 진행 상황

루카: 홈화면 일부, 로그인회원가입 화면 구현 

레지: 홈화면 일부, 로그인회원가입 화면 구현 

올리비아: 로그인회원가입 api 구현,erd설계중 - 



#### 1차 피드백 전 / 2차 피드백 전까지의 목표 공유

 컬리추천(홈), 추천페이지 완성하기



#### 클라이언트 - 서버간 커뮤니케이션을 통해 논의해야될 문제들 공유: 

1. 회원생성했을때 아이디 패스워드 일치 

2. 에러났을때 몇시몇분인지 말해주기 

3. api명세서 파일 공유 

4. 상품설명부분 전체이미지로

   







# 개발일지 3일차 (10월 18일)





* 로그인 API 연동 완료
* 로그인 후 마이컬리 화면 완료
* 홈 화면 스크롤 컬렉션뷰 완료



#### 이슈

탭바 아이템을 클릭했을때 전환될 ViewController를 **이미 스토리보드상에서 Segue로 연결한상황**이다. 로그인이 완료되면 로그인 VeiwController를 사용자 프로필을 띄우는 ViewController로 바꾸어야하는데 어떻게....?



#### 해결

UITabBarController도 NavigationController처럼 ViewControllers 라는 화면스택(배열)을 갖는다. 이 부분에 대해서 개념이 없었기 때문에 방법을 몰랐다.

 따라서 해당 TabBarItem에 해당되는 ViewController를 pop해주고, 로그인 후에 띄울 화면을 append해주는 방식을 사용했다.

다만 로그인 화면은 TabBarController가 없는 modal화면이므로, 탭바 컨트롤러에 접근할때는 `self.view.window.rootViewController` 로 접근해주면 된다.

### 로그인 화면

```swift
// 로그인에 성공할시 분기
guard let tabBarController = self.view.window?.rootViewController as? UITabBarController else{return}
tabBarController.viewControllers?.removeLast()
tabBarController.viewControllers?.append(AfterSignInVC)
self.presentingViewController?.dismiss(animated: true, completion: nil)
//로그인 화면은 탭바가 없는 present로 띄워져있으므로 dismiss해준다.
```





# 개발일지 4일차 (10월 19일)



* 회원가입 UI 완료
* 이용약관 UI 완료



#### 메모

실제 앱에서는 회원가입 양식을 작성하다 보면 hidden되었던 view들이 등장하면서 constraint가 동적으로 변한다.

ex) 비밀번호는 10자 이상으로 해주세요. 라벨같은.. 

이걸 기본 회원가입 폼에 있는 View들에 대해 제약들을 다 완성 하고나서 뒤늦게 발견했고, 화면을 스토리보드로 짜놔서 수정하려면 좀 오래걸릴것같다. 일단 나중에 시간이 나면 고치도록 메모@





# 개발일지 5일차 (10월 20일)



### 완료

* 회원가입 API 연동 완료
* kakao 우편번호 서비스 (주소 검색) 완료





### 다음 할일



* 홈 화면 스크롤 컬렉션 뷰 바꾸기 
  * (지금은 직접 구현했는데, 아깝지만 프레임워크를 사용하는게 좋을것같다. 앞으로 들어가야 할 View들도 너무 많아서 ... )

* 카테고리 탭
  * 기본적으로 TableView로 구성되었는데 클릭시 드롭다운되는 기능이 있다.



# 개발일지 6일차 (10월 21일)

### 완료

* 홈화면 컬리추천탭

* 장바구니 UI

### 다음 할일



* 카테고리탭 UI








# 개발일지 7일차 (10월 22일)

### 완료

* 상세정보 보기 탭 UI
* 컬리추천탭 API연동





### 다음 할일

* 카테고리탭 UI




# 개발일지 8일차 (10월 23일)

* 카테고리탭 UI 완성
* 컬리추천탭 하단 view 완성



# 개발일지 9일차 (10월 24일)

* 마이컬리 화면 완성 및 API연동완료



# 개발일지 11일차 (10월 25일)

* 디테일 페이지 UI완성 및 API연동 완료





# 개발일지 12일차 (10월 26일)

* 장바구니 추가, 삭제 / UI 및 API연동 완료

  



# 개발일지 13일차 (10월 27일)

* 결제화면 UI 및 API 연동 완료

















### etc(메모)





코드로 custom cell class를 생성하면 init을 생성해야한다. (+ required init)

https://shark-sea.kr/entry/iOS-TableView-Code%EB%A1%9C-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0

```swift
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setConstraint()

}

    

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")

}

///////////// CustomView인 경우의 init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
```



### Custom Cell 을 tableView에 등록하기

```swift
tableView.register(CategoryListTableViewCell.self , forCellReuseIdentifier: "categoryListCell")

```









#### required init

https://hururuek-chapchap.tistory.com/178





### Device의 해상도(메인 화면 높이, 너비)

```swift
alertImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width ),
            alertImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
```





### button 함수지정 AddTarget

```swift
        button.addTarget(self, action: #selector(printLog(_:)), for: .touchUpInside)
        button.tag = 1123434
```







### Label Text에 취소선 긋기



#### Extension String

```swift
extension String { // 취소선 긋기
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString }
    
}
```





```swift
breakLabel.attributedText = "13,500원".strikeThrough()
```



### UIButton.addTarget 이벤트를 감지 못할때. (TableViewCell 의 버튼일때)

https://hururuek-chapchap.tistory.com/165



Test3test33



### API

Failure인 경우 `print(error.localizedDescription)` 

보다 `print(String(describing: error))`를 봐라 무조건!!@

    print(error.localizedDescription)
    print(String(describing: error))

```swift
                switch response.result {
                case .success(let response):
                    // 성공했을 때
                    
                    if response.isSuccess {
                        print("success")

                        delegate.didSuccessSignIn(response.result)
                    }
                    // 실패했을 때
                    else {
                        print("fail")
                        switch response.code {
                        case 2000: delegate.failedToRequest(message: "JWT 토큰 인증 실패")
                        case 2016: delegate.failedToRequest(message: "User ID 에러")

                        case 2012: delegate.failedToRequest(message: "User ID 에러")

                        case 4000: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")

                        default: delegate.failedToRequest(message: "잠시 후 다시 시도해주세요")
                        }
                    }
                case .failure(let error):
                    print("##### DESCRIPTION")
                    print(error.localizedDescription)
                    print(String(describing: error))
                    delegate.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
```









## 잘못구현한것

장바구니에 담으면 dissmiss 한 후에 AlertView가 등장해야하는데 순서를 거꾸로했음.

