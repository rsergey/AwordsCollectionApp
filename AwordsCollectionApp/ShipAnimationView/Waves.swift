//
//  Waves.swift
//  AwordsCollectionApp
//
//  Created by Sergey on 26.09.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct Waves: View {
    let width: CGFloat
    let height: CGFloat
    let duration: Double
    
    private var minsize: CGFloat {
        min(width, height)
    }
    
    @State private var movingWaves = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: size * 0.50))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.20, y: size * 0.50),
                    control: CGPoint(x: size * 0.10, y: size * 0.45))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.40, y: size * 0.50),
                    control: CGPoint(x: size * 0.30, y: size * 0.55))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.60, y: size * 0.50),
                    control: CGPoint(x: size * 0.50, y: size * 0.45))
                path.addQuadCurve(
                    to: CGPoint(x: size * 0.80, y: size * 0.50),
                    control: CGPoint(x: size * 0.70, y: size * 0.55))
                path.addQuadCurve(
                    to: CGPoint(x: size * 1.00, y: size * 0.50),
                    control: CGPoint(x: size * 0.90, y: size * 0.45))
                path.addQuadCurve(
                    to: CGPoint(x: size * 1.20, y: size * 0.50),
                    control: CGPoint(x: size * 1.10, y: size * 0.55))
                path.addQuadCurve(
                    to: CGPoint(x: size * 1.40, y: size * 0.50),
                    control: CGPoint(x: size * 1.30, y: size * 0.45))
                path.addQuadCurve(
                    to: CGPoint(x: size * 1.60, y: size * 0.50),
                    control: CGPoint(x: size * 1.50, y: size * 0.55))
                path.addLine(to: CGPoint(x: size * 1.60, y: size * 1.00))
                path.addLine(to: CGPoint(x: 0, y: size))
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color.init(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]),
                                 startPoint: UnitPoint(x: 0.5, y: 1),
                                 endPoint: UnitPoint(x: 0.5, y: 0.5)))
        }
        .frame(width: width, height: height)
        .offset(x: movingWaves ? -0.4 * minsize : 0)
        .animation(Animation.linear(duration: duration)
                    .repeatForever(autoreverses: false))
        .onAppear() {
            self.movingWaves.toggle()
        }
    }
}

struct Waves_Previews: PreviewProvider {
    static var previews: some View {
        Waves(width: 100, height: 100, duration: 5)
    }
}
