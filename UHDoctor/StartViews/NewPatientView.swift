//
//  NewPatientView.swift
//  UHDoctor
//
//  Created by Nazar on 29/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct NewPatientView: View {
    @State var newType: Int = 0
    @State var newTypo: String = "oppopop"
    @State var fp = FormP()
    
    init(){
        //        UITableView.appearance().backgroundColor = UIColor.blue
//        UITableViewCell.appearance().backgroundColor = UIColor.clear
        //        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
//        NavigationView {
            ZStack {
//                LinearGradient(gradient: Gradient(colors: [Color("cGT"), Color("cGB")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.top, .leading, .trailing])
                Color("cGB").edgesIgnoringSafeArea([.leading, .trailing])
                VStack{
                    withAnimation{
                        Picker(selection: $newType, label: Text("Type")) {
                            Text("Appointment").tag(0)
                            Text("Patient").tag(1)
                            Text("Note").tag(2)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    if newType == 0 {
                        FormAppointmentView()
                    } else if newType == 1{
                        FormPatientView()
                    } else {
                        FormNoteView()
                    }
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                .onAppear(){
                    UITableViewCell.appearance().backgroundColor = UIColor.init(named: "cBW")
                    UITableView.appearance().backgroundColor = .clear
                }
            }
//        }
    }
}

struct NewPatientView_Previews: PreviewProvider {
    static var previews: some View {
        NewPatientView()
    }
}


class FormP{
    @Published var name: String = ""
}
