//
//  QuickSearchView.swift
//  UHDoctor
//
//  Created by Nazar on 29/11/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import SwiftUI

struct QuickSearchView: View {
    var body: some View {
        List{
            SearchBar(text: .constant(""))
        }
    .navigationBarTitle("Quick Search")
    }
}

struct QuickSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchView()
    }
}
