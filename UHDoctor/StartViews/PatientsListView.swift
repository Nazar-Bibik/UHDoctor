//
//  PatientsList.swift
//  UHDoctor
//
//  Created by Nazar on 27/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct PatientsListView: View {
    @State var search: Bool = false
    @State var searchLine: String = ""
    @EnvironmentObject var patients: Patients
    
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
//                LinearGradient(gradient: Gradient(colors: [Color("cGT"), Color("cGB")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.top, .leading, .trailing])
                Color("cGB").edgesIgnoringSafeArea([.leading, .trailing])
                // --
                List {
                    //
                    if search{
                        Divider()
                    }
                    ForEach(patients.patients.filter{$0.name.lowercased().contains(searchLine.lowercased()) || $0.surname.lowercased().contains(searchLine.lowercased()) || searchLine == ""}, id: \.self)
                    {patient in
                        ZStack{
                            CellPatient(patient: patient)
                            NavigationLink(destination: PatientView(patient: patient)) {
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
                .navigationBarHidden(search)
                .navigationBarTitle("Patients", displayMode: .inline)
                .navigationBarItems(leading:
                    Button("Search") {
                        withAnimation{
                            self.search.toggle()
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
                if (search){
                    VStack{
                        HStack{
                            SearchBar(text: $searchLine)
                            Button(action: {self.search.toggle()}) {
                                Text("Cancel")
                            }
                        }.padding(4).background(FrostyOverlay(effect: UIBlurEffect(style: .systemThickMaterial)))
                        Spacer()
                    }
                }
            }
            
        }
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
