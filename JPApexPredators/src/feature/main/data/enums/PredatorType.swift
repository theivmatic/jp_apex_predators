//
//  PredatorType.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import Foundation
import SwiftUI

enum PredatorType {
    case land
    case air
    case sea
    
    static func fromString(_ value: String) -> PredatorType {
        switch value {
        case "land":
            .land
        case "air":
            .air
        case "sea":
            .sea
        default:
            .land
        }
    }
    
    var title: String {
        switch self {
        case .land:
            "Land"
        case .air:
            "Air"
        case .sea:
            "Sea"
        }
    }
    
    var color: Color {
        switch self {
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        }
    }
}
