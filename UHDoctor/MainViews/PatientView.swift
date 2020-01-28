//
//  PatientView.swift
//  UHDoctor
//
//  Created by Nazar on 27/01/2020.
//  Copyright © 2020 N Personal Team. All rights reserved.
//

import SwiftUI

struct PatientView: View {
    @State var editPatient: Bool = false
    @State var patient: Patient
    @State var editName: String = "INPUT"
    
    var body: some View {
        VStack(alignment: .leading){
            
            if !editPatient{
                VStack{
                    Text("Date of birth: " + CDate.showDate(datetime: patient.birthdate, format: .longdate) )
                    Divider()
                    Text(patient.gender ? "Gender: female" : "Gender: male")
                    Divider()
                    Text("Blood type: " + patient.blood)
                    Divider()
                }
                
                if patient.appointmentsCount() != 0 {
                    HStack{
                        Spacer();Text("Appointments").fontWeight(.bold);Spacer();
                    }
                    NavigationLink(destination: TestView()) {
                        Text("View all ...")
                            .font(.headline)
                    }.padding(7)
                    CellAppointment(appointment: patient.latestAppointment()!)
                }
                Divider()
                
                if patient.notes.allObjects.count != 0 {
                    HStack{
                        Spacer();Text("Notes").fontWeight(.bold);Spacer();
                    }
                    NavigationLink(destination: TestView()) {
                        Text("View all ...")
                            .font(.headline)
                    }.padding(7)

//                    List {
//                        ForEach(patient.notes.allObjects as! [Note], id: \.self) {note in
//                            CellNote(note: note)
//                        }
//                    }
                    CellNote(note: patient.notes.allObjects.first as! Note)
                    Divider()
                }
                
                Text("Contact info:")
                Divider()
            }
            
            if editPatient{
                Form{
                    HStack{
                        Text("Name: ")
                        TextField("INPUT", text: $editName)
                    }
                    HStack{
                        Text("Surname: ")
                        TextField("INPUT", text: $editName)
                    }
                    HStack{
                        Text("Birth Date: ")
                        TextField("INPUT", text: $editName)
                    }
                    HStack{
                        Text("Blood: ")
                        TextField("INPUT", text: $editName)
                    }
                    HStack{
                        Text("Gender: ")
                        TextField("INPUT", text: $editName)
                    }
                    HStack{
                        Text("Phone: ")
                        TextField("INPUT", text: $editName)
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Save")
                    }
                    .padding()
                    
                }.transition(.opacity)
            }
            
        }
        .padding()
        .navigationBarTitle((patient.name + " " + patient.surname), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(editPatient ? "Cancel" : "Edit") {
                withAnimation{
                    self.editPatient.toggle()
                }
            }
        )
    }
}

struct PatientView_Previews: PreviewProvider {
    static let patients = Patients()
    
    static var previews: some View {
        
        PatientView(patient: patients.patients.first!)
    }
}
