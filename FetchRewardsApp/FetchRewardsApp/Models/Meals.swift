//
//  Meals.swift
//  FetchRewardsApp
//
//  Created by Tavon Gibbs on 9/10/21.
//

import Foundation

struct DetailResponse: Decodable {
    let meals: [Recipe]
}

struct Recipe: Decodable {
    let description: String
    let instructions: String
    let ingredients: [Ingredient]
    
    struct Ingredient {
        let name: String
        let measurement: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case description = "strMeal"
        case instructions = "strInstructions"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        
        var ingredients = [Ingredient]()
        
        // iterate over all of the ingredient/measurement pairs to create `Ingredient` instances for the ingedients array
        
        for i in 1...20 {
            let ingredientKey = "strIngredient\(i)"
            let measurementKey = "strMeasure\(i)"
            
            do {
                let name = try decoder.decode(ingredientKey, as: String.self)
                let measurement = try decoder.decode(measurementKey, as: String.self)
                
                guard name.isEmpty == false, measurement.isEmpty == false else { continue }
                
                ingredients.append(Ingredient(name: name, measurement: measurement))
            } catch {
                continue
            }
        }
        

        self.ingredients = ingredients
    }
}

private extension Decoder {
    /// Decode a singular value from the underlying data.
    func decodeSingleValue<T: Decodable>(as type: T.Type = T.self) throws -> T {
        let container = try singleValueContainer()
        return try container.decode(type)
    }

    /// Decode a value for a given key, specified as a string.
    func decode<T: Decodable>(_ key: String, as type: T.Type = T.self) throws -> T {
        return try decode(AnyCodingKey(key), as: type)
    }

    /// Decode a value for a given key, specified as a `CodingKey`.
    func decode<T: Decodable, K: CodingKey>(_ key: K, as type: T.Type = T.self) throws -> T {
        let container = try self.container(keyedBy: K.self)
        return try container.decode(type, forKey: key)
    }
}

private struct AnyCodingKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init(_ string: String) {
        stringValue = string
    }

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }
}
