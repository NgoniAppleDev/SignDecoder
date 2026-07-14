//
//  TrailTheme.swift
//  SignDecoder
//
//  Created by Ngoni Katsidzira  on 14/7/2026.
//

import SwiftUI

struct TrailTheme: ViewModifier {
    
    func body(content: Content) -> some View {
        
        ZStack {
            VStack {
                Image(.background)
                    .resizable()
                    .ignoresSafeArea(.all)
//                    .frame(maxHeight: 250, alignment: .top)
                    .offset(y: -300)
                
                Spacer()
            }
            
            content
        }
    }
}

extension View {
    func trailTheme() -> some View {
        modifier(TrailTheme())
    }
}
