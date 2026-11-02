//
//  ApiClient.swift
//  JPApexPredators
//
//  Created by Александр on 27.10.2026.
//

import Foundation

class ApiClient {
    static func decodeData() -> [ApexPredatorEntity] {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode([ApexPredatorEntity].self, from: data)
                
                return decodedData
                
            } catch {
                print("Decoding error: \(error)")
            }
        }
        
        
        return []
    }
    
   static func search(for input: String, in predators: [ApexPredatorEntity]) -> [ApexPredatorEntity] {
        if input.isEmpty {
            return predators
        } else {
            return predators.filter {predator in
                predator.name.localizedCaseInsensitiveContains(input)
            }
        }
    }
    
    static func sort(by alphabetical: Bool, in predators: [ApexPredatorEntity]) -> [ApexPredatorEntity] {
        var data = predators
        
        data.sort { a, b in
           if alphabetical {
               a.name < b.name
           } else {
               a.id < b.id
           }
        }
        
        return data
    }
    
    static func filter(by type: PredatorType, in predators: [ApexPredatorEntity]) -> [ApexPredatorEntity] {
        var data = predators
        
        return data.filter {predator in
            predator.typeT == type
        }
    }
}
