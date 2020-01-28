//
//  FormNoteView.swift
//  UHDoctor
//
//  Created by Nazar on 11/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct FormNoteView: View {
    @State var patient: Patient? = nil
    @EnvironmentObject var notes: Notes
    @State var name: String = ""
    @State var note: String = ""
    
    var body: some View {
        NavigationView {
            ZStack{
            Color("cGB").edgesIgnoringSafeArea([.top, .trailing, .leading])
            Form {
                TextField("Patient's Name", text: $name)
                TextField("Patient's Surname", text: $note)
                NavigationLink(destination: ListPatientsSmall(selected: $patient)) {
                    if patient == nil{
                        Text("Select patient")
                    } else {
                        HStack{
                        Text(patient!.name)
                        Text(patient!.surname)
                        }
                    }
                }
                Section{
                    Button(action: {
                        self.notes.add(name: self.name, patient: self.patient, note: self.note)
                    }) {
                        Text("Save new note")
                    }
                }
            }
                .navigationBarHidden(true)
                .navigationBarTitle("")
            }
        }
    }
}

struct FormNoteView_Previews: PreviewProvider {
    static var previews: some View {
        FormNoteView()
    }
}
