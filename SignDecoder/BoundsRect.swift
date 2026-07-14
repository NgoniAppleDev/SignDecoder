//
//  BoundsRect.swift
//  SignDecoder
//
//  Created by Ngoni Katsidzira  on 14/7/2026.
//

import SwiftUI
import Vision

struct BoundsRect: Shape {
    
    let normalizedRect: NormalizedRect
    
    nonisolated func path(in rect: CGRect) -> Path {
        
        let imageCoordinatesRect = normalizedRect.toImageCoordinates(rect.size, origin: .upperLeft)
        return Path(imageCoordinatesRect)
    }
}
