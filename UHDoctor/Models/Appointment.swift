//
//  Appointment.swift
//  UHDoctor
//
//  Created by Nazar on 30/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI


public class Appointment: NSManagedObject, Identifiable{
    @NSManaged var datetime: Date
    @NSManaged var type: String
    @NSManaged var note: String
    @NSManaged var patient: Patient
}

extension Appointment {
    static func getAll() -> NSFetchRequest<Appointment> {
        let request: NSFetchRequest<Appointment> = Appointment.fetchRequest() as! NSFetchRequest<Appointment>
        request.sortDescriptors = [NSSortDescriptor(key: "datetime", ascending: true)]

        return request
    }
    
    static func getRange(startdate: Date, range: Int) -> NSFetchRequest<Appointment> {
        let enddate = CDate.shiftDays(datetime: startdate, days: range)
        let request: NSFetchRequest<Appointment> = Appointment.fetchRequest() as! NSFetchRequest<Appointment>
        request.sortDescriptors = [NSSortDescriptor(key: "datetime", ascending: true)]
        request.predicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "datetime < %@", enddate as NSDate), NSPredicate(format: "datetime > %@", startdate as NSDate)])
            
        return request
    }
}
