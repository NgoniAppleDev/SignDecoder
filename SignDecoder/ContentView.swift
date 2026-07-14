//
//  ContentView.swift
//  SignDecoder
//
//  Created by Ngoni Katsidzira  on 14/7/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 50) {
                    Text("Tap to select a sign to translate")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    ImageGalleryView()
                }
            }
            .trailTheme()
            .navigationTitle("Sign Decoder")
            .toolbarColorScheme(.light, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
