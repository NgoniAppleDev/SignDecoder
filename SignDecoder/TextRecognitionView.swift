//
//  TextRecognitionView.swift
//  SignDecoder
//
//  Created by Ngoni Katsidzira  on 14/7/2026.
//

import SwiftUI

struct TextRecognitionView: View {
    
    let imageResource: ImageResource
    @State private var textRecognizer: TextRecognizer?
    
    var body: some View {
        VStack {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(cornerRadius: 8))
                .task {
                    textRecognizer = await TextRecognizer(imageResource: imageResource)
                }
            
            Spacer()
            
            TranslationView(text: textRecognizer?.recognizedText ?? "")
        }
        .padding()
        .navigationTitle("Sign Info")
    }
}

#Preview {
    NavigationStack {
        TextRecognitionView(imageResource: .sign1)
            .navigationBarTitleDisplayMode(.inline)
    }
}
