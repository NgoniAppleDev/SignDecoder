//
//  TranslationView.swift
//  SignDecoder
//
//  Created by Ngoni Katsidzira  on 14/7/2026.
//

import SwiftUI
import Translation

struct TranslationView: View {
    
    var text: String
    @State private var showingTranslation = false
    
    var body: some View {
        VStack {
            Text("Identified Text")
                .font(.subheadline.bold())
                .textCase(.uppercase)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .topLeading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(white: 0.9))
                )
                .translationPresentation(isPresented: $showingTranslation, text: text)
            
            Button {
                showingTranslation = true
            } label: {
                Text("Translate")
            }
            .buttonStyle(.glassProminent)
        }
    }
}

#Preview {
    TranslationView(text: "Caution, falling rocks")
}
