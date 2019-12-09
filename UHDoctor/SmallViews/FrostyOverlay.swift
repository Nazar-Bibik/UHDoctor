//
//  FrostyOverlay.swift
//  UHDoctor
//
//  Created by Nazar on 07/12/2019.
//  Copyright © 2019 N Personal Team. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


struct FrostyOverlay: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
