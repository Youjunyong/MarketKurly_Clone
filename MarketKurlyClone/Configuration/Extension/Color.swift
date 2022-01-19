//
//  Color.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/16.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
//    class var mainOrange: UIColor { UIColor(hex: 0xF5663F) }
    class var mainPurple: UIColor { UIColor(hex: 0x5E027F)}
}
extension UIColor {
    
    @nonobjc class var kurlyBlack: UIColor {
        return UIColor(white: 0.0, alpha: 1.0)
    }
    
    @nonobjc class var kurlyTextGray: UIColor {
        return UIColor(red: 152.0 / 255.0, green: 153.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var kurlyPurple: UIColor {
        return UIColor(red: 103.0 / 255.0, green: 14.0 / 255.0, blue: 134.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var kurlyClearPurple: UIColor {
        return UIColor(red: 111.0 / 255.0, green: 3.0 / 255.0, blue: 178.0 / 255.0, alpha: 0.5)
    }
    
    @nonobjc class var kurlyOrange: UIColor {
        return UIColor(red: 249.0 / 255.0, green: 98.0 / 255.0, blue: 47.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var kurlyLightGray: UIColor {
        return UIColor(white: 242.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var kurlyBackgroundGray: UIColor {
        return UIColor(red: 246.0 / 255.0, green: 247.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var kurlyDarkGray: UIColor {
        return UIColor(white: 102.0 / 255.0, alpha: 1.0)
      }
    
    @nonobjc class var kurlyBorderColor: UIColor {
        return UIColor(red: 220.0 / 255.0, green: 221.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0)
      }
    
    
}
