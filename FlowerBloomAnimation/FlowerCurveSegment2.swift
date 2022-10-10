//
//  FlowerShape.swift
//  FlowerBloomAnimation
//
//  Created by Dayo Banjo on 10/10/22.
//

import SwiftUI

struct FlowerCurveSegment2: Shape {
    @ObservedObject var values = Figures.shared
    
    func path(in rect: CGRect) -> Path {
        
        values.controls.feed1 = CGPoint(x:rect.midX + values.controls.control1.x,y:rect.midY - values.controls.control1.y)
        values.controls.feed2 = CGPoint(x:rect.midX - values.controls.control2.x,y:rect.midY + values.controls.control2.y)
        values.controls.rectX = rect
        
        var path = Path()
        let center:CGPoint = CGPoint(x: rect.midX,y: rect.midY)
        path.move(to: CGPoint(x: center.x, y: center.y))
        path.addCurve(to: CGPoint(x:rect.midX,y: rect.midY), control1: CGPoint(x:rect.midX - 64,y:rect.midY - 64), control2: CGPoint(x: rect.midX - 64,y:rect.midY + 64))
        path.addCurve(to: CGPoint(x:rect.midX,y: rect.midY), control1: CGPoint(x:rect.midX - 64,y:rect.midY + 64), control2: CGPoint(x: rect.midX + 64,y:rect.midY + 64))
        path.addCurve(to: CGPoint(x:rect.midX,y: rect.midY), control1: CGPoint(x:rect.midX + 64,y:rect.midY - 64), control2: CGPoint(x: rect.midX - 64,y:rect.midY - 64))
        path.addCurve(to: CGPoint(x:rect.midX,y: rect.midY), control1: CGPoint(x:rect.midX + 64,y:rect.midY + 64), control2: CGPoint(x: rect.midX + 64,y:rect.midY - 64))
        print("path ",path.description)
        return path
    }
}

