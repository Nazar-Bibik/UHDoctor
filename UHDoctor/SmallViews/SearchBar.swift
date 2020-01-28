//
//  SearchBar.swift
//  UHDoctor
//
//  Created by Nazar on 11/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var defaultText: String = "Search"
    
    var body: some View {
        HStack{
            ZStack{
                if text == ""{
                    withAnimation{
                        Image(systemName: "magnifyingglass").transition(.opacity)
                    }
                } else {
                    Button(action: {self.text = ""}) {
                        withAnimation{
                        Image(systemName: "multiply.circle").transition(.opacity)
                        }
                    }
                }
            }

            TextField(defaultText, text: $text).disableAutocorrection(true)
            
        }.padding([.top, .bottom], 6).padding([.leading, .trailing], 10).background(Color(UIColor.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
