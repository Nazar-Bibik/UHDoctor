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
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("cGT"), Color("cGB")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea([.top, .leading, .trailing])
                ScrollView(.vertical){
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 32){
                            LineChartView(data: [6, 6, 78, 2, 55, 9, 45], title: "Llllll", legend: "Lllllll", dropShadow: false).disabled(true)
                            
                            
                            LineChartView(data: [6, 6, 78, 2, 55, 9, 45], title: "Llllll", legend: "Lllllll", dropShadow: false).disabled(true)
                            LineChartView(data: [6, 6, 78, 2, 55, 9, 45], title: "Llllll", legend: "Lllllll", dropShadow: false).disabled(true)
                            
                        }.padding().clipped().shadow(color: Color("cS"), radius: 5, x: 0, y: 5)
                    }.listRowInsets(EdgeInsets())
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 32){
                            LineChartView(data: [6, 6, 78, 2, 55, 9, 45], title: "Llllll", legend: "Lllllll", dropShadow: false).disabled(true)
                            
                            
                            LineChartView(data: [6, 6, 78, 2, 55, 9, 45], title: "Llllll", legend: "Lllllll", dropShadow: false).disabled(true)
                            LineChartView(data: [6, 6, 78, 2, 55, 9, 45], title: "Llllll", legend: "Lllllll", dropShadow: false).disabled(true)
                            
                        }.padding().clipped().shadow(color: Color("cS"), radius: 5, x: 0, y: 5)
                    }.listRowInsets(EdgeInsets())
                }
                .listRowInsets(EdgeInsets())
                .navigationBarTitle("Graphics and notes")
                .navigationBarHidden(false)
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
