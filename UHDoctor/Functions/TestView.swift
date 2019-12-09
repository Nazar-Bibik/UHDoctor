//
//  TestView.swift
//  UHDoctor
//
//  Created by Nazar on 30/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            VStack{
                Circle().frame(width: 150, height: 150).foregroundColor(Color.blue)
            }.padding().background(Color.red)
            HStack{
                VStack{
                    Text("This is a test view")
                    Text("Nothing in here")
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
