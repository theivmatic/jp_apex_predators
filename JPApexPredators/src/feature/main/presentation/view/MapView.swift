//
//  MapView.swift
//  JPApexPredators
//
//  Created by Александр on 02.11.2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    let image: String
    @State var cameraPosition: MapCameraPosition
    let location: CLLocationCoordinate2D
    let predators: [ApexPredatorEntity]
    @State var satellite: Bool = false
    
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(predators) {predator in
                Annotation(
                    "",
                    coordinate: predator.location
                ) {
                    
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                        .scaleEffect(x: -1)
                }
                
            }
        }
        .mapStyle(
            satellite
                  ? .imagery(elevation: .realistic)
                  : .standard(elevation: .realistic)
        )
        .overlay(alignment: .bottomTrailing) {
            Button{
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(.trailing, 8)
            }
        }
        .task {
            cameraPosition = .camera(
                MapCamera(
                    centerCoordinate: location,
                    distance: 1000,
                    heading: 250,
                    pitch: 80,
                )
            )
        }
    }
}

#Preview {
    MapView(
        image: "indominusrex",
        cameraPosition: .camera(
            MapCamera(
                centerCoordinate: CLLocationCoordinate2D(
                    latitude: 28.5729,
                    longitude: -80.6490,
                ),
                distance: 1000,
                heading: 250,
                pitch: 80,
            )
        ),
        location: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        predators: []
    )
}
