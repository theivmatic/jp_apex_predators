//
//  PredatorCard.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import SwiftUI

struct PredatorCard: View {
    let predator: ApexPredatorEntity
    @Environment(\.colorScheme) var theme
    
    var body: some View {
        HStack {
            Image(predator.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: theme == .dark ? .white : .black, radius: 1)
            
            VStack(alignment: .leading) {
                Text(predator.name)
                    .fontWeight(.bold)
                
                Text(predator.typeT.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding([.leading, .trailing], 13)
                    .padding([.top, .bottom], 5)
                    .background(predator.typeT.color)
                    .containerShape(.capsule)
            }
        }
    }
}

//#Preview {
//    PredatorCard()
//}
