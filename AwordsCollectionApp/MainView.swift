//
//  ContentView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var showAward = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(showAward ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showAward ? 2 : 1)
                        .rotationEffect(.degrees(showAward ? 0 : 180))
                }
            }
            Spacer()
            if showAward {
                ShipAnimation(width: 250, height: 250)
                    .transition(.shipAnimationViewTransition)
            }
            
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
}

extension AnyTransition {
    static var shipAnimationViewTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .top).combined(with: .scale).animation(Animation.spring(response: 0.5,
                                                                                                         dampingFraction: 0.5,
                                                                                                         blendDuration: 0.9))
        
        let removal = AnyTransition.scale.combined(with: .opacity)
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
