//
//  Timer.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/24.
//

import Foundation

class CountDown{
    
    static let shared = CountDown()
    let endTime = "00:00:00"
    private init(){
    }
    
    var sec = ""
    var min = ""
    var hour = ""
    
    func getNowTime() -> String{
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: now)
    }
    
    func count()-> [String] {
        
        let now = self.getNowTime().split(separator: ":")
        hour = "\(now[0])"
        min = "\(now[1])"
        sec = "\(now[2])"
        
        return [hour, min, sec]
    }
}
