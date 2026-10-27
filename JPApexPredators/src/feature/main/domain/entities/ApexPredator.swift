//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import Foundation
import SwiftUI

struct ApexPredatorEntity: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieSceneEntity]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var typeT: PredatorType {
         PredatorType.fromString(type)
    }
}
