//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import SwiftUI

struct MainView: View {
    @State private var predators: [ApexPredatorEntity] = []
    @Environment(\.colorScheme) var theme
    
    var body: some View {
        List(predators) {predator in
            PredatorCard(predator: predator)
        }
        .task {
            let data = ApiClient.decodeData()
            
            predators = data
        }
    }
}

#Preview {
    MainView()
}
