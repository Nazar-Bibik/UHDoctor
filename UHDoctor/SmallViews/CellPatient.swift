//
//  CellPatient.swift
//  UHDoctor
//
//  Created by Nazar on 29/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct CellPatient: View {
   @State var patient: Patient
    
    var body: some View {
        VStack {
            HStack {
                Text(self.patient.name)
                Spacer()
                patient.appointments.allObjects.count != 0 ? Image(systemName: "questionmark.circle.fill").colorInvert().colorMultiply(Color.red) : Image(systemName: "questionmark.circle.fill").colorInvert().colorMultiply(Color.gray)
                patient.appointments.allObjects.count != 0 ? Image(systemName: "exclamationmark.circle.fill").colorInvert().colorMultiply(Color.red) : Image(systemName: "exclamationmark.circle.fill").colorInvert().colorMultiply(Color.gray)
            }
            HStack {
                Text(self.patient.surname)
                Spacer()
                Text("Age" + String(CDate.getYears(datetime: patient.birthdate)))
            }
            }.padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("cBW"), Color("cC")]), startPoint: .trailing, endPoint: .leading))
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .clipped()
            .shadow(color: Color("cS"), radius: 2, x: 0, y: 4)
    }
}

struct CellPatient_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CellPatient(patient: Patient())
            CellPatient(patient: Patient())
            CellPatient(patient: Patient())
            CellPatient(patient: Patient())
            CellPatient(patient: Patient())
            }.previewLayout(.fixed(width: 300, height: 150)).padding()
            
    }
}


