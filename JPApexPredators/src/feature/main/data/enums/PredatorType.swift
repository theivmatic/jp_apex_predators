//
//  PredatorType.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import Foundation
import SwiftUI

enum PredatorType: CaseIterable, Identifiable {
    var id: PredatorType {
        self
    }
    
    case all
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
        case .all:
            "All"
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
        case .all:
            .black
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        }
    }
    
    var icon: String {
        switch self {
        case .all:
                "square.stack.3d.up.fill"
        case .land:
                "leaf.fill"
        case .air:
                "wind"
        case .sea:
                "drop.fill"
        }
    }
}
