//
//  GraphicsView.swift
//  UHDoctor
//
//  Created by Nazar on 28/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI
import SwiftUICharts


struct GraphicsView: View {
    @EnvironmentObject var appointments: Appointments
    @EnvironmentObject var notes: Notes
    
    var body: some View {
        NavigationView {
            ZStack {
//                LinearGradient(gradient: Gradient(colors: [Color("cGT"), Color("cGB")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.top, .leading, .trailing])
                Color("cGB").edgesIgnoringSafeArea([.leading, .trailing])
                //
                VStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 32){
                            LineChartView(data: UserDefaults.standard.array(forKey: "G11") as! [Double], title: "Appointments", legend: "More hectic: " + String(UserDefaults.standard.integer(forKey: "G10")), dropShadow: false).disabled(true)
                            LineChartView(data: UserDefaults.standard.array(forKey: "G21") as! [Double], title: "Past visits", legend: "Total: " + String(UserDefaults.standard.integer(forKey: "G20")), dropShadow: false).disabled(true)
                            BarChartView(data: ChartData(values: UserDefaults.standard.array(forKey: "G31") as! [(String, Int)]), title: "Patients data", legend: "Age")
                            
                        }.padding().clipped().shadow(color: Color("cS"), radius: 5, x: 0, y: 5)
                    }
                    .listRowInsets(EdgeInsets())
                    .navigationBarHidden(false)
                    .navigationBarTitle("Graphics and notes", displayMode: .inline)
                    VStack{
                        SearchBar(text: .constant(""))
                        List{
                            ForEach(notes.notes){ note in
                                Text(note!.name)
                            }
                        }
                    }.padding().background(Color.white)
                }
            }
        }
    }
}

struct GraphicsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphicsView()
    }
}


//Users by creation date
//Users by prescriptions
//Appointments load
