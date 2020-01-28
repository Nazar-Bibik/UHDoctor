//
//  Appointments.swift
//  UHDoctor
//
//  Created by Nazar on 30/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


class Appointments: ObservableObject{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var appointments: [Appointment] = []
    @Published var grouped: [[Appointment]] = []
    
    init() {
        getall()
    }
    
    func getall() {
        do {
            appointments = try context.fetch(Appointment.getAll())
        } catch {
            print("Error while fetching all appointments, \(error)")
        }
        
        if appointments.count != 0 {
            grouped = []
            var day = CDate.getDay(datetime: appointments.first!.datetime)
            var group: [Appointment] = []
            for single in appointments {
                if day != CDate.getDay(datetime: single.datetime){
                    grouped.append(group)
                    group = []
                    day = CDate.getDay(datetime: single.datetime)
                }
                group.append(single)
            }
            grouped.append(group)
        }
    }
    
    func saveContext() {
           if context.hasChanges{
               do {
                   try context.save()
                   getall()
               } catch {
                   print("Error while saving appointments, \(error)")
               }
           }
       }
    
    func add(datetime: Date?, patient: Patient?, type: String, note: String) -> Bool {
        if (datetime != nil && patient != nil)
        {
            let new = Appointment(context: context)
            new.datetime = datetime!
            new.patient = patient!
            new.type = type
            new.note = note
            
            saveContext()
            
            return true
        }
        return false
    }
    
    func delete(item: Appointment) {
        context.delete(item)
        saveContext()
    }
    
    func getList(firstDay: Date, range: Int) -> [[Appointment]] {
        let lastDay = CDate.shiftDays(datetime: firstDay, days: range)
        return grouped.filter { $0.first!.datetime > firstDay && $0.first!.datetime < lastDay }
    }
    
    func graphActivity(range: Int) -> [Int]{
        let group = getList(firstDay: Date(), range: range).flatMap { $0.map {$0.datetime} }
        var days:[Int] = []
        for i in 0 ..< 30{
            days.append(group.filter { Calendar.current.compare(CDate.shiftDays(datetime: Date(), days: i), to: $0, toGranularity: .day) == .orderedSame }.count)
        }
        return days
    }
    
//    func getList(firstDay: Date, range: Int) -> [[Appointment]] {
//        var ordered: [[Appointment]] = []
//        var fetched: [Appointment] = []
//
//        do {
//            fetched = try context.fetch(Appointment.getRange(startdate: firstDay, range: range))
//        } catch {
//            print("Error while fetching nearest appointments, \(error)")
//        }
//        if fetched.count == 0{
//            return []
//        }
//
//        var day = CDate.getDay(datetime: fetched.first!.datetime)
//        var group: [Appointment] = []
//        for single in fetched {
//            if day != CDate.getDay(datetime: single.datetime){
//                ordered.append(group)
//                group = []
//                day = CDate.getDay(datetime: single.datetime)
//            }
//            group.append(single)
//        }
//        ordered.append(group)
//
//        return ordered
//    }
    
}
