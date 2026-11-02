//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State private var predators: [ApexPredatorEntity] = []
    @Environment(\.colorScheme) var theme
    @State private var input: String = ""
    @State private var alphabetical: Bool = false
    var filteredData: [ApexPredatorEntity] {
        let filteredData = ApiClient.filter(by: filterSelection, in: predators)
        let sortedData = ApiClient.sort(by: alphabetical, in: filteredData.isEmpty ? predators : filteredData)
        
        return ApiClient.search(for: input, in: sortedData)
    }
    @State private var filterSelection: PredatorType = .all
    
    var body: some View {
        NavigationStack {
            if filteredData.isEmpty {
                Text("No data")
            }
            
            List(filteredData) {predator in
                NavigationLink() {
                    DetailsView( 
                        predator: predator,
                        location: .camera(
                            MapCamera(
                                centerCoordinate: CLLocationCoordinate2D(
                                    latitude: predator.latitude,
                                    longitude: predator.longitude
                                ),
                                distance: 30000
                            )
                        ),
                        predators: predators,
                    )
                } label: {
                    PredatorCard(predator: predator)
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $input, placement: .navigationBarDrawer)
            .autocorrectionDisabled()
            .animation(.default, value: input)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "textformat" : "film")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $filterSelection.animation()) {
                            ForEach(PredatorType.allCases) {type in
                                Label(type.title, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
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
