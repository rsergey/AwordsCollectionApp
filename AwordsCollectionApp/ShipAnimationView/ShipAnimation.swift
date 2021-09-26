//
//  ShipAnimation.swift
//  AwordsCollectionApp
//
//  Created by Sergey on 26.09.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ShipAnimation: View {
    let width: CGFloat
    let height: CGFloat
    
    private var minsize: CGFloat {
        min(width, height)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            
            Color.init(#colorLiteral(red: 0.9070051355, green: 0.9749092489, blue: 1, alpha: 1))
            Waves(width: size, height: size, duration: 5)
                .shadow(radius: 1)
                .offset(x: -0.12 * size, y: 0.06 * size)
            Ship(width: 0.9 * size, height: 0.9 * size)
                .shadow(radius: 1)
                .offset(x: 0.05 * size, y: -0.2 * size)
            Waves(width: size, height: size, duration: 2.5)
                .shadow(radius: 3)
                .offset(x: -0.04 * size, y: 0.14 * size)
        }
        .frame(width: minsize, height: minsize)
        .cornerRadius(minsize / 2)
        .shadow(radius: 1)
    }
}

struct ShipAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ShipAnimation(width: 250, height: 250)
    }
}
