//
//  Ship.swift
//  AwordsCollectionApp
//
//  Created by Sergey on 26.09.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct Ship: View {
    let width: CGFloat
    let height: CGFloat
    
    private var minsize: CGFloat {
        min(width, height)
    }
    
    @State private var shipRotation = false
    @State private var shipUpDown = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            
            //Back
            Path { path in
                path.move(to: CGPoint(x: size, y: 0.75 * size))
                path.addLine(to: CGPoint(x: 0.75 * size, y: size))
                path.addLine(to: CGPoint(x: 0.50 * size, y: 0.80 * size))
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 1, green: 0.7404000163, blue: 0.02821802534, alpha: 1)), Color.init(#colorLiteral(red: 0.9931477904, green: 0.751506865, blue: 0.02543621138, alpha: 1))]),
                                 startPoint: UnitPoint(x: 1, y: 0.75),
                                 endPoint: UnitPoint(x: 0.50, y: 1)))
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0.75 * size))
                path.addLine(to: CGPoint(x: 0.25 * size, y: size))
                path.addLine(to: CGPoint(x: 0.50 * size, y: 0.80 * size))
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.751791954, green: 0.606944561, blue: 0.134096235, alpha: 1)), Color.init(#colorLiteral(red: 0.975731194, green: 0.8204561472, blue: 0.0318299979, alpha: 1))]),
                                 startPoint: UnitPoint(x: 0, y: 0.75),
                                 endPoint: UnitPoint(x: 0.50, y: 1)))
            
            Path { path in
                path.move(to: CGPoint(x: 0.50 * size, y: 0.6 * size))
                path.addLine(to: CGPoint(x: 0.25 * size, y: size))
                path.addLine(to: CGPoint(x: 0.50 * size, y: size))
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.9880626798, green: 0.9714248776, blue: 0.5187615752, alpha: 1)), Color.init(#colorLiteral(red: 0.9993395209, green: 0.8733555079, blue: 0.1301254928, alpha: 1))]),
                                 startPoint: UnitPoint(x: 0.3, y: 0.75),
                                 endPoint: UnitPoint(x: 0.5, y: 0.75)))
            
            Path { path in
                path.move(to: CGPoint(x: 0.50 * size, y: 0.6 * size))
                path.addLine(to: CGPoint(x: 0.75 * size, y: size))
                path.addLine(to: CGPoint(x: 0.50 * size, y: size))
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8832655461, green: 0.6995705293, blue: 0.1484854788, alpha: 1)), Color.init(#colorLiteral(red: 0.8631133625, green: 0.6738869485, blue: 0.1747809253, alpha: 1))]),
                                 startPoint: UnitPoint(x: 0.7, y: 0.75),
                                 endPoint: UnitPoint(x: 0.5, y: 0.75)))
            
            //Front
            Path { path in
                path.move(to: CGPoint(x: size, y: 0.75 * size))
                path.addLine(to: CGPoint(x: 0.75 * size, y: size))
                path.addLine(to: CGPoint(x: 0.50 * size, y: 0.90 * size))
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8990569451, green: 0.5851466478, blue: 0.1459126293, alpha: 1)), Color.init(#colorLiteral(red: 0.7526640223, green: 0.5965770548, blue: 0.168179194, alpha: 1))]),
                                 startPoint: UnitPoint(x: 1, y: 0.75),
                                 endPoint: UnitPoint(x: 0.50, y: 1)))
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0.75 * size))
                path.addLine(to: CGPoint(x: 0.25 * size, y: size))
                path.addLine(to: CGPoint(x: 0.50 * size, y: 0.90 * size))
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8863273263, green: 0.7094842792, blue: 0.1310074031, alpha: 1)), Color.init(#colorLiteral(red: 0.8931741714, green: 0.7387374043, blue: 0.1160176769, alpha: 1))]),
                                 startPoint: UnitPoint(x: 0, y: 0.75),
                                 endPoint: UnitPoint(x: 0.50, y: 1)))
            
            Path { path in
                path.move(to: CGPoint(x: 0.50 * size, y: 0.90 * size))
                path.addLine(to: CGPoint(x: 0.75 * size, y: size))
                path.addLine(to: CGPoint(x: 0.25 * size, y: size))
                
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.7554556727, green: 0.591624558, blue: 0.1685701907, alpha: 1)), Color.init(#colorLiteral(red: 0.8966104984, green: 0.7459986806, blue: 0.1461572051, alpha: 1))]),
                                 startPoint: UnitPoint(x: 0.5, y: 1),
                                 endPoint: UnitPoint(x: 0.5, y: 0.9)))
        }
        .frame(width: width, height: height)
        .rotationEffect(.degrees(shipRotation ? -8 : 5), anchor: .bottom)
        .offset(y: shipUpDown ? -0.04 * minsize : 0.04 * minsize)
        .animation(Animation.easeInOut(duration: 2.4)
                    .delay(0.1)
                    .repeatForever(autoreverses: true))
        .onAppear() {
            self.shipRotation.toggle()
            self.shipUpDown.toggle()
        }
    }
    
}

struct Ship_Previews: PreviewProvider {
    static var previews: some View {
        Ship(width: 100, height: 100)
    }
}
