//
//  CellAppointment.swift
//  UHDoctor
//
//  Created by Nazar on 30/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct CellAppointment: View {
    @State var appointment: Appointment
    
    var body: some View {
        VStack {
            HStack {
    //            Spacer()
                Text(self.appointment.patient.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(self.appointment.patient.surname)
                    .font(.headline)
                    .lineLimit(1)
                Spacer()
                if CDate.getDays(datetime: appointment.datetime) > -7 {Image(systemName: "exclamationmark.circle.fill").colorInvert().colorMultiply(Color.red)}
    //                : Image(systemName: "exclamationmark.circle.fill").colorInvert().colorMultiply(Color.gray)
                Text(CDate.showDate(datetime: appointment.datetime, format: .time))
            }
            HStack {
                if appointment.type != ""{
                    Text(appointment.type)
                    .fontWeight(.light)
        //                .font(.system(.subheadline, design: .monospaced).monospacedDigit())
                }
                Spacer()
                Text(CDate.showDate(datetime: appointment.datetime, format: .shortdate))
            }
        }.padding(8)
            .background(Color("cBW"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .clipped()
        .shadow(color: Color("cS"), radius: 1, x: 0, y: 1)
    }
}

//struct CellAppointment_Previews: PreviewProvider {
//    static var previews: some View {
//        CellAppointment(appointment: Appointment())
//    }
//}
