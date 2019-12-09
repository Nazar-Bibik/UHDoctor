//
//  ButtonNewPatient.swift
//  UHDoctor
//
//  Created by Nazar on 28/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct ButtonNewPatient: View {
    @Binding var active: Int
    
    var body: some View {
        VStack{
//            Spacer()
            Image(systemName: "plus.circle.fill").resizable().scaledToFit()
            Spacer()
        }.frame(width: 40, height: 98).padding(active == 3 ? 0 : 12).background(Color("cGBT")).clipShape(Capsule()).foregroundColor(Color(active == 3 ? .link : .placeholderText)).animation(.spring())
    }
}

struct ButtonNewPatient_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNewPatient(active: .constant(0)).background(Color.red)
    }
}
