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
        ScrollView(showsIndicators: false) {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .task {
                    textRecognizer = await TextRecognizer(imageResource: imageResource)
                }
            
            TranslationView(text: textRecognizer?.recognizedText ?? "...")
                .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        TextRecognitionView(imageResource: .sign1)
            .navigationBarTitleDisplayMode(.inline)
    }
}
