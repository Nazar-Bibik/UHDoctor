//
//  File.swift
//  UHDoctor
//
//  Created by Nazar on 30/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import CoreData
import UIKit


 func Populate(context: NSManagedObjectContext) {
    let data = datapop()
    for i in 0..<13{
        let new = Patient(context: context)
        new.address = data.address[i]
        new.birthdate = data.birthdate[i]
        new.blood = data.blood[i]
        new.createdAt = data.createdAt[i]
        new.gender = data.gender[i]
        new.name = data.name[i]
        new.phone = data.phone[i]
        new.surname = data.surname[i]
        
        for _ in 0..<30{
            let dataA = datapop2()
            let newA = Appointment(context: context)
            newA.datetime = dataA.datetime
            newA.note = dataA.note!
            newA.type = dataA.type!
//            new.appointment
            newA.patient = new
            
        }
        
        do {
            try context.save()
        } catch  {
            print("Error while seeding, \(error)")
        }
        
    }
    
    
}





public struct datapop{
    let name = ["John", "Sam", "Heylee", "Michael", "Giorno", "Mike", "Jinji", "Gamura", "Homer", "Bibzi", "Shamune", "Snake", "Vladimir"] //13
    let surname = ["Koichi", "Hamburger", "Michawzelli", "Herihhi", "Darkwood", "Plinsten", "Hommari", "Sounera", "Machudji", "SuiSaishiMari", "Kontasora", "Damond", "Khorisow"]
    let phone = ["+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232", "+32323232"]
    let gender = [true, true, false, true, true, true, false, false, true, false, true, true, true]
    let createdAt = [Date() - 1200000, Date(), Date() - 4000000, Date(), Date(), Date() - 5000000, Date(), Date(), Date() - 10000, Date(), Date(), Date(), Date() - 30000]
    let blood = ["AB", "AB+", "O", "O+", "A", "A+", "AB", "AB+", "O", "O+", "A", "A+", "O"]
    let birthdate = [Date() - 124000000, Date() - 18000000, Date() - 25000000, Date() - 124000000, Date() - 18000000, Date() - 25000000, Date() - 124000000, Date() - 18000000, Date() - 25000000, Date() - 124000000, Date() - 18000000, Date() - 25000000, Date() - 25000000]
    let address = ["Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79", "Somewhere 79"]
}

public struct datapop2{
//    var datetime = Date() + [-240000, 12000, 120000, 1200000, 53453453, 12557645, 12334656765, 12334654, 123246476, 98463547].randomElement()!
    let datetime = Calendar.current.date(byAdding: .day, value: Int.random(in: -182..<182), to: Date())!
    let note = ["None", "maybe", "a long note to check if all the letters will sure fit intot the note text field becuase I can type a lot while typing slowly yes", "mayb some more text to sure pic the random text to chekc the field", "why not to write more time to waste becuase I dont have enough time"].randomElement()
    let type = ["None", "Type one", "Type two", "Typw three", "Found you"].randomElement()
}
