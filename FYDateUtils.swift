//
//  FYDateUtils.swift
//  FeiyvProject
//
//  Created by ifeiyv on 2021/3/29.
//

import Foundation

var dateFormatter:DateFormatter?

struct FYDateUtils{
    
    //今天
    static func transformToday() -> String{
        return transform(with: Date())
    }
    
    //根据时间戳返回
    static func transformTimeStamp(with timeStamp:TimeInterval ) -> String{
        return transform(with:Date.init(timeIntervalSince1970: timeStamp))
    }

    //根据日期返回
    static func transform(with date:Date) -> String{
        if dateFormatter == nil {
            dateFormatter = DateFormatter()
        }
        dateFormatter?.dateFormat = "YYYY"
        let yearStr = dateFormatter?.string(from: date) ?? "0"
        let formatterYear = yearTransform(with: yearStr)
        
        dateFormatter?.dateFormat = "M"
        let monthStr = dateFormatter?.string(from: date) ?? "0"
        let formatterMonth = yearTransform(with: monthStr)
        
        dateFormatter?.dateFormat = "d"
        let dayStr = dateFormatter?.string(from: date) ?? "0"
        let formatterDay = dayTransform(with: dayStr)
        
        return "\(formatterYear)年\(formatterMonth)月\(formatterDay)日"
    }
    
    
    private static func yearTransform(with year:String)-> String{
        let dic = ["0":"零","1":"一","2":"二","3":"三","4":"四","5":"五","6":"六","7":"七","8":"八","9":"九"];
        var yearString:String = ""

        for singleChar in year {
            yearString = yearString + (dic["\(singleChar)"] ?? "0")
        }
        return yearString
    }
    
    
    private static func monthTransform(with month:String)-> String{
        let dic = ["1":"一","2":"二","3":"三","4":"四","5":"五","6":"六","7":"七","8":"八","9":"九","10":"十","11":"十一","12":"十二"];
        return dic[month] ?? ""
    }
    
    
    private static func dayTransform(with day:String)-> String{
        let dic = ["1":"一","2":"二","3":"三","4":"四","5":"五","6":"六","7":"七","8":"八","9":"九"];
        
        if day.count == 0 {
            return ""
        }
        if day.count == 1 {
            return dic[day] ?? ""
        }
        
        let firstNumber = Int("\(day.first!)")
        
        
        var dayString:String = ""
        
        if  firstNumber == 1{
            dayString = "十"
        }else if firstNumber == 2{
            dayString = "廿"
        }else{
            dayString = "三"
        }
        return "\(dayString)\(dic["\(day.last!)"] ?? "")"
    }
   
}
