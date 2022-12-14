//
//  Figures.swift
//  FlowerBloomAnimation
//
//  Created by Dayo Banjo on 10/10/22.
//

import SwiftUI

final class Figures: ObservableObject {
    static var shared = Figures()
    var previous: Int = 0
    @Published var controls = Chart(control1: CGPoint(x: 128, y: 0), control2: CGPoint(x: 128, y: 0))
}

struct Chart: Identifiable {
    var id = UUID()
    var control1: CGPoint = CGPoint.zero
    var control2: CGPoint = CGPoint.zero
    var feed1: CGPoint = CGPoint.zero
    var feed2: CGPoint = CGPoint.zero
    var rectX: CGRect = CGRect.zero
}


