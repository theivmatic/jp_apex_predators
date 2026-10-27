//
//  MovieScene.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import Foundation

struct MovieSceneEntity: Decodable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
