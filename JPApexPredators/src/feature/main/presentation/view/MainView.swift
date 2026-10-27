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
    @State private var input: String = ""
    var filteredData: [ApexPredatorEntity] {
        if input.isEmpty {
            return predators
        } else {
            return predators.filter {predator in
                predator.name.localizedCaseInsensitiveContains(input)
            }
        }
            
    }
    
    var body: some View {
        NavigationStack {
            if filteredData.isEmpty {
                Text("No data")
            }
            
            List(filteredData) {predator in
                NavigationLink() {
                    Image(predator.image)
                        .resizable().scaledToFit()
                } label: {
                    PredatorCard(predator: predator)
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $input, placement: .navigationBarDrawer)
            .autocorrectionDisabled()
            .animation(.default, value: input)
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
