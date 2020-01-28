//
//  ListPatientsSmall.swift
//  UHDoctor
//
//  Created by Nazar on 11/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct ListPatientsSmall: View {
    @EnvironmentObject var patients: Patients
    @Binding var selected: Patient?
    @State var searchLine: String = ""
    @State var list: [Patient] = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 0){
            
            HStack{
                SearchBar(text: $searchLine, defaultText: "Name, Surname, ID")
                if searchLine == ""{
                    Button(action: {
                       self.presentationMode.wrappedValue.dismiss()
                   }) {
                       Text("Dismiss")
                   }
                }else{
                    Button(action: {
                        self.list = self.patients.sort(text: self.searchLine)
                    }) {
                        Text("Search")
                    }
                }
            }.padding()
            
            List {
                Button(action: {
                    self.selected = nil
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("None")
                }
                ForEach(list, id: \.self) { item in
                    Button(action: {
                        self.selected = item
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack{
                            Text(item.name)
                            Text(item.surname)
                            Text(String(CDate.getYears(datetime: item.birthdate)))
                        }
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct ListPatientsSmall_Previews: PreviewProvider {
    static var previews: some View {
        ListPatientsSmall( selected: .constant(nil))
    }
}
