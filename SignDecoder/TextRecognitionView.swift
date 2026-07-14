//
//  TextRecognitionView.swift
//  SignDecoder
//
//  Created by Ngoni Katsidzira  on 14/7/2026.
//

import SwiftUI
import Vision

struct TextRecognitionView: View {
    
    let imageResource: ImageResource
    let boundingColor = Color.orange
    @State private var textRecognizer: TextRecognizer?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Image(imageResource)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .task {
                    textRecognizer = await TextRecognizer(imageResource: imageResource)
                }
                .overlay {
                    if let observations = textRecognizer?.observations {
                        ForEach(observations, id: \.uuid) { observation in
                            BoundsRect(normalizedRect: observation.boundingBox)
                                .stroke(boundingColor, lineWidth: 3)
                        }
                    }
                }
            
            TranslationView(text: textRecognizer?.recognizedText ?? "", isProcessing: isProcessing)
                .padding()
        }
        .ignoresSafeArea()
    }
    
    private var isProcessing: Bool {
        textRecognizer == nil
    }
}

#Preview {
    TextRecognitionView(imageResource: .sign1)
        .navigationBarTitleDisplayMode(.inline)
}
