//
//  ImageGalleryView.swift
//  SignDecoder
//
//  Created by Ngoni Katsidzira  on 14/7/2026.
//

import SwiftUI

struct ImageGalleryView: View {
    
    let itemSize = 100.0
    
    let imageResources: [[ImageResource]] = [
        [.sign1, .sign2, .sign3],
        [.sign4, .sign5, .sign6],
        [.sign7, .sign8, .sign9]
    ]
    
    var body: some View {
        
        Grid {
            ForEach(imageResources, id: \.self) { resourceRow in
                GridRow {
                    ForEach(resourceRow, id: \.self) { resource in
                        NavigationLink(value: resource) {
                            Image(resource)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: itemSize, height: itemSize)
                                .clipShape(.rect(cornerRadius: 8))
                                .padding(10)
                        }
                    }
                }
            }
        }
        .navigationDestination(for: ImageResource.self) { resource in
            TextRecognitionView(imageResource: resource)
        }
        
    }
}

#Preview {
    NavigationStack {
        ImageGalleryView()
    }
}
