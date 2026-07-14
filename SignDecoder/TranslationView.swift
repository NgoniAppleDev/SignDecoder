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
    var isProcessing: Bool
    
    @State private var showingTranslation = false
    
    var body: some View {
        VStack {
            Text("Identified Text")
                .font(.subheadline.bold())
                .textCase(.uppercase)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .topLeading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.secondarySystemBackground))
                )
                .overlay {
                    if isProcessing {
                        ProgressView()
                    }
                }
                .translationPresentation(isPresented: $showingTranslation, text: text)
            
            Button {
                showingTranslation = true
            } label: {
                Text("Translate")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .font(.title2.bold())
            }
            .disabled(text.isEmpty)
            .buttonStyle(.glassProminent)
            .padding(.top)
        }
    }
}

#Preview("Processed") {
    TranslationView(text: "Caution, falling rocks", isProcessing: false)
}

#Preview("is Processing") {
    TranslationView(text: "", isProcessing: true)
}
