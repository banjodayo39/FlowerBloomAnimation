//
//  FlowerCurveSegment1.swift
//  FlowerBloomAnimation
//
//  Created by Dayo Banjo on 10/10/22.
//

import SwiftUI

struct FlowerCurveSegment1: Shape {
    @ObservedObject var values = Figures.shared
    @State var function: Int
    
    func path(in rect: CGRect) -> Path {
        
        values.controls.feed1 = CGPoint(x:rect.midX + values.controls.control1.x,y:rect.midY - values.controls.control1.y)
        values.controls.feed2 = CGPoint(x:rect.midX - values.controls.control2.x,y:rect.midY + values.controls.control2.y)
        values.controls.rectX = rect
        
        
        
        
        var path = Path()
        let center:CGPoint = CGPoint(x: rect.midX,y: rect.midX - 64)
        let backer:CGPoint = CGPoint(x: rect.midX,y: rect.midY + 64)
        
        let com1A:CGPoint = CGPoint(x: rect.midX + values.controls.control1.x, y: rect.midX + values.controls.control1.y)
        let com2A:CGPoint = CGPoint(x: rect.midX + values.controls.control1.x, y: rect.midX - values.controls.control1.y)
        let com3A:CGPoint = CGPoint(x: rect.midX - values.controls.control1.x, y: rect.midX + values.controls.control1.y)
        let com4A:CGPoint = CGPoint(x: rect.midX - values.controls.control1.x, y: rect.midX - values.controls.control1.y)
        
        let com1B:CGPoint = CGPoint(x: rect.midX + values.controls.control2.x, y: rect.midX + values.controls.control2.y)
        let com2B:CGPoint = CGPoint(x: rect.midX + values.controls.control2.x, y: rect.midX - values.controls.control2.y)
        let com3B:CGPoint = CGPoint(x: rect.midX - values.controls.control2.x, y: rect.midX + values.controls.control2.y)
        let com4B:CGPoint = CGPoint(x: rect.midX - values.controls.control2.x, y: rect.midX - values.controls.control2.y)
        
        print("function ",function)
        path.move(to: CGPoint(x: center.x, y: center.y))
        switch function {
            case 0:
                path.addCurve(to: backer, control1: com1A, control2: com1B)
            case 1:
                path.addCurve(to: backer, control1: com1A, control2: com2B)
            case 2:
                path.addCurve(to: backer, control1: com1A, control2: com3B)
            case 3:
                path.addCurve(to: backer, control1: com1A, control2: com4B)
            case 4:
                path.addCurve(to: backer, control1: com2A, control2: com1B)
            case 5:
                path.addCurve(to: backer, control1: com2A, control2: com2B)
            case 6:
                path.addCurve(to: backer, control1: com2A, control2: com3B)
            case 7:
                path.addCurve(to: backer, control1: com2A, control2: com4B)
            case 8:
                path.addCurve(to: backer, control1: com3A, control2: com1B)
            case 9:
                path.addCurve(to: backer, control1: com3A, control2: com2B)
            case 10:
                path.addCurve(to: backer, control1: com3A, control2: com3B)
            case 11:
                path.addCurve(to: backer, control1: com3A, control2: com4B)
            case 12:
                path.addCurve(to: backer, control1: com4A, control2: com1B)
            case 13:
                path.addCurve(to: backer, control1: com4A, control2: com2B)
            case 14:
                path.addCurve(to: backer, control1: com4A, control2: com3B)
            case 15:
                path.addCurve(to: backer, control1: com4A, control2: com4B)
                
            default:
                break
        }
        
        
        return path
    }
}
