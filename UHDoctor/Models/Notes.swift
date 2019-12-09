//
//  Notes.swift
//  UHDoctor
//
//  Created by Nazar on 08/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData


class Notes: ObservableObject{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var notes: [Note] = []
    
    init() {
        getall()
    }
    
    func getall() {
        do {
            notes = try context.fetch(Note.getAll())
        } catch {
            print("Error while fetching all notes, \(error)")
        }
    }
    
    func saveContext() {
        if context.hasChanges{
            do {
                try context.save()
                getall()
            } catch  {
                print("Error while saving notes, \(error)")
            }
        }
    }
    
    func add(name: String, patient: Patient?, note: String) {
        let new = Note(context: context)
            
        new.name = name
        new.note = note
        new.createdAt = Date()
        if patient != nil{
            new.patient = patient!
            new.searchname = patient!.name + " " + patient!.surname
        }
            
        saveContext()
    }
    
    func delete(index: Int) {
        context.delete(self.notes[index])
        saveContext()
    }
    
}
