//
//  ConvertDate.swift
//  UHDoctor
//
//  Created by Nazar on 30/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import SwiftUI


class CDate {
//    static func current() -> Date {
//        return Date()
//    }
//    // return number of days from give date till todays
//    static func difDays(datetime: Date) -> Int {
//        let calendar = Calendar.current
//        let birth = calendar.startOfDay(for: datetime)
//        let now = calendar.startOfDay(for: Date())
//        let components = calendar.dateComponents([.day], from: birth, to: now)
//
//        return components.day!
//    }
//    // return number of minutes from given time till now
//    static func difMinutes(datetime: Date) -> Int {
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.minute], from: datetime, to: Date())
//
//        return components.minute!
//    }
//    // return formated string of time passed
//    static func showTimeFrom(datetime: Date) -> String {
//        let minutes = difMinutes(datetime: datetime)
//        return showTimeFormated(minutes: minutes)
//    }
//    // return string of time from given number of minutes
//    static func showTimeFormated(minutes: Int) -> String {
//        let hour = minutes / 60
//        let minute = minutes % 60
//        let minutez = minute < 10 ? "0" : ""
//        let hourz = hour < 10 ? "0" : ""
//        return hourz + String(hour) + ":" + minutez + String(minute)
//    }
//
//    static func showTime(datetime: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//
//        return "\(dateFormatter.string(from: datetime))"
//    }
    
    static func showDate(datetime: Date, format: dateFS = .date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue

        return "\(dateFormatter.string(from: datetime))"
    }
    
    static func getDays(datetime: Date) -> Int{
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: datetime)
        let now = calendar.startOfDay(for: Date())
        let components = calendar.dateComponents([.day], from: start, to: now)

        return components.day!
    }
    
    static func getYears(datetime: Date) -> Int{
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: datetime, to: Date())

        return components.year!
    }
    
    static func shiftDays(datetime: Date, days: Int) -> Date{
        return Calendar.current.date(byAdding: .day, value: days, to: datetime)!
    }
    
    static func getDay(datetime: Date) -> Int{
        return Calendar.current.component(.day, from: datetime)
    }
}


enum dateFS: String {
    case time = "HH:mm"
    case datetime = "E, MMM d, HH:mm"
    case shortdate = "MMM d"
    case date = "E, MMM d"
    case longdate = "YYYY MMM d"
}
