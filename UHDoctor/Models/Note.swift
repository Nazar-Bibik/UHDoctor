//
//  Note.swift
//  UHDoctor
//
//  Created by Nazar on 08/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI


public class Note: NSManagedObject, Identifiable {
    @NSManaged var name: String
    @NSManaged var createdAt: Date
    @NSManaged var note: String
    @NSManaged var searchname: String

    @NSManaged var patient: Patient
}

extension Note {
    static func getAll() -> NSFetchRequest<Note> {
        let request: NSFetchRequest<Note> = Note.fetchRequest() as! NSFetchRequest<Note>
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]

        return request
    }
}

