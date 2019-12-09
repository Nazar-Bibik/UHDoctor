//
//  PatientsList.swift
//  UHDoctor
//
//  Created by Nazar on 27/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct PatientsListView: View {
    @State var delete: Bool = false
    @State var patients = Patients()
    
//    init(){
//        //        UITableView.appearance().backgroundColor = UIColor.blue
//        UITableViewCell.appearance().backgroundColor = UIColor.clear
//        //        UITableView.appearance().tableFooterView = UIView()
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        // ||
        NavigationView{
            ZStack{
                // --
                LinearGradient(gradient: Gradient(colors: [Color("cGT"), Color("cGB")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.top, .leading, .trailing])
                // --
                List {
                    //
                    ForEach(patients.patients, id: \.self) {patient in
                        ZStack{
                            CellPatient(patient: patient)
                            NavigationLink(destination: TestView()) {
                                NavigationLinkHelperView(mimic: .constant(true))
                                }.hidden()
                        }
                    }
                    .onDelete { (indexSet) in
                        print("delete_operation")
                    }
                    //
                }
                .background(Color.clear)
                .navigationBarHidden(delete)
                .navigationBarTitle("Patients", displayMode: .inline)
                .navigationBarItems(leading:
                    Button("Search") {
                        withAnimation{
                            self.delete.toggle()
                        }
                    },
                    trailing: EditButton()
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
        .animation(.linear).transition(.slide)
        .onAppear(){
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear(){
            UITableView.appearance().separatorStyle = .singleLine
        }
        // ||
    }
}

struct PatientsListView_Previews: PreviewProvider {
    static var previews: some View {
        PatientsListView()
    }
}
