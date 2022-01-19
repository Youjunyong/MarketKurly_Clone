//
//  HomeFooterView.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/20.
//

import UIKit
import SnapKit

class HomeFooterView: UIView {
    
    //MARK: - Property

    let introButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "buttonKurlyintro"), for: .normal)
        return btn
    }()

    let termButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "buttonTerms"), for: .normal)
        return btn
    }()

    let privacyButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "buttonPrivacy"), for: .normal)
        return btn
    }()

    let footerTextView : UITextView = {
        let textView = UITextView()
        textView.text = "주식회사 컬리 | 대표자 : 김슬아\n개인정보보호책임자 : 이원준\n사업자등록번호 : 261-81-23567 사업자 정보확인\n통신판매업 : 제 2018-서울강남-01646 호\n주소 : 서울특별시 강남구 도산대로 16길 20, 이래빌딩 B1 ~ 4F"
        let attributedString = NSMutableAttributedString(string: textView.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        textView.attributedText = attributedString

        textView.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        textView.textColor = UIColor.kurlyTextGray
        textView.backgroundColor = .clear
        textView.textAlignment = NSTextAlignment.left
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false

        return textView
    }()

    let footerImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imgFooter")
        return image
    }()

    let instaButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "buttonInsta"), for: .normal)
        return btn
    }()

    let facebookButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "buttonFacebook"), for: .normal)
        return btn
    }()

    let blogButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "btnBlog"), for: .normal)
        return btn
    }()

    let naverButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "buttonNaver"), for: .normal)
        return btn
    }()

    let youtubeButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "buttonYoutube"), for: .normal)
        return btn
    }()

    let snsStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 12.0
        return stackView
    }()


    let footerLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡 @마켓컬리 친구 추가하고 소식과 혜택을 받아보세요."
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .kurlyTextGray


        let attributtedString = NSMutableAttributedString(string: label.text!)
        attributtedString.addAttribute(.foregroundColor, value: UIColor.purple, range: (label.text! as NSString).range(of:"@마켓컬리"))

        label.attributedText = attributtedString

        return label
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        let views = [introButton, termButton, privacyButton, footerTextView, footerImage, footerLabel, snsStackView]

        for view in views{
            addSubview(view)
        }

        snsStackView.addArrangedSubview(instaButton)
        snsStackView.addArrangedSubview(facebookButton)
        snsStackView.addArrangedSubview(blogButton)
        snsStackView.addArrangedSubview(naverButton)
        snsStackView.addArrangedSubview(youtubeButton)


        introButton.snp.makeConstraints { (make) in
            make.top.equalTo(18)
            make.leading.equalTo(7)
        }

        termButton.snp.makeConstraints { (make) in
            make.top.equalTo(18)
            make.leading.equalTo(introButton.snp.trailing).offset(0)
        }

        privacyButton.snp.makeConstraints { (make) in
            make.top.equalTo(18)
            make.leading.equalTo(termButton.snp.trailing).offset(0)
        }

        footerTextView.snp.makeConstraints { (make) in
            make.top.equalTo(introButton.snp.bottom).offset(5)
            make.leading.equalTo(12)
            make.trailing.equalTo(-15)
            make.height.equalTo(100)
        }

        footerImage.snp.makeConstraints { (make) in
            make.top.equalTo(footerTextView.snp.bottom).offset(5)
            make.leading.equalTo(12)
        }

        footerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(footerImage.snp.bottom).offset(15)
            make.leading.equalTo(15)
        }

        snsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(footerLabel.snp.bottom).offset(16)
            make.leading.equalTo(15)
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
