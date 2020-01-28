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
    for _ in 0..<100{
        let data = datapop()
        let new = Patient(context: context)
        new.address = data.address
        new.birthdate = data.birthdate
        new.blood = data.blood!
        new.createdAt = data.createdAt
        new.gender = data.gender!
        new.name = data.name!
        new.phone = data.phone
        new.surname = data.surname!
        
        for _ in 0..<10{
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
    
    let data = datapop3()
    
    for item in data.name{
        let new = Note(context: context)
        new.name = item
        
        do {
            try context.save()
        } catch  {
            print("Error while seeding, \(error)")
        }
    }

}





public struct datapop{
    let name = ["Milford", "Victoria", "Charmaine", "Quinton", "Dee", "Samuel", "Sonny", "Evan", "Kathy", "Fern", "Jannie", "Brenda", "Chas", "Danial", "Dena", "Clarice", "Claudine", "James", "Colleen", "Clarissa", "Bernadette", "Melvin", "Neville", "Stuart", "Marisa"].randomElement()
    let surname = ["Gill", "Bruce", "Valentine", "Coleman", "Bowman", "Barr", "Snow", "Yoder", "Sloan", "Hull", "Olson", "Blankenship", "Rosario", "Kelly", "Serrano", "Gardner", "Parsons", "Barrett", "Zuniga", "Vaughn", "Baxter", "Jimenez", "Mooney", "Howard", "Morales"].randomElement()
    let phone = "+32323232"
    let gender = [true, false].randomElement()
    let createdAt = Calendar.current.date(byAdding: .day, value: Int.random(in: -800 ..< -10), to: Date())!
    let blood = ["AB-", "AB+", "O+", "A+", "A-", "O-", "B+", "B-"].randomElement()
    let birthdate = Calendar.current.date(byAdding: .year, value: Int.random(in: -80 ..< -1), to: Date())!
    let address = "Somewhere 79"
}

public struct datapop2{
//    var datetime = Date() + [-240000, 12000, 120000, 1200000, 53453453, 12557645, 12334656765, 12334654, 123246476, 98463547].randomElement()!
    let datetime = Calendar.current.date(byAdding: .day, value: Int.random(in: -182..<182), to: Date())!
    let note = ["None", "maybe", "a long note to check if all the letters will sure fit intot the note text field becuase I can type a lot while typing slowly yes", "mayb some more text to sure pic the random text to chekc the field", "why not to write more time to waste becuase I dont have enough time"].randomElement()
    let type = ["None", "Type one", "Type two", "Typw three", "Found you"].randomElement()
}

public struct datapop3{
    let name = ["Important", "Urgent", "Patient ...", "ToDo list"]
}
