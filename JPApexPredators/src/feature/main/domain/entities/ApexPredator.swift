//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import Foundation
import SwiftUI
import MapKit

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
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
