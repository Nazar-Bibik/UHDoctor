//
//  CellNote.swift
//  UHDoctor
//
//  Created by Nazar on 27/01/2020.
//  Copyright © 2020 N Personal Team. All rights reserved.
//

import SwiftUI
import Foundation

struct CellNote: View {
    @State var note: Note
    
    var body: some View {
        VStack{
            
            Text(note.name)
            HStack{
                Text(note.note)
                .lineLimit(nil)
                .frame(minWidth: 10, maxWidth: .infinity, alignment: .leading)
            }
            if note.patient != nil{
                Divider()
                HStack{
                    Text(note.patient!.name)
                    Text(note.patient!.surname)
                    Text(String(CDate.getYears(datetime: note.patient!.birthdate)))
                }
            }
            
        }
    .padding(8)
    .background(Color("cBW"))
    .clipShape(RoundedRectangle(cornerRadius: 4))
    .clipped()
        
    }
}

//struct CellNote_Previews: PreviewProvider {
//    static var previews: some View {
//        CellNote()
//    }
//}
