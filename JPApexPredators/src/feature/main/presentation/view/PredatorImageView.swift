//
//  PredatorImageView.swift
//  JPApexPredators
//
//  Created by Александр on 02.11.2026.
//

import SwiftUI

struct PredatorImageView: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .scaleEffect(x: -1)
    }
}

#Preview {
    PredatorImageView(image: "")
}
