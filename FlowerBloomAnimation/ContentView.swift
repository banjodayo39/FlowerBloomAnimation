//
//  ContentView.swift
//  FlowerBloomAnimation
//
//  Created by Dayo Banjo on 10/10/22.
//

import SwiftUI

struct ContentView: View {
        
    let tick = Timer.publish(every: 2, on: .main,
                             in: .common).autoconnect()
        @State var redraw = false
        @State var adjustmentX:CGFloat = 8
        @State var adjustmentY:CGFloat = 8
        @State var function:Int = 0
        @State var scale2: CGFloat = 0
        @State var lineWIdth : CGFloat = 2
        @State private var rotation : Double = 0
        @State var toogleSegment = false
        
        var foreverAnimation =
        Animation.linear.speed(0.2)
            .repeatForever(autoreverses: false)
        
        @ObservedObject var values = Figures.shared
        
        var body: some View {
            ZStack {
                
                AnimatedBackground().edgesIgnoringSafeArea(.all)
                    .blur(radius: 50)                
                
                if toogleSegment{
                    ForEach (0...20, id: \.self) { zak in
                        FlowerCurveSegment2()
                            .stroke(addLineColor(shade: Double((zak * 18))), lineWidth:lineWIdth)
                            .opacity(0.8)
                            .frame(width: 128, height: 128, alignment: .center)
                            .id(redraw)
                            .background(InnerView())
                            .scaleEffect(1 + (scale2 * 1.5))
                            .rotationEffect(.degrees(Double(18 * zak)), anchor: .center)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(foreverAnimation) {
                                        scale2 = 1
                                    }
                                }
                                for delay in 1...10 {
                                    let delayInSeconds = Double(delay)
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                        lineWIdth += 1
                                        if lineWIdth >= 10 {
                                            lineWIdth = 2
                                        }
                                        
                                    }
                                }
                            }
                    }
                } else {
                    ForEach (0...20, id: \.self) { zak in
                        FlowerCurveSegment1(function: function)
                            .stroke(addLineColor(shade: Double((zak * 18))), lineWidth:lineWIdth)
                            .opacity(0.8)
                            .frame(width: 256, height: 256, alignment: .center)
                            .id(redraw)
                            .background(InnerView())
                            .scaleEffect(1 + (scale2 * 1.5))
                            .rotationEffect(.degrees(Double(18 * zak)), anchor: .center)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(foreverAnimation) {
                                        toogleSegment.toggle()
                                    }
                                }
                                for delay in 1...10 {
                                    let delayInSeconds = Double(delay)
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                                        lineWIdth += 1
                                        if lineWIdth >= 10 {
                                            lineWIdth = 2
                                        }
                                        
                                    }
                                }
                            }
                    }
                }
          
                Color.clear
                    .onReceive(tick) { (_) in
                        function = (function + 1) % 16
                    }               
            }            
    }
}


func addLineColor(shade: Double) -> Color {
    let hue2U = Double(shade / 60)
    let color = Color.init(hue: hue2U, saturation: 1.0, brightness: 0.4, opacity: 1.0)
    
    return color
}

struct InnerView: View {
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .onAppear {
                    print("geo \(geo.frame(in: .global).minX) \(geo.frame(in: .global).minY)")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
