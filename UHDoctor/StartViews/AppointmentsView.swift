//
//  AppointmentsView.swift
//  UHDoctor
//
//  Created by Nazar on 28/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import SwiftUI

struct AppointmentsView: View {
    @State var appointments = Appointments()
    @State var daysRange: Int = 30
    @State var startDate = Date()
    
    var body: some View {
            // ||
        NavigationView{
            ZStack{
                // --
                LinearGradient(gradient: Gradient(colors: [Color("cGT"), Color("cGB")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.top, .leading, .trailing])
                // --
                List {
                    //
//                    ForEach (appointments.appointments) { appointment in
//                        Section(header: Button(action: {}) {
//                            Text("Button")
//                        }, footer: Text("L")) {
//                            ZStack{
//                                CellAppointment(appointment: appointment)
//                                NavigationLink(destination: TestView()) {
//                                    NavigationLinkHelperView(mimic: .constant(true))
//                                }.hidden()
//                            }
//                        }
//                    }
                    //
                    ForEach (appointments.getList(firstDay: self.startDate, range: daysRange), id: \.self) { group in
                        Section(header: Text(CDate.showDate(datetime: group.first!.datetime, format: .shortdate)), footer: EmptyView()){
                            ForEach(group, id: \.self) {appointment in
                                ZStack{
                                    CellAppointment(appointment: appointment)
                                    NavigationLink(destination: TestView()) {
                                        NavigationLinkHelperView(mimic: .constant(true))
                                    }.hidden()
                                }
                            }
                        }
                    }
                    //
                }
                .listStyle(GroupedListStyle())
                .background(Color.clear)
                .navigationBarHidden(false)
                .navigationBarTitle("Appointments", displayMode: .inline)
                    .navigationBarItems(leading:
                        HStack{
                            Button(action: {self.startDate = CDate.shiftDays(datetime: self.startDate, days: -7)}) {
                                HStack(spacing: 0){
                                    Image(systemName: "chevron.left.2")
                                    Image(systemName: "arrow.left")
                                }.font(.headline)
                            }
                            Button(action: {self.startDate = CDate.shiftDays(datetime: self.startDate, days: -1)}) {
                                HStack(spacing: 0){
                                    Image(systemName: "chevron.left")
                                    Image(systemName: "arrow.left")
                                }.font(.headline)
                            }
                        },
                                        trailing:
                        HStack{
                            Button(action: {self.startDate = CDate.shiftDays(datetime: self.startDate, days: 1)}) {
                                HStack(spacing: 2){
                                    Image(systemName: "arrow.right")
                                    Image(systemName: "chevron.right")
                                }.font(.headline)
                            }
                            Button(action: {self.startDate = CDate.shiftDays(datetime: self.startDate, days: 7)}) {
                                HStack(spacing: 2){
                                    Image(systemName: "arrow.right")
                                    Image(systemName: "chevron.right.2")
                                }.font(.headline)
                            }
                        }
                    )
                .onAppear(){
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                    UITableView.appearance().backgroundColor = .clear
                }
                .onDisappear(){
                    UITableViewCell.appearance().backgroundColor = nil
                    UITableView.appearance().backgroundColor = nil
                }
                // --
            }
            
        }
        .animation(.linear)
        .onAppear(){
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear(){
            UITableView.appearance().separatorStyle = .singleLine
        }
        // ||
        
    }
}

struct AppointmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsView()
    }
}
