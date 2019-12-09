//
//  Patients.swift
//  UHDoctor
//
//  Created by Nazar on 30/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


class Patients: ObservableObject{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var patients: [Patient] = []
    
    init() {
        getall()
    }
    
    func getall() {
        do {
            patients = try context.fetch(Patient.getAll())
        } catch {
            print("Error while fetching all patients, \(error)")
        }
    }
    
    func saveContext() {
        if context.hasChanges{
            do {
                try context.save()
                getall()
            } catch  {
                print("Error while saving patients, \(error)")
            }
        }
    }
    
    func add(name: String, surname: String, phone: String, gender: Bool?, blood: String, birthdate: Date, address: String, identification: String) -> Bool {
        if (name != "" && surname != "" && gender != nil && birthdate < Date() - 3600)
        {
            let new = Patient(context: context)
            
            new.name = name
            new.surname = surname
            new.birthdate = birthdate
            new.blood = blood
            new.gender = gender!
            new.phone = phone
            new.address = address
            new.identification = identification
            new.createdAt = Date()
            
            saveContext()
            
            return true
        }
        return false
    }
    
    func delete(index: Int) {
        context.delete(self.patients[index])
        saveContext()
    }
    
}

//@NSManaged var name: String
//@NSManaged var surname: String
//@NSManaged var phone: String
//@NSManaged var gender: Bool
//@NSManaged var createdAt: Date
//@NSManaged var blood: String
//@NSManaged var birthdate: Date
//@NSManaged var address: String
//@NSManaged var identification: String
