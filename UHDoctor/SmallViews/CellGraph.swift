//
//  CellGraph.swift
//  UHDoctor
//
//  Created by Nazar on 29/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct CellGraph: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ScrollView(.horizontal) {
            

                LineView(data: [6, 6, 78, 2, 55, 32, 45]).background(Color.blue)
            

                LineView(data: [6, 6, 78, 2, 55, 32, 45]).background(Color.blue)

        }
        
    }
}

struct CellGraph_Previews: PreviewProvider {
    static var previews: some View {
        CellGraph()
    }
}
