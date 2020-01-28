//
//  FormAppointmentView.swift
//  UHDoctor
//
//  Created by Nazar on 11/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct FormAppointmentView: View {
    @State var datetime: Date = Date()
    @State var patient: Patient? = nil
    @State var type: String = ""
    @State var notes: String = ""
    
    @State var searchLine: String = ""
    
    @EnvironmentObject var patients: Patients
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("cGB").edgesIgnoringSafeArea([.top, .trailing, .leading])
            Form{
                DatePicker(selection: $datetime, in: Date()..., displayedComponents: .date, label: { Text("Appointment time") })
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
                TextField("Type of appointment", text: $type)
                TextField("Additional notes", text: $notes)
                .lineLimit(5)
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
            }
        }
    }
}

struct FormAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        FormAppointmentView()
    }
}
