//
//  AutoCalculation.swift
//  UHDoctor
//
//  Created by Nazar on 27/01/2020.
//  Copyright © 2020 N Personal Team. All rights reserved.
//

import Foundation
import CoreData


class AutoCalculation {
    static func CalculateGraphs(patients: Patients, appointments: Appointments){
        var averageleft = graph1(data: appointments, range: -14)
        let averageright = graph1(data: appointments, range: 14)
        var average = Int(( Double(averageright.reduce(0,+))/Double(averageright.count) / Double(averageleft.reduce(0,+))/Double(averageleft.count)) * 100)
        UserDefaults.standard.set(average, forKey: "G10")
        UserDefaults.standard.set(graph1(data: appointments, range: 7), forKey: "G11")
        UserDefaults.standard.set(graph1(data: appointments, range: 30), forKey: "G12")
        UserDefaults.standard.set(graph1(data: appointments, range: 90), forKey: "G13")
        
        averageleft = graph1(data: appointments, range: -7)
        average =  averageleft.reduce(0,+)
        UserDefaults.standard.set(average, forKey: "G20")
        UserDefaults.standard.set(graph1(data: appointments, range: 7), forKey: "G21")
        UserDefaults.standard.set(graph1(data: appointments, range: 14), forKey: "G22")
        UserDefaults.standard.set(graph1(data: appointments, range: 30), forKey: "G23")
        
        UserDefaults.standard.set(24, forKey: "G30")
        UserDefaults.standard.set(patients.graphAges(), forKey: "G31")
        UserDefaults.standard.set(patients.graphAge(), forKey: "G32")
        UserDefaults.standard.set(patients.graphBlood(), forKey: "G33")
    }
    
    static func graph1(data: Appointments, range: Int) -> [Int]{
        data.graphActivity(range: range)
    }
}

