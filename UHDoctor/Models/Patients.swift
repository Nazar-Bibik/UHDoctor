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
    
    func sort(text: String) -> [Patient]{
        return patients.filter { $0.surname.lowercased().contains(text.lowercased()) ||  $0.name.lowercased().contains(text.lowercased()) || $0.identification.contains(text)}
    }
    
    func graphAge() -> [(String, Int)]{
        var ages: [Int : Int] = [:]
        for patient in patients{
            let age = CDate.getYears(datetime: patient.birthdate)
            if ages[age] != nil{
                ages[age]! += 1
            } else {
                ages[age] = 1
            }
        }
        return ages.sorted(by: { $0 < $1 }).map{ (String($0.key), $0.value) }
    }
    
    func graphBlood() -> [(String, Int)]{
        var bloods: [String : Int] = ["AB-" : 0, "AB+": 0, "O+": 0, "A+": 0, "A-": 0, "O-": 0, "B+": 0, "B-": 0]
        for patient in patients{
            bloods[patient.blood]! += 1
        }
        return bloods.map{ ($0.key, $0.value) }
    }
    
    func graphAges() -> [(String, Int)]{
        [("0-10", 8), ("10-20", 1), ("20-30", 4), ("30-40", 7), ("40-50", 3), ("50-60", 2), ("60-70", 2), ("70-80", 0), ("80-90", 0), ("90-100", 1), ("100 >", 0)]
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
