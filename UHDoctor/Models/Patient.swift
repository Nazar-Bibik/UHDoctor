//
//  Patient.swift
//  UHDoctor
//
//  Created by Nazar on 29/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI


public class Patient: NSManagedObject, Identifiable {
    @NSManaged var name: String
    @NSManaged var surname: String
    @NSManaged var phone: String
    @NSManaged var gender: Bool
    @NSManaged var createdAt: Date
    @NSManaged var blood: String
    @NSManaged var birthdate: Date
    @NSManaged var address: String
    @NSManaged var identification: String

    @NSManaged var appointments: NSSet
    @NSManaged var notes: NSSet
}

extension Patient {
    static func getAll() -> NSFetchRequest<Patient> {
        let request: NSFetchRequest<Patient> = Patient.fetchRequest() as! NSFetchRequest<Patient>
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]

        return request
    }
}

extension Patient{
    func latestAppointment() -> Appointment?{
        return appointments.allObjects.filter{ ($0 as! Appointment).datetime > Date() }.first as? Appointment
    }
    
    func appointmentsCount() -> Int{
        return appointments.allObjects.filter{ ($0 as! Appointment).datetime > Date() }.count
    }
}






//class Patient2{
//    var name = ["John", "Sam", "Nazar", "Michael"].randomElement()
//    var surname = ["Koichi", "Hamburger", "Michawzelli", "Herihhi"].randomElement()
//    var phone = ["+32323232", "+555656565", "+546566767676"].randomElement()
//    var gender = Bool.random()
//    var createdAt = Date() - 2
//    var blood = ["AB", "AB+", "O", "O+", "A", "A+"].randomElement()
//    var birthdate = Date() - 12400
//    var address = ["oioijo", "oijihi", "uygliuh;", "iuhiuh", "oij"].randomElement()
//
//    var appointment = [["O"], []].randomElement()
//    var prescribed = [["O"], []].randomElement()
//}
