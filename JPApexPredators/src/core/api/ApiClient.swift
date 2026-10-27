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
}
