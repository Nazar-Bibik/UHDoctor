//
//  NewPatientView.swift
//  UHDoctor
//
//  Created by Nazar on 10/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct FormPatientView: View {
    @State var name: String = ""
    @State var surname: String = ""
    @State var gender: Int = -1
    @State var birthdate: Date = Date()
    @State var blood: String = ""
    @State var phone: String = ""
    @State var address: String = ""
    @State var identification: String = ""
    
    var body: some View {
        Form {
            TextField("Patient's Name", text: $name).disableAutocorrection(true)
            TextField("Patient's Surname", text: $surname).disableAutocorrection(true)
            Picker(selection: $gender, label: Text("Gender")) {
                Text("Male").tag(1)
                Text("Female").tag(0)
            }.pickerStyle(SegmentedPickerStyle())
            DatePicker(selection: $birthdate, in: ...Date(), displayedComponents: .date, label: { Text("Birth date") })
            VStack{
                Picker(selection: $blood, label: Text("Blood type")) {
                    ForEach(["AB+", "A+", "B+", "O+"], id: \.self) { blood in
                        Text(blood)
                            .tag(blood)
                    }
                    Text("None").tag("")
                }.pickerStyle(SegmentedPickerStyle())
                Picker(selection: $blood, label: Text("Blood type")) {
                    ForEach(["AB-", "A-", "B-", "O-"], id: \.self) { blood in
                        Text(blood)
                            .tag(blood)
                    }
                    Text("None").tag("")
                }.pickerStyle(SegmentedPickerStyle())
            }
            TextField("Phone number", text: $phone).font(.system(.body, design: .monospaced))
            TextField("Address", text: $address).disableAutocorrection(true)
            TextField("Identification number", text: $identification).disableAutocorrection(true)
            Section{
                Button(action: {}) {
                    Text("Save new patient")
                }
            }
            Section{
                Button(action: {self.name = ""; self.surname = ""; self.gender = -1; self.birthdate = Date(); self.blood = ""; self.phone = ""; self.address = ""; self.identification = "";}) {
                    Text("Clean all fields")
                }.foregroundColor(.red)
            }
        }
    }
}

struct FormPatientView_Previews: PreviewProvider {
    static var previews: some View {
        FormPatientView()
    }
}
