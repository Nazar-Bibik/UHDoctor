//
//  ContentView.swift
//  UHDoctor
//
//  Created by Nazar on 27/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    init() {
////        UITabBar.appearance().backgroundColor = UIColor.init(named: "cGBT")
////////        UITabBar.appearance().barTintColor = UIColor.white
////////        UITabBar.appearance().shadowImage = UIImage()
////        UITabBar.appearance().backgroundImage = UIImage()
////        UITabBar.appearance().shadowImage = UIImage()
////        UITabBar.appearance().clipsToBounds = true
////        UITabBar.appearance().isTranslucent = true
////        UINavigationBar.appearance().backgroundColor = UIColor.init(named: "cGT")
////        UITabBar.appearance().backgroundColor = UIColor.clear
//    }
    
    @State var tabSelected: Int = 1
    
    var body: some View {
        ZStack{
            // --
//            Color("cGT").edgesIgnoringSafeArea([.top, .leading, .trailing])
            LinearGradient(gradient: Gradient(colors: [Color("cGT"), Color("cGB")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.top, .leading, .trailing])
            // --
            TabView(selection: $tabSelected) {
                PatientsListView()
                    .tag(1)
                    .tabItem {
                        Image(systemName: "person.circle.fill")
//                        Text("Patients")
                }
                GraphicsView()
                    .tag(2)
                    .tabItem {
//                        Image(systemName: "waveform.path.ecg").offset(x: 30)
                        Image(systemName: "rectangle.3.offgrid.fill")
//                        Text("Graphics")
                }
                NewPatientView()
                    .tag(3)
                    .tabItem {
                        EmptyView()
                }
                QuickSearchView()
                    .tag(4)
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle.fill")
//                        Text("Quick Search")
                }
                AppointmentsView()
                    .tag(5)
                    .tabItem {
                        Image(systemName: "tray.fill")
//                         Text("Appointments")
                }
            }
            // --
            VStack{
                Spacer()
                ButtonNewPatient(active: $tabSelected).offset(y: 49)
                    .onTapGesture {
                        self.tabSelected = 3
                }
            }
            // --
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
