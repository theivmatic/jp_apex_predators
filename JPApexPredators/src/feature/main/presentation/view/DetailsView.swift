//
//  Details.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import SwiftUI

struct DetailsView: View {
    let predator: ApexPredatorEntity
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Background image
                    Image(predator.type)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .clear, location: 0.9),
                                    Gradient.Stop(
                                        color: colorScheme == .dark
                                            ? .black
                                            : .white,
                                        location: 1,
                                    ),
                                ],
                                startPoint: .top,
                                endPoint: .bottom,
                            )
                        }

                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.5)
                        //to flip image horrizontaly
                        .scaleEffect(x: -1)
                        //
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach (predator.movies, id: \.self) {movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    Text("Movie moments:")
                        .font(.title)
                        .padding(.top, 16)
                    
                    ForEach (predator.movieScenes) {scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 16)
                    }
                    
                    Text("Read more:")
                        .font(.caption)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .padding(.bottom, 32)

                        
                }
                .padding(16)
                .frame(width: geo.size.width, alignment: .leading)
                
                
                    
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DetailsView(
        predator: ApexPredatorEntity(
            id: 1,
            name: "Dolboeb",
            type: "land",
            latitude: 10.5,
            longitude: -10.5,
            movies: ["1", "2", "3"],
            movieScenes: [
                MovieSceneEntity(
                    id: 1, 
                    movie: "Huynya",
                    sceneDescription: "Mnogo Huyni"
                ),
                MovieSceneEntity(
                    id: 2,
                    movie: "Pizda",
                    sceneDescription: "Mnogo Huyni"
                ),
            ],
            link: "https://google.com",
        )
    )
}
